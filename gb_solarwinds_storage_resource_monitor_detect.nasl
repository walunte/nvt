###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_solarwinds_storage_resource_monitor_detect.nasl 7166 2017-09-18 09:14:09Z cfischer $
#
# SolarWinds Storage Resource Monitor Remote Version Detection
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809426");
  script_version("$Revision: 7166 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-09-18 11:14:09 +0200 (Mon, 18 Sep 2017) $");
  script_tag(name:"creation_date", value:"2016-10-03 15:20:26 +0530 (Mon, 03 Oct 2016)");
  script_name("SolarWinds Storage Resource Monitor Remote Version Detection");
  script_tag(name : "summary" , value : "Detection of installed version of
  SolarWinds Storage Resource Monitor.

  This script sends HTTP GET request and try to get the version from the
  response.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 9000);
  script_exclude_keys("Settings/disable_cgi_scanning");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

## Variable initialization
srmport = 0;
req = "";
buf = "";
cookie = "";
res = "";
version = "";

##Get HTTP Port
if(!srmport = get_http_port(default:9000)){
  exit(0);
}

host = get_host_name();

data =  "loginState=checkLogin&loginName=admin&password=";

req = http_post_req( port:srmport,
                     url:'/LoginServlet',
                     data:data,
                     accept_header:'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
                     add_headers: make_array("Content-Type", "application/x-www-form-urlencoded") );

buf = http_keepalive_send_recv( port:srmport, data:req, bodyonly:FALSE );

##confirm the application
if(buf =~ "HTTP/1\.. 200" && "SolarWinds - Storage Manager" ><  buf)
{
  cookie = eregmatch( pattern:"Set-Cookie: ([0-9a-zA-Z=]+);", string:buf );
  if(!cookie[1]){
    exit(0);
  }

  #Send Request and Receive response
  req = string("GET /LicenseManager.do?actionName=showLicenseManager HTTP/1.1\r\n",
               "Host: ", host, "\r\n",
               "Cookie: ", cookie[1], "\r\n",
               "Connection: keep-alive\r\n\r\n");
  res = http_keepalive_send_recv(port:srmport, data:req);

  ## Grep the version from response
  vers = eregmatch(pattern:"Storage Manager  ?v([0-9.]+)", string:res);
  if(vers[1]){
    version = vers[1];
  }
  else{
    version ="Unknown";
  }

  ## Set the KB
  set_kb_item(name:"www/" + port + "/Storage_Manager", value:version);
  set_kb_item(name:"storage_manager/Installed", value:TRUE);

  ## build cpe and store it as host_detail

  cpe = build_cpe(value:version, exp:"([0-9.]+)", base:"cpe:/a:solarwinds:storage_resource_monitor:");
  if(!cpe)
    cpe= "cpe:/a:solarwinds:storage_resource_monitor";

  register_product(cpe:cpe, location:"/", port:srmport);

  log_message(data: build_detection_report(app: "SolarWinds Storage Resource Monitor",
                                           version: version,
                                           install: "/",
                                           cpe: cpe,
                                           concluded: version),
                                           port: srmport);
exit(0);
}
exit(0);
