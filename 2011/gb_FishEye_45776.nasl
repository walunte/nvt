###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_FishEye_45776.nasl 7044 2017-09-01 11:50:59Z teissa $
#
# Fisheye Multiple Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
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

tag_summary = "Fisheye and Crucible are prone to cross-site scripting, security-
bypass, and information-disclosure vulnerabilities.

Attackers can exploit these issues to execute arbitrary script code in
the context of the website, steal cookie-based authentication
information, disclose sensitive information, or bypass certain
security restrictions.

Fisheye and Crucible versions prior to 2.4.4 are vulnerable.";

tag_solution = "Vendor updates are available. Please see the references for more
information.";

if (description)
{
 script_id(103027);
 script_version("$Revision: 7044 $");
 script_tag(name:"last_modification", value:"$Date: 2017-09-01 13:50:59 +0200 (Fri, 01 Sep 2017) $");
 script_tag(name:"creation_date", value:"2011-01-13 13:28:59 +0100 (Thu, 13 Jan 2011)");
 script_bugtraq_id(45776);
 script_tag(name:"cvss_base", value:"2.6");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:N/A:N");

 script_name("Fisheye Multiple Vulnerabilities");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/45776");
 script_xref(name : "URL" , value : "http://www.atlassian.com/software/crucible/");
 script_xref(name : "URL" , value : "http://www.atlassian.com/software/fisheye/");
 script_xref(name : "URL" , value : "http://confluence.atlassian.com/display/FISHEYE/FishEye+and+Crucible+Security+Advisory+2011-01-12");
 script_xref(name : "URL" , value : "http://confluence.atlassian.com/display/CRUCIBLE/FishEye+and+Crucible+Security+Advisory+2011-01-12");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
 script_dependencies("gb_FishEye_detect.nasl");
 script_require_ports("Services/www", 8060);
 script_mandatory_keys("FishEye/installed");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");

port = get_http_port(default:8060);
if(!get_port_state(port))exit(0);

vers = get_kb_item(string("www/", port, "/FishEye"));

if(vers) {

    if(version_is_less(version: vers, test_version: "2.4.4")) {
      security_message(port:port);
      exit(0);
    }

}

exit(0);

