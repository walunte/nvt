# OpenVAS Vulnerability Test
# $Id: samihttp_1_0_4.nasl 6046 2017-04-28 09:02:54Z teissa $
# Description: Sami HTTP Server v1.0.4
#
# Authors:
# Audun Larsen <larsen@xqus.com>
# Based on Apache < 1.3.27 written by Renaud Deraison <deraison@cvs.nessus.org>
#
# Copyright:
# Copyright (C) 2004 Audun Larsen
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

tag_summary = "The remote host seems to be running Sami HTTP Server v1.0.4 or older.

A vulnerability has been reported for Sami HTTP server v1.0.4.
An attacker may be capable of corrupting data such as return address,
and thereby control the execution flow of the program.
This may result in denial of service or execution of arbitrary code.

*** Note that OpenVAS solely relied on the version number
*** of the remote server to issue this warning. This might
*** be a false positive";

tag_solution = "Upgrade Sami HTTP when an upgrade becomes available.";

if(description)
{
 script_id(12073);
 script_version("$Revision: 6046 $");
 script_tag(name:"last_modification", value:"$Date: 2017-04-28 11:02:54 +0200 (Fri, 28 Apr 2017) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_cve_id("CVE-2004-0292");
 script_bugtraq_id(9679);
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 
 name = "Sami HTTP Server v1.0.4";

 script_name(name);
 

 summary = "Checks for version of Sami HTTP server";
 
 
 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
 
 
 script_copyright("This script is Copyright (C) 2004 Audun Larsen");
 family = "Buffer overflow";
 script_family(family);
 script_dependencies("gb_get_http_banner.nasl", "no404.nasl");
 script_mandatory_keys("Sami_HTTP/banner");
 script_require_ports("Services/www", 80);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

#
# The script code starts here
#
include("http_func.inc");

port = get_http_port(default:80);

if(get_port_state(port))
{
banner = get_http_banner(port: port);
if(!banner)exit(0);

if ( egrep(pattern:"Server:.*Sami HTTP Server v(0\.|1\.0\.[0-4][^0-9])", string:banner) ) 
 {
   security_message(port);
 }
}
