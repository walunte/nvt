###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_reader_mult_vuln01_apr14_win.nasl 2014-04-01 14:00:22Z Apr$
#
# Adobe Reader Multiple Vulnerabilities - 01 Apr14 (Windows)
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

CPE = "cpe:/a:adobe:acrobat_reader";
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.804353";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6692 $");
  script_cve_id("CVE-2014-0511", "CVE-2014-0512");
  script_bugtraq_id(66205, 66512);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-12 11:57:43 +0200 (Wed, 12 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-01-21 14:00:20 +0530 (Tue, 21 Jan 2014)");
  script_name("Adobe Reader Multiple Vulnerabilities - 01 Apr14 (Windows)");

  tag_summary =
"This host is installed with Adobe Reader and is prone to multiple
vulnerabilities.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Flaws are due to some unspecified errors.";

  tag_impact =
"Successful exploitation will allow attackers to bypass sandbox restrictions,
execute arbitrary code and compromise a user's system.

Impact Level: System/Application";

  tag_affected =
"Adobe Reader XI version 11.0.6 and probably other versions on Windows.";

  tag_solution =
"Upgrade to version 11.0.07 or higher,
For updates refer to http://get.adobe.com/reader";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://securitytracker.com/id?1029970");
  script_xref(name : "URL" , value : "https://www.hkcert.org/my_url/en/alert/14033102");
  script_xref(name : "URL" , value : "http://www.pwn2own.com/2014/03/pwn2own-results-for-wednesday-day-one");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_prdts_detect_win.nasl");
  script_mandatory_keys("Adobe/Reader/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
readerVer = "";

## Get version
if(!readerVer = get_app_version(cpe:CPE, nvt:SCRIPT_OID)){
  exit(0);
}

if(readerVer && readerVer =~ "^11")
{
  ## Check Adobe Reader vulnerable versions
  if(version_is_equal(version:readerVer, test_version:"11.0.6"))
  {
    security_message(0);
    exit(0);
  }
}
