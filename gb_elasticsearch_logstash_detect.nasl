###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_elasticsearch_logstash_detect.nasl 50069 2016-06-23 15:43:25 +0530 June$
#
# Elasticsearch Logstash Version Detection
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
  script_oid("1.3.6.1.4.1.25623.1.0.808093");
  script_version("$Revision: 7000 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-08-24 13:51:46 +0200 (Thu, 24 Aug 2017) $");
  script_tag(name:"creation_date", value:"2016-06-21 12:44:48 +0530 (Tue, 21 Jun 2016)");
  script_name("Elasticsearch Logstash Version Detection");

  script_tag(name : "summary" , value : "Check for the version of Elasticsearch
  Logstash.

  This script sends HTTP GET request and try to get the version of
  Elasticsearch Logstash from the response, and sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl","http_version.nasl");
  script_require_ports("Services/www", 9200);
  script_exclude_keys("Settings/disable_cgi_scanning");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("global_settings.inc");
include("cpe.inc");
include("host_details.inc");


##Get Port
port = get_http_port(default:9200);
if(!port){
  exit(0);
}

if(!buf = http_get_cache( item:"/", port:port )){
 exit(0);
}

##Confirm application
if( "application/json" >< buf && "build_hash" >< buf && "build_timestamp" >< buf &&
    "lucene_version" >< buf && "logstash" >< buf)
{
  ### try to get version 
  vers = eregmatch(string:buf, pattern:'number" : "([0-9a-z.]+)",', icase:TRUE);
  if(vers[1]){
    version = vers[1];
  }
  else{
    version ="Unknown";
  }

  set_kb_item(name:string("www/", port, "/Elastisearch/Logstash"), value: vers);
  set_kb_item(name:"Elastisearch/Logstash/Installed",value:TRUE);

  ## build cpe and store it as host_detail
  cpe = build_cpe(value:version, exp:"^([0-9a-z.]+)", base:"cpe:/a:elasticsearch:logstash:");
  if(!cpe)
    cpe= "cpe:/a:elasticsearch:logstash";
  
  register_product(cpe:cpe, location:"/", port:port);

  log_message(data: build_detection_report( app:"Elasticsearch Logstash",
                                            version:version,
                                            install:'/',
                                            cpe:cpe,
                                            concluded: version),
                                            port:port);
}
exit(0);
