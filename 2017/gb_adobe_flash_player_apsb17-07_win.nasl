##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_apsb17-07_win.nasl 5582 2017-03-15 15:50:24Z antu123 $
#
# Adobe Flash Player Security Updates(apsb17-07)-Windows
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:adobe:flash_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810807");
  script_version("$Revision: 5582 $");
  script_cve_id("CVE-2017-2997", "CVE-2017-2998", "CVE-2017-2999", "CVE-2017-3000", 
		"CVE-2017-3001", "CVE-2017-3002", "CVE-2017-3003");
  script_bugtraq_id(96860, 96866, 96862, 96861);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-15 16:50:24 +0100 (Wed, 15 Mar 2017) $");
  script_tag(name:"creation_date", value:"2017-03-15 08:17:53 +0530 (Wed, 15 Mar 2017)");
  script_name("Adobe Flash Player Security Updates(apsb17-07)-Windows");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to,
  - A buffer overflow vulnerability.
  - The memory corruption vulnerabilities.
  - A random number generator vulnerability used for constant blinding.
  - The use-after-free vulnerabilities.");

  script_tag(name: "impact" , value:"Successful exploitation of this
  vulnerability will allow remote attackers to execute arbitrary code on
  the target user's system and that could potentially allow an attacker to
  take control of the affected system.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Adobe Flash Player versions before
  25.0.0.127 on Windows.");

  script_tag(name: "solution", value:"Upgrade to Adobe Flash Player version
  25.0.0.127, or later. For updates refer to http://get.adobe.com/flashplayer");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name: "URL" , value :"https://helpx.adobe.com/security/products/flash-player/apsb17-07.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
playerVer = "";

## Get version
if(!playerVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:playerVer, test_version:"25.0.0.127"))
{
  report =  report_fixed_ver(installed_version:playerVer, fixed_version:"25.0.0.127");
  security_message(data:report);
  exit(0);
}