###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_apple_itunes_remote_code_exec_vuln_win.nasl 7044 2017-09-01 11:50:59Z teissa $
#
# Apple iTunes Remote Code Execution Vulnerability (Windows)
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation could allow attackers to execute arbitrary code in
  the context of the user running the affected application.
  Impact Level: Application";
tag_affected = "Apple iTunes version prior to 10.5.1 (10.5.1.42) on Windows";
tag_insight = "The flaw is due to the improper verification of authenticity of
  updates, allows man-in-the-middle attack execute arbitrary code via a
  Trojan horse update.";
tag_solution = "Upgrade to Apple Apple iTunes version 10.5.1 or later,
  For updates refer to http://www.apple.com/itunes/download/";
tag_summary = "This host is installed with Apple iTunes and is prone to remote
  code execution vulnerability.";

if(description)
{
  script_id(902638);
  script_version("$Revision: 7044 $");
  script_cve_id("CVE-2008-3434");
  script_bugtraq_id(50672);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-09-01 13:50:59 +0200 (Fri, 01 Sep 2017) $");
  script_tag(name:"creation_date", value:"2011-11-28 15:07:07 +0530 (Mon, 28 Nov 2011)");
  script_name("Apple iTunes Remote Code Execution Vulnerability (Windows)");
  script_xref(name : "URL" , value : "http://support.apple.com/kb/HT5030");
  script_xref(name : "URL" , value : "http://support.apple.com/kb/HT4981");
  script_xref(name : "URL" , value : "http://lists.apple.com/archives/security-announce/2011/Nov/msg00003.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 SecPod");
  script_family("General");
  script_dependencies("secpod_apple_itunes_detection_win_900123.nasl");
  script_require_keys("iTunes/Win/Ver");
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

ituneVer= get_kb_item("iTunes/Win/Ver");
if(!ituneVer){
  exit(0);
}

## Apple iTunes version < 10.5.1 (10.5.1.42)
if(version_is_less(version:ituneVer, test_version:"10.5.1.42")){
  security_message(0);
}
