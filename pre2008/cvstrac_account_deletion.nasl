# OpenVAS Vulnerability Test
# $Id: cvstrac_account_deletion.nasl 6046 2017-04-28 09:02:54Z teissa $
# Description: CVSTrac CVSROOT/passwd arbitrary account deletion
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
# based on work from (C) Tenable Network Security
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

tag_summary = "The remote host seems to be running cvstrac, 
a web-based bug and patch-set tracking system for CVS.

This version of CVSTRAC is vulnerable to a flaw wherein
a remote attacker can overwrite a critical file, thereby
giving them elevated access and potentially control
over other user accounts.

***** OpenVAS has determined the vulnerability exists on the target
***** simply by looking at the version number(s) of CVSTrac
***** installed there.";

tag_solution = "Update to version 1.1.4 or disable this CGI suite";

if(description)
{
 script_id(14283);
 script_version("$Revision: 6046 $");
 script_tag(name:"last_modification", value:"$Date: 2017-04-28 11:02:54 +0200 (Fri, 28 Apr 2017) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_xref(name:"OSVDB", value:"8642");
 name = "CVSTrac CVSROOT/passwd arbitrary account deletion";

 script_name(name);
 


 summary = "Checks for CVSTrac version";
 
 
 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
 
 
 script_copyright("This script is Copyright (C) 2004 David Maciejak");
 family = "Web application abuses";
 script_family(family);
 script_dependencies("cvstrac_detect.nasl");
 script_require_ports("Services/www", 80);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

#
# The script code starts here
#

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);

kb = get_kb_item("www/" + port + "/cvstrac" );
if ( ! kb ) exit(0);
stuff = eregmatch(pattern:"(.*) under (.*)", string:kb );
version = stuff[1];

if(ereg(pattern:"^(0\..*|1\.0\.[0-5]([^0-9]|$))", string:r))
 		security_message(port);
