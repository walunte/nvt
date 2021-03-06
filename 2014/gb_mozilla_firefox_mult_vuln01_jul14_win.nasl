###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_mult_vuln01_jul14_win.nasl 38580 2014-07-01 13:15:10Z jul$
#
# Mozilla Firefox Multiple Vulnerabilities-01 July14 (Windows)
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

CPE = "cpe:/a:mozilla:firefox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804702");
  script_version("$Revision: 6769 $");
  script_cve_id("CVE-2014-1533", "CVE-2014-1534", "CVE-2014-1536", "CVE-2014-1537",
                "CVE-2014-1538", "CVE-2014-1540", "CVE-2014-1541", "CVE-2014-1542",
                "CVE-2014-1543");
  script_bugtraq_id(67965, 67964, 67966, 67971, 67976, 67978, 67979, 67968, 67969);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-20 11:56:33 +0200 (Thu, 20 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-07-01 13:15:10 +0530 (Tue, 01 Jul 2014)");
  script_name("Mozilla Firefox Multiple Vulnerabilities-01 July14 (Windows)");

  tag_summary =
"This host is installed with Mozilla Firefox and is prone to multiple
vulnerabilities.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Multiple flaws are due to,
- An error in the 'PropertyProvider::FindJustificationRange()' function.
- An error in the 'navigator.getGamepads()' method within the Gamepad API.
- A use-after-free error in the 'mozilla::dom::workers::WorkerPrivateParent' class.
- A use-after-free error in the 'nsEventListenerManager::CompileEventHandlerInternal()'
  function.
- A boundary error related to AudioBuffer channel counts and sample rate range
  within the Web Audio Speex resampler.
- And some unspecified errors exist.";

  tag_impact =
"Successful exploitation will allow attackers to conduct clickjacking attacks
and compromise a user's system.

Impact Level: System/Application";

  tag_affected =
"Mozilla Firefox version before 30.0 on Windows";

  tag_solution =
"Upgrade to Mozilla Firefox version 30.0 or later,
For updates refer to http://www.mozilla.com/en-US/firefox/all.html";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/59171");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2014/mfsa2014-48.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_win.nasl");
  script_mandatory_keys("Firefox/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
ffVer = "";

## Get version
if(!ffVer = get_app_version(cpe:CPE)){
  exit(0);
}

# Check for vulnerable version
if(version_is_less(version:ffVer, test_version:"30.0"))
{
  security_message(0);
  exit(0);
}
