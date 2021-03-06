###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mult_vuln01_oct13_lin.nasl 6079 2017-05-08 09:03:33Z teissa $
#
# Google Chrome Multiple Vulnerabilities-01 Oct2013 (Linux)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:google:chrome";
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.804107";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6079 $");
  script_cve_id("CVE-2013-2906","CVE-2013-2923","CVE-2013-2924","CVE-2013-2922",
                "CVE-2013-2921","CVE-2013-2907","CVE-2013-2908","CVE-2013-2909",
                "CVE-2013-2910","CVE-2013-2911","CVE-2013-2912","CVE-2013-2913",
                "CVE-2013-2919","CVE-2013-2918","CVE-2013-2917","CVE-2013-2916",
                "CVE-2013-2915","CVE-2013-2920");
  script_bugtraq_id(62752);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-08 11:03:33 +0200 (Mon, 08 May 2017) $");
  script_tag(name:"creation_date", value:"2013-10-08 06:27:23 +0530 (Tue, 08 Oct 2013)");
  script_name("Google Chrome Multiple Vulnerabilities-01 Oct2013 (Linux)");

  tag_summary =
"This host is installed with Google Chrome and is prone to multiple
vulnerabilities.";

  tag_vuldetect =
"Get the installed version of Google Chrome with the help of detect NVT and
check it is vulnerable or not.";

  tag_insight =
"Multiple flaws exists, For more details refer the reference section.";

  tag_impact =
"Successful exploitation will allow remote attackers to cause a denial of
service and to spoof the address bar or possibly have unspecified other
impacts via some known or unknown vectors.

Impact Level: System/Application";

  tag_affected =
"Google Chrome version before 30.0.1599.66 on Linux";

  tag_solution =
"Upgrade to version 30.0.1599.66 or later
For updates refer to http://www.google.com/chrome";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/55087");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/61885");
  script_xref(name : "URL" , value : "http://googlechromereleases.blogspot.com/2011/10/stable-channel-update.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_google_chrome_detect_lin.nasl");
  script_mandatory_keys("Google-Chrome/Linux/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
chromeVer = "";

## Get version
if(!chromeVer = get_app_version(cpe:CPE, nvt:SCRIPT_OID)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:chromeVer, test_version:"30.0.1599.66"))
{
  security_message(0);
  exit(0);
}
