###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_freetype_mult_dos_vuln_win.nasl 5394 2017-02-22 09:22:42Z teissa $
#
# FreeType Multiple Denial of Service Vulnerabilities (Windows)
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation may allow attackers to execute arbitrary code in the
  context of an application that uses the affected library. Failed exploitation
  attempts will likely result in denial-of-service conditions.
  Impact Level: Application";
tag_affected = "FreeType version 2.4.1 and prior.";
tag_insight = "- Buffer overflow error in the 'Mac_Read_POST_Resource()' [src/base/ftobjs.c]
    function when processig Adobe Type 1 Mac Font File (LWFN) fonts.
  - Errors related to the bdf/bdflib.c, t42_parse_sfnts function in
    type42/t42parse.c, FT_Stream_EnterFrame function in base/ftstream.c,
    ftmulti.c in the ftmulti demo program and to the 'BOUNDS' macro when
    processing fonts.";
tag_solution = "Upgrade to FreeType version 2.4.2 or later,
  For updates refer to http://www.freetype.org/";
tag_summary = "This host is installed with FreeType and is prone to multiple Denial
  of Service vulnerabilities.";

if(description)
{
  script_id(901142);
  script_version("$Revision: 5394 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-22 10:22:42 +0100 (Wed, 22 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-09-01 09:34:36 +0200 (Wed, 01 Sep 2010)");
  script_bugtraq_id(42285);
  script_cve_id("CVE-2010-3053", "CVE-2010-2808", "CVE-2010-2807",
                "CVE-2010-2806", "CVE-2010-2805", "CVE-2010-2541");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_name("FreeType Multiple denial of service vulnerabilities (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/40816");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/2018");
  script_xref(name : "URL" , value : "http://sourceforge.net/projects/freetype/files/freetype2/2.4.2/NEWS/view");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Denial of Service");
  script_dependencies("secpod_freetype_detect_win.nasl");
  script_require_keys("FreeType/Win/Ver");
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

## Get FreeType Version From KB
ftVer = get_kb_item("FreeType/Win/Ver");
if(! ftVer) {
  exit(0);
}

if(ftVer != NULL)
{
  ## Check for FreeType version prior to 2.4.2
  if(version_is_less(version: ftVer, test_version: "2.4.2")){
    security_message(0);
  }
}
