###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_phpmyadmin_42584.nasl 6705 2017-07-12 14:25:59Z cfischer $
#
# phpMyAdmin Multiple Cross Site Scripting Vulnerabilities
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

tag_summary = "phpMyAdmin is prone to multiple cross-site scripting vulnerabilities
because it fails to properly sanitize user-supplied input.

An attacker may leverage these issues to execute arbitrary script code
in the browser of an unsuspecting user in the context of the affected
site. This can allow the attacker to steal cookie-based authentication
credentials and launch other attacks.

The following versions are vulnerable:

phpMyAdmin 2.11.x prior to 2.11.10.1 phpMyAdmin 3.x prior to 3.3.5.1";

tag_solution = "Updates are available. Please see the references for details.";

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.100761";
CPE = "cpe:/a:phpmyadmin:phpmyadmin";

if (description)
{
 script_oid(SCRIPT_OID);
 script_version("$Revision: 6705 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-12 16:25:59 +0200 (Wed, 12 Jul 2017) $");
 script_tag(name:"creation_date", value:"2010-08-30 14:30:07 +0200 (Mon, 30 Aug 2010)");
 script_bugtraq_id(42584);
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_cve_id("CVE-2010-3056");

 script_name("phpMyAdmin Multiple Cross Site Scripting Vulnerabilities");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/42584");
 script_xref(name : "URL" , value : "http://www.phpmyadmin.net/");
 script_xref(name : "URL" , value : "http://www.phpmyadmin.net/home_page/security/PMASA-2010-5.php");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("secpod_phpmyadmin_detect_900129.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("phpMyAdmin/installed");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");
include("host_details.inc");

if(!port = get_app_port(cpe:CPE, nvt:SCRIPT_OID))exit(0);
if(vers = get_app_version(cpe:CPE, nvt:SCRIPT_OID, port:port)) {
  if(version_in_range(version: vers, test_version:"3",test_version2:"3.3.5") ||
     version_in_range(version: vers, test_version:"2.11",test_version2:"2.11.10")) {
      security_message(port:port);
      exit(0);
  }

}

exit(0);
