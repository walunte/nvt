###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_macosx_mult_vuln01_feb17.nasl 5445 2017-02-28 12:32:29Z antu123 $
#
# Apple Mac OS X Multiple Vulnerabilities-01 February-2017
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810567");
  script_version("$Revision: 5445 $");
  script_cve_id("CVE-2016-7411", "CVE-2016-7412", "CVE-2016-7413", "CVE-2016-7414",
                "CVE-2016-7416", "CVE-2016-7417", "CVE-2016-7418", "CVE-2016-7609",
                "CVE-2016-7628", "CVE-2016-7658", "CVE-2016-7659", "CVE-2016-7596",
                "CVE-2016-7605", "CVE-2016-7617", "CVE-2016-7604", "CVE-2016-7663",
                "CVE-2016-7627", "CVE-2016-7655", "CVE-2016-7588", "CVE-2016-7603",
                "CVE-2016-7595", "CVE-2016-7667", "CVE-2016-5419", "CVE-2016-5420",
                "CVE-2016-5421", "CVE-2016-7141", "CVE-2016-7167", "CVE-2016-8615",
                "CVE-2016-8616", "CVE-2016-8617", "CVE-2016-8618", "CVE-2016-8619",
                "CVE-2016-8620", "CVE-2016-8621", "CVE-2016-8622", "CVE-2016-8623",
                "CVE-2016-8624", "CVE-2016-8625", "CVE-2016-7633", "CVE-2016-7616",
                "CVE-2016-4691", "CVE-2016-7618", "CVE-2016-7622", "CVE-2016-7594",
                "CVE-2016-7643", "CVE-2016-7602", "CVE-2016-7608", "CVE-2016-7591",
                "CVE-2016-7657", "CVE-2016-7625", "CVE-2016-7714", "CVE-2016-7620",
                "CVE-2016-7606", "CVE-2016-7612", "CVE-2016-7607", "CVE-2016-7615",
                "CVE-2016-7621", "CVE-2016-7637", "CVE-2016-7644", "CVE-2016-7629",
                "CVE-2016-7619", "CVE-2016-6304", "CVE-2016-1777", "CVE-2016-7600",
                "CVE-2016-6303", "CVE-2016-6304", "CVE-2016-7661", "CVE-2016-4693",
                "CVE-2016-7636", "CVE-2016-7662", "CVE-2016-7660", "CVE-2016-7761",
                "CVE-2016-7742");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-02-28 13:32:29 +0100 (Tue, 28 Feb 2017) $");
  script_tag(name:"creation_date", value:"2017-02-22 17:03:09 +0530 (Wed, 22 Feb 2017)");
  script_name("Apple Mac OS X Multiple Vulnerabilities-01 February-2017");

  script_tag(name: "summary" , value:"This host is running Apple Mac OS X and
  is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists. For details
  refer the reference links.");

  script_tag(name: "impact" , value:"Successful exploitation will allow attacker
  to execute arbitrary code or cause a denial of service (memory corruption),
  gain access to potentially sensitive information, bypass certain protection
  mechanism and have other impacts.

  Impact Level: System");

  script_tag(name: "affected" , value:"Apple Mac OS X versions prior to 10.12.2");

  script_tag(name: "solution" , value:"Upgrade to Apple Mac OS X version
  10.12.2 or later. For more updates refer to https://www.apple.com");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"package");

  script_xref(name : "URL" , value : "https://support.apple.com/en-in/HT207423");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/osx_name", "ssh/login/osx_version");
  exit(0);
}


include("version_func.inc");

## Variable Initialization
osName = "";
osVer = "";

## Get the OS name
osName = get_kb_item("ssh/login/osx_name");
if(!osName){
  exit (0);
}

## Get the OS Version
osVer = get_kb_item("ssh/login/osx_version");
if(!osVer){
  exit(0);
}

## Check for the Mac OS X
if("Mac OS X" >< osName)
{
  ## Check the affected OS versions
  if(version_is_less(version:osVer, test_version:"10.12.2"))
  {
    report = report_fixed_ver(installed_version:osVer, fixed_version:"10.12.2");
    security_message(data:report);
    exit(0);
  }
}
