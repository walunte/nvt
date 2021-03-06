###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_phar_parse_dos_vuln_lin.nasl 6764 2017-07-20 05:30:52Z cfischer $
#
# PHP 'phar_parse_pharfile' Function Denial of Service Vulnerability - (Linux)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.811484");
  script_version("$Revision: 6764 $");
  script_cve_id("CVE-2017-11147");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-20 07:30:52 +0200 (Thu, 20 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-07-11 19:48:21 +0530 (Tue, 11 Jul 2017)");
  script_name("PHP 'phar_parse_pharfile' Function Denial of Service Vulnerability - (Linux)");

  script_tag(name:"summary", value:"This host is installed with PHP and is prone
  to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of the detect NVT and check if the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to a buffer over-read error
  in the 'phar_parse_pharfile' function in ext/phar/phar.c script.");

  script_tag(name:"impact", value:"Successfully exploiting this issue allow
  remote attackers to supply malicious archive files to crash the PHP interpreter or
  potentially disclose information.

  Impact Level: Application");

  script_tag(name:"affected", value:"PHP versions before 5.6.30, 7.x before 7.0.15");

  script_tag(name:"solution", value:"Upgrade to PHP version 5.6.30 or 7.0.15,
  or later. For updates refer to http://www.php.net");

  script_xref(name:"URL", value:"http://www.php.net/ChangeLog-5.php");
  script_xref(name:"URL", value:"http://www.php.net/ChangeLog-7.php");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_dependencies("gb_php_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("php/installed", "Host/runs_unixoide");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

fix = "";
vers = "";

if(host_runs("Linux") != "yes") exit(0);

if(isnull(phpport = get_app_port(cpe:CPE))){
  exit(0);
}

if(! vers = get_app_version(cpe:CPE, port:phpport)){
  exit(0);
}

if(version_is_less(version:vers, test_version:"5.6.30")){
  fix = "5.6.30";
}

if(version_in_range(version:vers, test_version:"7.0", test_version2:"7.0.14")){
  fix = "7.0.15";
}

if(fix)
{
  report = report_fixed_ver(installed_version:vers, fixed_version:fix);
  security_message(port:phpport, data:report);
  exit(0);
}
exit(99);