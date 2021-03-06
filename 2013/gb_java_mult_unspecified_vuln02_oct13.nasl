###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_java_mult_unspecified_vuln02_oct13.nasl 6104 2017-05-11 09:03:48Z teissa $
#
# Oracle Java SE JRE Multiple Unspecified Vulnerabilities-02 Oct 2013 (Windows)
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

CPE = "cpe:/a:oracle:jre";
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.804118";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6104 $");
  script_cve_id("CVE-2013-5831", "CVE-2013-5832", "CVE-2013-5812", "CVE-2013-5824",
                "CVE-2013-5818", "CVE-2013-5819", "CVE-2013-5823", "CVE-2013-5789",
                "CVE-2013-5820", "CVE-2013-5852", "CVE-2013-5848", "CVE-2013-5776",
                "CVE-2013-5772", "CVE-2013-5784", "CVE-2013-5787" );
  script_bugtraq_id(63129, 63158, 63126, 63157, 63141, 63110, 63139, 63133, 63130,
                    63124, 63156, 63152, 63089, 63098, 63155);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-05-11 11:03:48 +0200 (Thu, 11 May 2017) $");
  script_tag(name:"creation_date", value:"2013-10-25 19:03:24 +0530 (Fri, 25 Oct 2013)");
  script_name("Oracle Java SE JRE Multiple Unspecified Vulnerabilities-02 Oct 2013 (Windows)");

  tag_summary =
"This host is installed with Oracle Java SE JRE and is prone to multiple
vulnerabilities.";

  tag_vuldetect =
"Get the installed version of Oracle Java SE JRE with the help of detect NVT
and check it is vulnerable or not.";

  tag_insight =
"Multiple unspecified vulnerabilities exists, For more details about the
vulnerabilities refer the reference section.";

  tag_impact =
"Successful exploitation will allow remote attackers to affect confidentiality,
integrity, and availability via unknown vectors.

Impact Level: System/Application.";

  tag_affected =
"Oracle Java SE 7 update 40 and earlier, 6 update 60 and earlier on Windows";

  tag_solution =
"Apply the patch from below link,
http://www.oracle.com/technetwork/topics/security/cpuoct2013-1899837.html";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/55315");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/63158");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/cpuoct2013-1899837.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
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
if(!jreVer = get_app_version(cpe:CPE, nvt:SCRIPT_OID))
{
  CPE="cpe:/a:sun:jre";
  if(!jreVer = get_app_version (cpe:CPE, nvt:SCRIPT_OID)){
    exit(0);
  }
}


if(jreVer =~ "^(1\.(6|7))")
{
  jreVer = ereg_replace(pattern:"[a-z]+_|-", string:jreVer, replace: ".");

  ##Check for Oracle Java SE Versions
  if(version_in_range(version:jreVer, test_version:"1.6.0.0", test_version2:"1.6.0.60")||
     version_in_range(version:jreVer, test_version:"1.7.0.0", test_version2:"1.7.0.40"))
  {
    security_message(0);
    exit(0);
  }
}
