###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_java_unspecified_vuln05_oct14.nasl 7174 2017-09-18 11:48:08Z asteins $
#
# Oracle Java SE JRE Unspecified Vulnerability-05 Oct 2014 (Windows)
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

CPE = "cpe:/a:oracle:jre";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804866");
  script_version("$Revision: 7174 $");
  script_cve_id("CVE-2014-6504");
  script_bugtraq_id(70564);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-09-18 13:48:08 +0200 (Mon, 18 Sep 2017) $");
  script_tag(name:"creation_date", value:"2014-10-20 14:00:18 +0530 (Mon, 20 Oct 2014)");

  script_name("Oracle Java SE JRE Unspecified Vulnerability-05 Oct 2014 (Windows)");

  script_tag(name: "summary" , value:"The host is installed with Oracle Java SE JRE
  and is prone to unspecified vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version of Oracle Java
  SE JRE with the help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists due to an error related to C2
  optimizations and range checks in the Hotspot subcomponent.");

  script_tag(name: "impact" , value:"Successful exploitation will allow attackers
  to disclose sensitive information.

  Impact Level: Application.");

  script_tag(name: "affected" , value:"Oracle Java SE 5.0u71 and prior, 6u81 and
  prior, and 7u67 and prior on Windows");

  script_tag(name: "solution" , value:"Apply the patch from below link,
  http://www.oracle.com/technetwork/topics/security/cpuoct2014-1972960.html");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/61609/");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/cpuoct2014-1972960.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_win.nasl");
  script_mandatory_keys("Sun/Java/JRE/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
jreVer = "";

## Get version
if(!jreVer = get_app_version(cpe:CPE))
{
  CPE = "cpe:/a:sun:jre";
  if(!jreVer = get_app_version(cpe:CPE)){
    exit(0);
  }
}

if(jreVer =~ "^(1\.(5|6|7))")
{
  jreVer = ereg_replace(pattern:"[a-z]+_|-", string:jreVer, replace: ".");

  ##Check for Oracle Java SE Versions
  if(version_in_range(version:jreVer, test_version:"1.5.0", test_version2:"1.5.0.71")||
     version_in_range(version:jreVer, test_version:"1.6.0", test_version2:"1.6.0.81")||
     version_in_range(version:jreVer, test_version:"1.7.0", test_version2:"1.7.0.67"))
  {
    security_message(0);
    exit(0);
  }
}
