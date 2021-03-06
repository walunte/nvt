###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_hp_laserjet_multiple_vuln.nasl 6453 2017-06-28 09:59:05Z teissa $
#
# HP LaserJet Multiple Vulnerabilities
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.805040");
  script_version("$Revision: 6453 $");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-06-28 11:59:05 +0200 (Wed, 28 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-01-29 13:07:29 +0530 (Thu, 29 Jan 2015)");
  script_name("HP LaserJet Multiple Vulnerabilities");

  script_tag(name: "summary" , value:"The host is running HP LaserJet Printer
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Send a crafted data via HTTP GET request
  and check whether it is able to read the sensitive information.");

  script_tag(name: "insight" , value:"
  - There are Information Leakage and Insufficient Authorization vulnerabilities
    in HP LaserJet. Vulnerabilities are in control panel of HP network MFP and
    printers.
  - There is access without authorization to information about all settings
    of the printer (read only, but it's possible to find printers with
    possibility to change settings).
  - In section 'Print Information Pages' it is possible to print test documents
    without authorization. Thus without login and password it's possible to
    waste paper and cartridge of the printer.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to obtain the sensitive information.

  Impact Level: Application");

  script_tag(name: "affected" , value:"HP network MFP and printers with
  firmware 20130415 and previous versions.");

  script_tag(name: "solution" , value: "No solution or patch was made available
  for at least one year since disclosure of this vulnerability. Likely none will
  be provided anymore. General solution options are to upgrade to a newer release,
  disable respective features, remove the product or replace the product by another
  one.");
  script_tag(name:"solution_type", value:"WillNotFix");

  script_xref(name : "URL" , value : "http://seclists.org/fulldisclosure/2015/Jan/118");
  script_xref(name : "URL" , value : "http://seclists.org/fulldisclosure/2014/Dec/98)");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");

## Variable Initialization
http_port = "";
sndReq = "";
rcvRes = "";

## Get HTTP Port
http_port = get_http_port(default:80);

rcvRes = http_get_cache(item:"/",  port:http_port);

## confirm the Application
if(">HP LaserJet" >< rcvRes && ">Device Configuration<" >< rcvRes)
{
  ## Construct the attack request
  url = "/info_specialPages.html?tab=Home&menu=InfoPages";

  ## Try attack and check the response to confirm vulnerability
  if(http_vuln_check(port:http_port, url:url, check_header:FALSE,
     pattern:">Print Information Pages<",
     extra_check:"set_config_password.html"))
  {
    report = report_vuln_url( port:http_port, url:url );
    security_message(port:http_port, data:report);
    exit(0);
  }
}

exit(99);
