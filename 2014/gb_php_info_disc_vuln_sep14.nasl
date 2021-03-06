###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_info_disc_vuln_sep14.nasl 4499 2016-11-14 14:06:43Z cfi $
#
# PHP Information Disclosure Vulnerability - 01 - Sep14
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.804849");
  script_version("$Revision: 4499 $");
  script_cve_id("CVE-2014-4721");
  script_bugtraq_id(68423);
  script_tag(name:"cvss_base", value:"2.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2016-11-14 15:06:43 +0100 (Mon, 14 Nov 2016) $");
  script_tag(name:"creation_date", value:"2014-09-22 09:50:48 +0530 (Mon, 22 Sep 2014)");

  script_name("PHP Information Disclosure Vulnerability - 01 - Sep14");

  script_tag(name: "summary" , value:"This host is installed with PHP and is
  prone to information disclosure vulnerability.");

  script_tag(name: "vuldetect" , value: "Get the installed version with
  the help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value: "The flaw is due to an error in the
  'hp_print_info' function within /ext/standard/info.c script.");

  script_tag(name: "impact" , value: "Successful exploitation will allow a local
  attacker to gain access to sensitive information.

  Impact Level: Application");

  script_tag(name: "affected" , value: "PHP before version 5.3.x before 5.3.29,
  5.4.x before 5.4.30, 5.5.x before 5.5.14");

  script_tag(name: "solution" , value: "Upgrade to PHP version 5.3.29 or 5.4.30
  or 5.5.14 or later");

  script_xref(name:"URL", value:"http://php.net/ChangeLog-5.php");
  script_xref(name:"URL", value:"https://bugs.php.net/bug.php?id=67498");
  script_xref(name:"URL", value:"https://www.sektioneins.de/en/blog/14-07-04-phpinfo-infoleak.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_php_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("php/installed");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( phpPort = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! phpVer = get_app_version( cpe:CPE, port:phpPort ) ) exit( 0 );

if(phpVer =~ "^(5\.(3|4|5))"){
  ## check the version
  if(version_in_range(version:phpVer, test_version:"5.5.0", test_version2:"5.5.13")||
     version_in_range(version:phpVer, test_version:"5.4.0", test_version2:"5.4.29")||
     version_in_range(version:phpVer, test_version:"5.3.0", test_version2:"5.3.28")){
    report = report_fixed_ver(installed_version:phpVer, fixed_version:"5.3.29/5.4.30/5.5.14");
    security_message(data:report, port:phpPort);
    exit(0);
  }
}

exit(99);
