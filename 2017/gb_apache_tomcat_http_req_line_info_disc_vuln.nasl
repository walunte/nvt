###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_tomcat_http_req_line_info_disc_vuln.nasl 69688 2016-07-24 11:25:47 +0530 March$
#
# Apache Tomcat HTTP Request Line Information Disclosure Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:apache:tomcat";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810730");
  script_version("$Revision: 7160 $");
  script_cve_id("CVE-2016-6816");
  script_bugtraq_id(94461);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-09-18 09:39:22 +0200 (Mon, 18 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-04-04 14:36:33 +0530 (Tue, 04 Apr 2017)");
  script_tag(name:"qod_type", value:"remote_active");
  script_name("Apache Tomcat HTTP Request Line Information Disclosure Vulnerability");

  script_tag(name:"summary", value:"This host is installed with Apache Tomcat
  and is prone to information disclosure vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The code that parsed the HTTP request line
  permitted invalid characters. This could be exploited, in conjunction with a
  proxy that also permitted the invalid characters but with a different
  interpretation, to inject data into the HTTP response.");

  script_tag(name:"impact", value:"Successful exploitation will allows remote
  attackers to poison a web-cache, perform an XSS attack and/or obtain sensitive
  information from requests other then their own.

  Impact Level: Application");

  script_tag(name:"affected", value:"
  Apache Tomcat versions 9.0.0.M1 to 9.0.0.M11, 
  Apache Tomcat versions 8.5.0 to 8.5.6,
  Apache Tomcat versions 8.0.0.RC1 to 8.0.38,
  Apache Tomcat versions 7.0.0 to 7.0.72, and
  Apache Tomcat versions 6.0.0 to 6.0.47.");

  script_tag(name:"solution", value:"Upgrade to version 9.0.0.M13,
  8.5.8, 8.0.39, 7.0.73, 6.0.48  or later,
  For updates refer to http://tomcat.apache.org");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://tomcat.apache.org/security-6.html#Fixed_in_Apache_Tomcat_6.0.48");
  script_xref(name:"URL", value:"https://tomcat.apache.org/security-7.html#Fixed_in_Apache_Tomcat_7.0.73");
  script_xref(name:"URL", value:"https://tomcat.apache.org/security-8.html#Fixed_in_Apache_Tomcat_8.0.39"); 
  script_xref(name:"URL", value:"https://tomcat.apache.org/security-8.html#Fixed_in_Apache_Tomcat_8.5.8");
  script_xref(name:"URL", value:"https://tomcat.apache.org/security-9.html#Fixed_in_Apache_Tomcat_9.0.0.M13");
  script_xref(name:"URL", value:"https://qnalist.com/questions/7885204/security-cve-2016-6816-apache-tomcat-information-disclosure");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("gb_apache_tomcat_detect.nasl");
  script_mandatory_keys("ApacheTomcat/installed");
  script_require_ports("Services/www", 8080);
  exit(0);
}


include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

## Variable Initialization
tomPort = "";

## get the port
if(!tomPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get WordPress Location
if(!dir = get_app_location(cpe:CPE, port:tomPort)){
  exit(0);
}

## Construct attack request. 
url = dir + "/?{{%25}}cake\=1";

## Response will be Apache tomcat front page something like
## https://en.wikipedia.org/wiki/File:Apache-tomcat-frontpage-epiphany-browser.jpg
if(http_vuln_check(port:tomPort, url:url, check_header:TRUE,
  pattern:'Apache Software Foundation', extra_check:make_list('tomcat.apache.org<',
          '"Powered by Tomcat"', 'tomcat.gif', 'tomcat-power.gif')))
{
  report = report_vuln_url( port:tomPort, url:url );
  security_message(port:tomPort, data:report);
  exit(0);
}
