###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_air_apsb16-08_win.nasl 5745 2017-03-28 09:01:00Z teissa $
#
# Adobe Air Security Updates-APSB16-08 (Windows)
#
# Authors:
# kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:adobe:adobe_air";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807604");
  script_version("$Revision: 5745 $");
  script_cve_id("CVE-2016-0960", "CVE-2016-0961", "CVE-2016-0962", "CVE-2016-0963", 
		"CVE-2016-0986", "CVE-2016-0987", "CVE-2016-0988", "CVE-2016-0989", 
		"CVE-2016-0990", "CVE-2016-0991", "CVE-2016-0992", "CVE-2016-0993", 
		"CVE-2016-0994", "CVE-2016-0995", "CVE-2016-0996", "CVE-2016-0997", 
		"CVE-2016-0998", "CVE-2016-0999", "CVE-2016-1000", "CVE-2016-1001", 
		"CVE-2016-1002", "CVE-2016-1005", "CVE-2016-1010" );
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-28 11:01:00 +0200 (Tue, 28 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-03-11 13:36:16 +0530 (Fri, 11 Mar 2016)");
  script_name("Adobe Air Security Updates-APSB16-08 (Windows)");

  script_tag(name:"summary", value:"This host is installed with Adobe Air
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The multiple flaws exists due to,
  - An integer overflow vulnerabilities.
  - A use-after-free vulnerabilities.
  - A heap overflow vulnerability.
  - The memory corruption vulnerabilities.");

  script_tag(name:"impact" , value:"Successful exploitation of this
  vulnerability will allow remote attackers to execute arbitrary code.

  Impact Level: System/Application.");

  script_tag(name: "affected" , value:"Adobe Air version before
  21.0.0.176 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Adobe Air version
  21.0.0.176 or later.
  For updates refer to http://get.adobe.com/air");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name: "URL" , value :"https://helpx.adobe.com/security/products/flash-player/apsb16-08.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_mandatory_keys("Adobe/Air/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
airVer = "";

## Get version
if(!airVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:airVer, test_version:"21.0.0.176"))
{
  report =  report_fixed_ver(installed_version:airVer, fixed_version:"21.0.0.176");
  security_message(data:report);
  exit(0);
}
