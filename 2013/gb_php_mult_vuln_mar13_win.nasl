###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_mult_vuln_mar13_win.nasl 5086 2017-01-24 11:34:51Z cfi $
#
# PHP Multiple Vulnerabilities - Mar13 (Windows)
#
# Authors:
# Arun Kallavi <karun@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:php:php";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803337");
  script_version("$Revision: 5086 $");
  script_cve_id("CVE-2013-1635","CVE-2013-1643");
  script_bugtraq_id(58224);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-01-24 12:34:51 +0100 (Tue, 24 Jan 2017) $");
  script_tag(name:"creation_date", value:"2013-03-14 18:10:04 +0530 (Thu, 14 Mar 2013)");
  script_name("PHP Multiple Vulnerabilities - Mar13 (Windows)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("os_detection.nasl","gb_php_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("php/installed");

  script_xref(name:"URL", value:"http://www.php.net/ChangeLog-5.php");
  script_xref(name:"URL", value:"http://bugs.php.net/bug.php?id=64360");
  script_xref(name:"URL", value:"http://cxsecurity.com/cveshow/CVE-2013-1635");
  script_xref(name:"URL", value:"http://cxsecurity.com/cveshow/CVE-2013-1643");
  script_xref(name:"URL", value:"http://bugs.gentoo.org/show_bug.cgi?id=459904");

  tag_impact = "Successful exploitation allows attackers to read arbitrary files and write
  wsdl files within the context of the affected application.

  Impact Level: Application";

  tag_vuldetect = "Get the installed version of PHP with the help of detect NVT and check
  the version is vulnerable or not.";

  tag_affected = "PHP version before 5.3.23 and 5.4.x before 5.4.13";
  tag_insight = "Multiple flaws are due to,
    - Does not validate 'soap.wsdl_cache_dir' directive before writing SOAP wsdl
      cache files to the filesystem.
    - Allows the use of external entities while parsing SOAP wsdl files, issue
      in 'soap_xmlParseFile' and 'soap_xmlParseMemory' functions.";
  tag_solution = "Upgrade to PHP 5.4.13 or 5.3.23, which will be available soon.
  For updates refer to http://www.php.net/downloads.php";
  tag_summary = "This host is running PHP and is prone to multiple vulnerabilities.";

  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"vuldetect", value:tag_vuldetect);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"solution", value:tag_solution);

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}


include("version_func.inc");
include("host_details.inc");

## If its not windows exit
if( host_runs( "windows" ) != "yes" ) exit( 0 );

if( isnull( port = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if ( version_is_less( version:vers, test_version:"5.3.23" ) ||
     version_in_range( version:vers, test_version:"5.4.0", test_version2:"5.4.12" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"5.3.23/5.4.13" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );