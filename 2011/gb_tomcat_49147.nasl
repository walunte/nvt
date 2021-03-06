###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_tomcat_49147.nasl 4341 2016-10-25 06:58:20Z cfi $
#
# Apache Tomcat CVE-2011-2481 Information Disclosure Vulnerability
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

CPE = "cpe:/a:apache:tomcat";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103199");
  script_version("$Revision: 4341 $");
  script_tag(name:"last_modification", value:"$Date: 2016-10-25 08:58:20 +0200 (Tue, 25 Oct 2016) $");
  script_tag(name:"creation_date", value:"2011-08-16 15:29:48 +0200 (Tue, 16 Aug 2011)");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_bugtraq_id(49147);
  script_cve_id("CVE-2011-2481");
  script_name("Apache Tomcat Information Disclosure Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
  script_dependencies("gb_apache_tomcat_detect.nasl");
  script_require_ports("Services/www", 8080);
  script_mandatory_keys("ApacheTomcat/installed");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/49147");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-7.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/");

  tag_summary = "Apache Tomcat is prone to a remote information-disclosure
  vulnerability.";

  tag_impact = "Remote attackers can exploit this issue to obtain sensitive
  information.";

  tag_affected = "Tomcat 7.0.0 through 7.0.16 is vulnerable.";

  tag_solution = "Updates are available. Please see the references for more information.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"7.0.0", test_version2:"7.0.16" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"7.0.17" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );