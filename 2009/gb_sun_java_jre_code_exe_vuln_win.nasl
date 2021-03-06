###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_sun_java_jre_code_exe_vuln_win.nasl 6465 2017-06-28 13:17:01Z cfischer $
#
# Sun Java JRE Remote Code Execution Vulnerability (Windows)
#
# Authors:
# Nikita MR <rnikita@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation allows remote attackers to execute arbitrary code in
  the context of the affected application.
  Impact Level: Application.";
tag_affected = "Sun Java JRE 6 prior to 6 Update 17 on Windows.";
tag_insight = "- A command execution vulnerability in the Java Runtime Environment Deployment
    Toolkit may be exploited via specially crafted web pages.
  - An error occurs while using security model permissions when removing
    installer extensions and may allow an untrusted applications to run
    as a trusted application.
  - An error occurs while handling interaction between a signed JAR file
    and a JNLP application or applet.";
tag_solution = "Upgrade to JRE version 6 Update 17
  http://java.sun.com/javase/downloads/index.jsp";
tag_summary = "This host is installed with Sun Java JRE and is prone to Remote
  Code Execution Vulnerability.";

if(description)
{
  script_id(800977);
  script_version("$Revision: 6465 $");
  script_tag(name:"last_modification", value:"$Date: 2017-06-28 15:17:01 +0200 (Wed, 28 Jun 2017) $");
  script_tag(name:"creation_date", value:"2009-11-13 15:48:12 +0100 (Fri, 13 Nov 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-3865", "CVE-2009-3866", "CVE-2009-3886");
  script_bugtraq_id(36881);
  script_name("Sun Java JRE Remote Code Execution Vulnerability (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/37231");
  script_xref(name : "URL" , value : "http://java.sun.com/javase/6/webnotes/6u17.html");
  script_xref(name : "URL" , value : "http://sunsolve.sun.com/search/document.do?assetkey=1-66-269870-1");
  script_xref(name : "URL" , value : "http://sunsolve.sun.com/search/document.do?assetkey=1-66-269869-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_win.nasl");
  script_mandatory_keys("Sun/Java/JDK_or_JRE/Win/installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

i = 0;
if(jreVer = get_kb_item("Sun/Java/JRE/Win/Ver")) {
   version[i] = jreVer;
   i++;
}

if(jdkVer = get_kb_item("Sun/Java/JDK/Win/Ver")) {
   version[i] = jdkVer;
}

foreach ver (version)
{
  if(ver)
  {
    ver = ereg_replace(pattern:"_", string:ver, replace: ".");
    # Check for 1.6 < 1.6.0_17 (6 Update 17)
    if(version_in_range(version:ver, test_version:"1.6", test_version2:"1.6.0.16"))
    {
      security_message(0);
      exit(0);
    }
  }
}
