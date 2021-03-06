# OpenVAS Vulnerability Test
# $Id: goollery_xss.nasl 5781 2017-03-30 08:15:57Z cfi $
# Description: Goollery Multiple XSS
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
#
# Copyright:
# Copyright (C) 2004 David Maciejak
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

tag_summary = "Goollery, a GMail based photo gallery written in PHP, 
is installed on this remote host.

According to it's version number, this host is vulnerable to multiple
cross-site-scripting (XSS) attacks; eg, through the 'viewpic.php'
script.  An attacker, exploiting these flaws, would need to be able to
coerce a user to browse a malicious URI.  Upon successful exploitation,
the attacker would be able to run code within the web-browser in the
security context of the remote server.";

tag_solution = "Upgrade to Goollery 0.04b or newer.";

# Ref: Lostmon <lostmon@gmail.com>

if(description)
{
 script_id(15717);
 script_version("$Revision: 5781 $");
 script_tag(name:"last_modification", value:"$Date: 2017-03-30 10:15:57 +0200 (Thu, 30 Mar 2017) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_cve_id("CVE-2004-2245");
 script_bugtraq_id(11587);
 script_xref(name:"OSVDB", value:"11318");
 script_xref(name:"OSVDB", value:"11319");
 script_xref(name:"OSVDB", value:"11320");
 script_xref(name:"OSVDB", value:"11624");
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
 script_name("Goollery Multiple XSS");
 script_category(ACT_ATTACK);
 script_tag(name:"qod_type", value:"remote_analysis");
 script_copyright("This script is Copyright (C) 2004 David Maciejak");
 script_family("Web application abuses");
 script_dependencies("find_service.nasl", "http_version.nasl", "cross_site_scripting.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if ( get_kb_item("www/" + port + "/generic_xss") ) exit(0);
if(!can_host_php(port:port)) exit(0);

foreach dir( make_list_unique( "/goollery", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";

  url = string(dir, "/viewpic.php?id=7&conversation_id=<script>foo</script>&btopage=0");
  if(http_vuln_check(port:port, url:url,pattern:"<script>foo</script>",check_header:TRUE)) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );