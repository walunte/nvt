###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_bad_ssh_host_keys.nasl 5505 2017-03-07 10:00:18Z teissa $
#
# Known SSH Host Key
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.105497");
 script_version ("$Revision: 5505 $");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

 script_name("Known SSH Host Key");

 script_xref(name:"URL", value:"https://blog.shodan.io/duplicate-ssh-keys-everywhere/");
 script_xref(name:"URL", value:"https://www.kb.cert.org/vuls/id/566724");
 script_xref(name:"URL", value:"http://blogs.intevation.de/thomas/hetzner-duplicate-ed25519-ssh-host-keys/");

 script_tag(name: "impact" , value:"An attacker could use this situation to compromise or eavesdrop on the SSH communication between the client and the server using a man-in-the-middle attack.");
 script_tag(name: "vuldetect" , value:"Checks if the remote host responds with a known host key");
 script_tag(name: "solution" , value:"Generate a new host key");
 script_tag(name: "summary" , value:"The remote host uses a default host key that is shared among multiple installations.");

 script_tag(name:"solution_type", value: "Workaround");
 script_tag(name:"qod_type", value:"remote_active");

 script_tag(name:"last_modification", value:"$Date: 2017-03-07 11:00:18 +0100 (Tue, 07 Mar 2017) $");
 script_tag(name:"creation_date", value:"2016-01-05 13:21:28 +0100 (Tue, 05 Jan 2016)");
 script_category(ACT_GATHER_INFO);
 script_family("General");
 script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
 script_dependencies("ssh_proto_version.nasl");
 script_require_ports("Services/ssh", 22);
 exit(0);
}


include("bad_ssh_host_keys.inc");
include("ssh_func.inc");

port = get_kb_item("Services/ssh");
if( ! port ) port = 22;

if( ! get_port_state( port ) ) exit( 0 );

function check_key( hk )
{
  foreach bad_key ( bad_host_keys )
  {
    if( hk == bad_key ) return TRUE;
  }
}

foreach algo ( ssh_host_key_algos )
{
   host_key = get_kb_item("SSH/" + port + "/fingerprint/" + algo);
   if( ! host_key || ! strlen( host_key ) ) continue;

   if( check_key( hk:host_key ) )
   {
     _report += algo + "  " + host_key + '\n';
     bhk_found = TRUE;
   }
}

if( bhk_found )
{
  report = 'The following known hosts key(s) were found:\n' + _report;
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );

