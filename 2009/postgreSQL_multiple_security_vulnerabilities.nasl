###############################################################################
# OpenVAS Vulnerability Test
# $Id: postgreSQL_multiple_security_vulnerabilities.nasl 7406 2017-10-12 06:15:28Z cfischer $
#
# PostgreSQL Multiple Security Vulnerabilities
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

CPE = "cpe:/a:postgresql:postgresql";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100273");
  script_version("$Revision: 7406 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-12 08:15:28 +0200 (Thu, 12 Oct 2017) $");
  script_tag(name:"creation_date", value:"2009-10-01 18:57:31 +0200 (Thu, 01 Oct 2009)");
  script_bugtraq_id(36314);
  script_cve_id("CVE-2009-3229","CVE-2009-3230","CVE-2009-3231");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_name("PostgreSQL Multiple Security Vulnerabilities");
  script_category(ACT_GATHER_INFO);
  script_family("Databases");
  script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("postgresql_detect.nasl");
  script_require_ports("Services/postgresql", 5432);
  script_mandatory_keys("PostgreSQL/installed");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/36314");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=522085#c1");
  script_xref(name:"URL", value:"http://www.postgresql.org/");
  script_xref(name:"URL", value:"http://www.postgresql.org/support/security");
  script_xref(name:"URL", value:"http://permalink.gmane.org/gmane.comp.security.oss.general/2088");

  tag_summary = "PostgreSQL is prone to multiple security vulnerabilities, including a
  denial-of-service issue, a privilege-escalation issue, and an authentication-
  bypass issue.";

  tag_impact = "Attackers can exploit these issues to shut down affected servers,
  perform certain actions with elevated privileges, and bypass
  authentication mechanisms to perform unauthorized actions. Other
  attacks may also be possible.";

  tag_solution = "Updates are available. Please see the references for more information.";

  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"solution", value:tag_solution);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"8.4", test_version2:"8.4.0" )  ||
    version_in_range( version:vers, test_version:"8.3", test_version2:"8.3.7" )  ||
    version_in_range( version:vers, test_version:"8.2", test_version2:"8.2.13" ) ||
    version_in_range( version:vers, test_version:"8.1", test_version2:"8.1.17" ) ||
    version_in_range( version:vers, test_version:"8.0", test_version2:"8.0.21" ) ||
    version_in_range( version:vers, test_version:"7.4", test_version2:"7.4.25" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"See references" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
