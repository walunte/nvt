###############################################################################
# OpenVAS Vulnerability Test
# Id: gb_mozilla_firefox_esr_mfsa_2016-39_2016-48_2_macosx.nasl 32268 2016-02-24 14:01:01Z antu123 $
#
# Mozilla Firefox Esr Security Updates( mfsa_2016-39_2016-48 2)-MAC OS X
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

CPE = "cpe:/a:mozilla:firefox_esr";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807683");
  script_version("$Revision: 5813 $");
  script_cve_id("CVE-2016-2808", "CVE-2016-2814", "CVE-2016-2807", "CVE-2016-2806");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-31 11:01:08 +0200 (Fri, 31 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-05-02 13:12:33 +0530 (Mon, 02 May 2016)");
  script_name("Mozilla Firefox Esr Security Updates( mfsa_2016-39_2016-48 2)-MAC OS X");

  script_tag(name: "summary" , value:"This host is installed with 
  Mozilla Firefox Esr and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The multiple flaws exists due to,
  - Multiple unspecified vulnerabilities in the browser engine.
  - An error in the JavaScript engine.
  - Heap-based buffer overflow in the stagefright::SampleTable::parseSampleCencInfo
    function in libstagefright.");

  script_tag(name: "impact" , value:"Successful exploitation of this
  vulnerability will allow remote attackers to cause a denial of service,
  and to execute arbitrary code.

  Impact Level: Application.");

  script_tag(name: "affected" , value:"Mozilla Firefox Esr version 45.x before 
  45.1 on MAC OS X.");

  script_tag(name: "solution" , value:"Upgrade to Mozilla Firefox Esr version 45.1
  or later, For updates refer to http://www.mozilla.com/en-US/firefox/all.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-47/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-44/");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-39/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("Mozilla/Firefox-ESR/MacOSX/Version");
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
if(version_is_equal(version:ffVer, test_version:"45.0"))
{
  report = report_fixed_ver(installed_version:ffVer, fixed_version:"45.1");
  security_message(data:report);
  exit(0);
}
