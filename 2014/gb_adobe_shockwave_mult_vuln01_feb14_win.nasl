###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_shockwave_mult_vuln01_feb14_win.nasl 35227 2014-02-13 12:25:40Z Feb$
#
# Adobe Shockwave Player Multiple Memory Corruption Vulnerabilities Feb14 (Windows)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
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

CPE = "cpe:/a:adobe:shockwave_player";
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.804096";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6735 $");
  script_cve_id("CVE-2014-0500", "CVE-2014-0501");
  script_bugtraq_id(65490, 65493);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-17 11:56:49 +0200 (Mon, 17 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-02-13 12:25:40 +0530 (Thu, 13 Feb 2014)");
  script_name("Adobe Shockwave Player Multiple Memory Corruption Vulnerabilities Feb14 (Windows)");

  tag_summary =
"This host is installed with Adobe Shockwave Player and is prone to multiple
memory corruption vulnerabilities.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Flaws are due to multiple unspecified errors.";

  tag_impact =
"Successful exploitation will allow attackers to execute arbitrary code, cause
memory corruption and compromise a user's system.

Impact Level: System/Application";

  tag_affected =
"Adobe Shockwave Player version before 12.0.9.149 on Windows.";

  tag_solution =
"Upgrade to version 12.0.9.149 or later,
For updates refer to http://get.adobe.com/shockwave";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/56740");
  script_xref(name : "URL" , value : "http://helpx.adobe.com/security/products/shockwave/apsb14-06.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_shockwave_player_detect.nasl");
  script_mandatory_keys("Adobe/ShockwavePlayer/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
playerVer = "";

## Get version
if(!playerVer = get_app_version(cpe:CPE, nvt:SCRIPT_OID)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:playerVer, test_version:"12.0.9.149"))
{
  security_message(0);
  exit(0);
}
