###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_mult_vuln01_sep14_win.nasl 6735 2017-07-17 09:56:49Z teissa $
#
# Mozilla Firefox Multiple Vulnerabilities-01 September14 (Windows)
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

CPE = "cpe:/a:mozilla:firefox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804827");
  script_version("$Revision: 6735 $");
  script_cve_id("CVE-2014-1553", "CVE-2014-1554", "CVE-2014-1562", "CVE-2014-1563",
                "CVE-2014-1564", "CVE-2014-1565", "CVE-2014-1567");
  script_bugtraq_id(69524, 69526, 69519, 69523, 69525, 69521, 69520);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-17 11:56:49 +0200 (Mon, 17 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-09-05 16:47:31 +0530 (Fri, 05 Sep 2014)");

  script_name("Mozilla Firefox Multiple Vulnerabilities-01 September14 (Windows)");

  script_tag(name: "summary" , value:"This host is installed with Mozilla Firefox
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exist due to,
  - A use-after-free error when setting text directionality.
  - An out-of-bounds read error when creating an audio timeline in Web Audio.
  - An error when decoding GIF images.
  - A use-after-free error during cycle collection when animating SVG content.
  - Some other unspecified errors.");

  script_tag(name: "impact" , value:"Successful exploitation will allow attackers
  to disclose potentially sensitive information and compromise a user's system.

  Impact Level: Application/System");

  script_tag(name: "affected" , value:"Mozilla Firefox before 32.0 on Windows");

  script_tag(name: "solution" , value:"Upgrade to Mozilla Firefox version 32.0
  or later, For updates refer to http://www.mozilla.com/en-US/firefox/all.html");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/59236");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2014/mfsa2014-68.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2014/mfsa2014-67.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2014/mfsa2014-69.html");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2014/mfsa2014-70.html");
  script_xref(name:"URL", value:"https://www.mozilla.org/security/announce/2014/mfsa2014-72.html");

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
if(version_is_less(version:ffVer, test_version:"32.0"))
{
  security_message(0);
  exit(0);
}
