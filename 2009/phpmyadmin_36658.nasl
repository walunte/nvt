###############################################################################
# OpenVAS Vulnerability Test
# $Id: phpmyadmin_36658.nasl 6948 2017-08-17 07:13:38Z asteins $
#
# phpMyAdmin Unspecified SQL Injection and Cross Site Scripting Vulnerabilities
#
# Authors:
# Michael Meyer
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

tag_summary = "phpMyAdmin is prone to SQL-injection and cross-site scripting
vulnerabilities because it fails to sufficiently sanitize user-
supplied data.

Exploiting these issues could allow an attacker to steal cookie-
based authentication credentials, compromise the application,
access or modify data, or exploit latent vulnerabilities in the
underlying database.

Versions prior to phpMyAdmin 2.11.9.6 and 3.2.2.1 are affected.";

tag_solution = "Vendor updates are available. Please see the references for details.";

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.100307";
CPE = "cpe:/a:phpmyadmin:phpmyadmin";

if (description)
{
 script_oid(SCRIPT_OID);
 script_version("$Revision: 6948 $");
 script_tag(name:"last_modification", value:"$Date: 2017-08-17 09:13:38 +0200 (Thu, 17 Aug 2017) $");
 script_tag(name:"creation_date", value:"2009-10-20 18:54:22 +0200 (Tue, 20 Oct 2009)");
 script_cve_id("CVE-2009-3696", "CVE-2009-3697");
 script_bugtraq_id(36658);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

 script_name("phpMyAdmin Unspecified SQL Injection and Cross Site Scripting Vulnerabilities");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/36658");
 script_xref(name : "URL" , value : "http://www.phpmyadmin.net/");
 script_xref(name : "URL" , value : "http://freshmeat.net/projects/phpmyadmin/releases/306669");
 script_xref(name : "URL" , value : "http://freshmeat.net/projects/phpmyadmin/releases/306667");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("secpod_phpmyadmin_detect_900129.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("phpMyAdmin/installed");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("version_func.inc");
include("host_details.inc");

if(!port = get_app_port(cpe:CPE, nvt:SCRIPT_OID))exit(0);
if(!vers = get_app_version(cpe:CPE, nvt:SCRIPT_OID, port:port))exit(0);

if(!isnull(vers) && vers >!< "unknown") {

  if(version_in_range(version: vers, test_version: "3.2", test_version2: "3.2.2")   ||
     version_in_range(version: vers, test_version: "3.1", test_version2: "3.1.1.1") ||
     version_in_range(version: vers, test_version: "3.0", test_version2: "3.0.1")   ||
     version_in_range(version: vers, test_version: "2.11", test_version2: "2.11.9.5")) {
      security_message(port:port);
      exit(0);
  }

}

exit(0);
