###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_prdts_mult_vuln_sep11_win.nasl 7029 2017-08-31 11:51:40Z teissa $
#
# Mozilla Products Multiple Vulnerabilities (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_solution = "Upgrade to Mozilla Firefox version 3.6.20 or later,
  For updates refer to http://www.mozilla.com/en-US/firefox/all.html

  Upgrade to SeaMonkey version to 2.3 or later
  http://www.mozilla.org/projects/seamonkey/";

tag_impact = "Successful exploitation will let attackers to execute arbitrary code in the
  context of the affected application. Failed exploit attempts will likely
  result in denial-of-service conditions.
  Impact Level: System/Application";
tag_affected = "SeaMonkey version 2.0 through 2.2
  Mozilla Firefox version before 3.6.20
  Thunderbird version 3.0 through 3.1.11";
tag_insight = "The flaws are due to
  - An error in the 'event-management' implementation, which fails to select
    the context for script to run in.
  - Improper handling of the dropping of a tab element.
  - An error in 'appendChild()' function, which fails to handle DOM objects.";
tag_summary = "The host is installed with Mozilla firefox/seamonkey/thunderbird
  and is prone to multiple vulnerabilities.";

if(description)
{
  script_id(802150);
  script_version("$Revision: 7029 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-31 13:51:40 +0200 (Thu, 31 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-09-09 17:36:48 +0200 (Fri, 09 Sep 2011)");
  script_cve_id("CVE-2011-2981", "CVE-2011-2984", "CVE-2011-2378");
  script_bugtraq_id(49218, 49219, 49214);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Mozilla Products Multiple Vulnerabilities (Windows)");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/45666/");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2011/mfsa2011-30.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_win.nasl",
                      "gb_seamonkey_detect_win.nasl",
                      "gb_thunderbird_detect_win.nasl");
  script_mandatory_keys("Mozilla/Firefox_or_Seamonkey_or_Thunderbird/Installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

# Firefox Check
ffVer = get_kb_item("Firefox/Win/Ver");
if(ffVer)
{
  # Grep for Firefox version
  if(version_is_less(version:ffVer, test_version:"3.6.20")){
     security_message(0);
     exit(0);
  }
}

# SeaMonkey Check
seaVer = get_kb_item("Seamonkey/Win/Ver");
if(seaVer)
{
  # Grep for SeaMonkey version
  if(version_in_range(version:seaVer, test_version:"2.0", test_version2:"2.2"))
  {
     security_message(0);
     exit(0);
  }
}

# Thunderbird Check
tbVer = get_kb_item("Thunderbird/Win/Ver");
if(tbVer != NULL)
{
  # Grep for Thunderbird version
  if(version_in_range(version:tbVer, test_version:"3.0", test_version2:"3.1.11")){
    security_message(0);
  }
}
