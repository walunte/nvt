###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_safari_mult_vuln_sep16.nasl 5850 2017-04-04 09:01:03Z teissa $
#
# Apple Safari Multiple Vulnerabilities September16 (Mac OS X)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:apple:safari";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807889");
  script_version("$Revision: 5850 $");
  script_cve_id("CVE-2016-4618", "CVE-2016-4751", "CVE-2016-4728", "CVE-2016-4758",
                "CVE-2016-4611", "CVE-2016-4729", "CVE-2016-4730", "CVE-2016-4731",
                "CVE-2016-4734", "CVE-2016-4735", "CVE-2016-4737", "CVE-2016-4759",
                "CVE-2016-4762", "CVE-2016-4766", "CVE-2016-4767", "CVE-2016-4768",
                "CVE-2016-4769", "CVE-2016-4760", "CVE-2016-4733", "CVE-2016-4765",
                "CVE-2016-4763");
  script_bugtraq_id(93053, 93057, 93067, 93066, 93065, 93064, 93062, 93058);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-04-04 11:01:03 +0200 (Tue, 04 Apr 2017) $");
  script_tag(name:"creation_date", value:"2016-09-28 12:58:27 +0530 (Wed, 28 Sep 2016)");
  script_name("Apple Safari Multiple Vulnerabilities September16 (Mac OS X)");

  script_tag(name: "summary" , value:"This host is installed with Apple Safari
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to,
  - A state management issue in the handling of tab sessions.
  - Multiple input validation issues.
  - A parsing issue in the handling of error prototypes.
  - A permissions issue in the handling of the location variable.
  - Multiple memory corruption issues.
  - An error in safari's support of HTTP/0.9.
  - A certificate validation issue in the handling of WKWebView.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to conduct cross-site scripting attacks, spoofing attacks, arbitrary
  code execution, access to potentially sensitive data, intercept and alter
  network traffic.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Apple Safari versions before 10");

  script_tag(name: "solution" , value:"Upgrade to Apple Safari version 10 or
  later. For updates refer to http://www.apple.com/support.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "https://support.apple.com/en-in/HT207157");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("macosx_safari_detect.nasl");
  script_mandatory_keys("AppleSafari/MacOSX/Version");
  exit(0);
}


# Code starts from here

include("version_func.inc");
include("host_details.inc");

# Variable Initialization
safVer = "";

## Get Apple Safari version
if(!safVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Check for Apple Safari Versions less than 10
if(version_is_less(version:safVer, test_version:"10"))
{
  report = report_fixed_ver(installed_version:safVer, fixed_version:"10");
  security_message(data:report);
  exit(0);
}


