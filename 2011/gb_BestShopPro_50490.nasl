###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_BestShopPro_50490.nasl 5747 2017-03-28 12:18:28Z cfi $
#
# BestShopPro 'str' Parameter Cross Site Scripting and SQL Injection Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

tag_summary = "BestShopPro is prone to cross-site scripting and SQL-injection
vulnerabilities because it fails to sufficiently sanitize user-
supplied data.

Exploiting these issues could allow an attacker to steal cookie-
based authentication credentials, compromise the application,
access or modify data, or exploit latent vulnerabilities in the
underlying database.";

if(description)
{
 script_id(103329);
 script_bugtraq_id(50490);
 script_version ("$Revision: 5747 $");
 script_tag(name:"cvss_base", value:"2.6");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:N/I:P/A:N");
 script_name("BestShopPro 'str' Parameter Cross Site Scripting and SQL Injection Vulnerabilities");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/50490");
 script_xref(name : "URL" , value : "http://www.bst.pl/");

 script_tag(name:"last_modification", value:"$Date: 2017-03-28 14:18:28 +0200 (Tue, 28 Mar 2017) $");
 script_tag(name:"creation_date", value:"2011-11-03 08:00:00 +0100 (Thu, 03 Nov 2011)");
 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");
   
port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

foreach dir( make_list_unique( "/bst", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = string(dir, "/nowosci.php?a=1&str=%3Cscript%3Ealert(/openvas-xss-test/)%3C/script%3E");

  if(http_vuln_check(port:port, url:url,pattern:"<script>alert\(/openvas-xss-test/\)</script>",check_header:TRUE)) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );