###############################################################################
# OpenVAS Vulnerability Test
# $Id: phpmyadmin_cve_2006_6942.nasl 6704 2017-07-12 14:13:36Z cfischer $
#
# phpMyAdmin Multiple Input Validation Vulnerabilities
#
# Authors:
# Michael Meyer
#
# phpMyAdmin Multiple Input Validation Vulnerabilities
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
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

tag_summary = "phpMyAdmin is prone to multiple input-validation vulnerabilities,
  including an HTML-injection vulnerability, cross-site
  scripting vulnerabilities, and information-disclosure
  vulnerabilities.

  An attacker could exploit these vulnerabilities to view sensitive
  information or to have arbitrary script code execute in the context
  of the affected site, which may allow the attacker to steal
  cookie-based authentication credentials or change the way the site
  is rendered to the user. Data gained could aid in further attacks.";

tag_solution = "Vendor updates are available. Please see http://www.phpmyadmin.net for more
  Information.";

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.100068";
CPE = "cpe:/a:phpmyadmin:phpmyadmin";

if (description)
{
 script_oid(SCRIPT_OID);
 script_version("$Revision: 6704 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-12 16:13:36 +0200 (Wed, 12 Jul 2017) $");
 script_tag(name:"creation_date", value:"2009-03-21 10:04:15 +0100 (Sat, 21 Mar 2009)");
 script_bugtraq_id(21137);
 script_cve_id("CVE-2006-6942");
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");

 script_name("phpMyAdmin Multiple Input Validation Vulnerabilities");


 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("secpod_phpmyadmin_detect_900129.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("phpMyAdmin/installed");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/21137");
 exit(0);
}

include("http_func.inc");
include("version_func.inc");
include("host_details.inc");
  
if(!port = get_app_port(cpe:CPE, nvt:SCRIPT_OID))exit(0);
if(!version = get_app_version(cpe:CPE, nvt:SCRIPT_OID, port:port))exit(0);

   if (version_is_less(version:version, test_version:"2.9.1.1") ) { 
        security_message(port:port);
	exit(0);
   }

exit(0);
