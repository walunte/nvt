###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_virtualbox_unspecified_vuln_nov15_lin.nasl 6329 2017-06-13 15:39:42Z teissa $
#
# Oracle Virtualbox Unspecified Vulnerability Nov15 (Linux)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:oracle:vm_virtualbox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806607");
  script_version("$Revision: 6329 $");
  script_cve_id("CVE-2015-4856");
  script_bugtraq_id(77202);
  script_tag(name:"cvss_base", value:"4.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-06-13 17:39:42 +0200 (Tue, 13 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-11-02 14:26:35 +0530 (Mon, 02 Nov 2015)");
  script_name("Oracle Virtualbox Unspecified Vulnerability Nov15 (Linux)");

  script_tag(name: "summary" , value:"This host is installed with Oracle VM
  VirtualBox and is prone to unspecified vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists due to some unspecified
  error.");

  script_tag(name: "impact" , value:"Successful exploitation will allow local
  attackers to have an impact on availability.

  Impact Level: Application");

  script_tag(name: "affected" , value:"VirtualBox versions prior to 4.0.30,
  4.1.38, 4.2.30, 4.3.26, and 5.0.0 on Linux.");

  script_tag(name: "solution" , value:"Upgrade to Oracle VirtualBox version
  4.0.30, 4.1.38, 4.2.30, 4.3.26, 5.0.0 or later on Linux. For updates refer
  to https://www.virtualbox.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/cpuoct2015-2367953.html");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("secpod_sun_virtualbox_detect_lin.nasl");
  script_mandatory_keys("Sun/VirtualBox/Lin/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
virtualVer = "";

## Get version
if(!virtualVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(virtualVer =~ "^4\.")
{
  ## Grep for vulnerable version
  if(version_in_range(version:virtualVer, test_version:"4.0.0", test_version2:"4.0.29"))
  {
     fix = "4.0.30";
     VULN = TRUE;
  }
  if(version_in_range(version:virtualVer, test_version:"4.1.0", test_version2:"4.1.37"))
  {
    fix = "4.1.38";
    VULN = TRUE;
  }
  if(version_in_range(version:virtualVer, test_version:"4.2.0", test_version2:"4.2.29"))
  {
    fix = "4.2.30";
    VULN = TRUE;
  }
  if(version_in_range(version:virtualVer, test_version:"4.3.0", test_version2:"4.3.25"))
  {
    fix = "4.3.26";
    VULN = TRUE;
  }

  if(VULN)
  {
    report = 'Installed version: ' + virtualVer + '\n' +
             'Fixed version:     ' + fix + '\n';
    security_message(data:report);
    exit(0);
  }
}
