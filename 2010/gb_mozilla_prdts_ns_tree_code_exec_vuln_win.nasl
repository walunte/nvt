###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_prdts_ns_tree_code_exec_vuln_win.nasl 6444 2017-06-27 11:24:02Z santu $
#
# Mozilla Products 'nsTreeSelection' Denial of Service vulnerability (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_solution = "Upgrade to Firefox version 3.0.19 or 3.5.9
  http://www.mozilla.com/en-US/firefox/all.html

  Upgrade to Seamonkey version 2.0.4
  http://www.seamonkey-project.org/releases/

  Upgrade to Thunderbird version 3.0.4
  http://www.mozillamessaging.com/en-US/thunderbird/";

tag_impact = "Successful exploitation will let attackers to execute arbitrary code on the
  system or cause the browser to crash.
  Impact Level: Application";
tag_affected = "Seamonkey version prior to 2.0.4
  Thunderbird version proior to 3.0.4
  Firefox version before 3.0.19 and 3.5.x before 3.5.9";
tag_insight = "The flaw is due to an error in the 'nsTreeSelection' implementation, that
  allows to execute arbitrary code or application crash via unspecified vectors
  that trigger a call to a certain event handler.";
tag_summary = "The host is installed with Mozilla Firefox/Seamonkey/Thunderbird and is prone
  to Denial of Servcie vulnerability.";

if(description)
{
  script_id(800751);
  script_version("$Revision: 6444 $");
  script_tag(name:"last_modification", value:"$Date: 2017-06-27 13:24:02 +0200 (Tue, 27 Jun 2017) $");
  script_tag(name:"creation_date", value:"2010-04-13 16:55:19 +0200 (Tue, 13 Apr 2010)");
  script_cve_id("CVE-2010-0175");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Mozilla Products 'nsTreeSelection' Denial of Service vulnerability (Windows)");

  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/57390");
  script_xref(name : "URL" , value : "http://securitytracker.com/alerts/2010/Mar/1023780.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2010/mfsa2010-17.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_win.nasl", "gb_seamonkey_detect_win.nasl",
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
  # Grep for Firefox version < 3.0.19 and 3.5 < 3.5.9
  if(version_is_less(version:ffVer, test_version:"3.0.19") ||
     version_in_range(version:ffVer, test_version:"3.5", test_version2:"3.5.8"))
     {
       security_message(0);
       exit(0);
     }
}

# Seamonkey Check
smVer = get_kb_item("Seamonkey/Win/Ver");
if(smVer != NULL)
{
  # Grep for Seamonkey version < 2.0.4
  if(version_is_less(version:smVer, test_version:"2.0.4"))
  {
    security_message(0);
    exit(0);
  }
}

# Thunderbird Check
tbVer = get_kb_item("Thunderbird/Win/Ver");
if(tbVer != NULL)
{
  # Grep for Thunderbird version < 3.0.4
  if(version_is_less(version:tbVer, test_version:"3.0.4")){
    security_message(0);
  }
}
