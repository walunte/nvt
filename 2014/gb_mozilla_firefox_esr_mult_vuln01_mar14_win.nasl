###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_esr_mult_vuln01_mar14_win.nasl 36216 2014-03-27 12:08:38Z mar$
#
# Mozilla Firefox ESR Multiple Vulnerabilities-01 Mar14 (Windows)
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

CPE = "cpe:/a:mozilla:firefox_esr";
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.804524";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6724 $");
  script_cve_id("CVE-2014-1493", "CVE-2014-1496", "CVE-2014-1497", "CVE-2014-1505",
                "CVE-2014-1508", "CVE-2014-1509", "CVE-2014-1510", "CVE-2014-1511",
                "CVE-2014-1512", "CVE-2014-1513", "CVE-2014-1514");
  script_bugtraq_id(66412, 66416, 66423, 66418, 66426, 66425,
                    66206, 66207, 66209, 66203, 66240);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-14 11:57:17 +0200 (Fri, 14 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-03-27 12:12:34 +0530 (Thu, 27 Mar 2014)");
  script_name("Mozilla Firefox ESR Multiple Vulnerabilities-01 Mar14 (Windows)");

  tag_summary =
"This host is installed with Mozilla Firefox ESR and is prone to multiple
vulnerabilities.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Multiple flaws are due to,
- Local users can gain privileges by modifying the extracted Mar contents
  during an update.
- A boundary error when decoding WAV audio files.
- An error when performing polygon rendering in MathML.
- The session-restore feature does not consider the Content Security Policy of
  a data URL.
- A timing error when processing SVG format images with filters and
  displacements.
- A use-after-free error when handling garbage collection of TypeObjects under
  memory pressure.
- An error within the TypedArrayObject implementation when handling neutered
  ArrayBuffer objects.
- And some unspecified errors exist.";

  tag_impact =
"Successful exploitation will allow attackers to conduct spoofing attacks,
disclose potentially sensitive information, bypass certain security
restrictions, and compromise a user's system.

Impact Level: System/Application";

  tag_affected =
"Mozilla Firefox ESR version 24.x before 24.4 on Windows";

  tag_solution =
"Upgrade to Mozilla Firefox ESR version 24.4 or later,
For updates refer to http://www.mozilla.com/en-US/firefox/all.html";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/57500");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2014/mfsa2014-15.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_win.nasl");
  script_mandatory_keys("Firefox-ESR/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
ffVer = "";

## Get version
if(!ffVer = get_app_version(cpe:CPE, nvt:SCRIPT_OID)){
  exit(0);
}

# Check for vulnerable version
if(ffVer =~ "^24\." && version_in_range(version:ffVer,
                       test_version:"24.0", test_version2:"24.3"))
{
  security_message(0);
  exit(0);
}
