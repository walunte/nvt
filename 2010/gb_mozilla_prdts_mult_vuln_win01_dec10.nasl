###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_prdts_mult_vuln_win01_dec10.nasl 6444 2017-06-27 11:24:02Z santu $
#
# Mozilla Products Multiple Vulnerabilities dec-10 (Windows)
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

tag_solution = "Upgrade to Firefox version 3.5.16 or 3.6.13 or later
  http://www.mozilla.com/en-US/firefox/all.html

  Upgrade to Seamonkey version 2.0.11 or later
  http://www.seamonkey-project.org/releases/";

tag_impact = "Successful exploitation will let attackers to execute arbitrary code.
  Impact Level: Application";
tag_affected = "Seamonkey version before 2.0.11
  Firefox version before 3.5.16 and 3.6.x before 3.6.13";
tag_insight = "The flaws are due to:
  - Use-after-free vulnerability.
  - Integer overflow in the NewIdArray function.
  - Cross-site Scripting (XSS) vulnerabilities in the rendering engine allows
    remote attackers to inject arbitrary web script.
  - Not properly handle injection of an 'ISINDEX' element into an
    about:blank page.
  - Error in 'XMLHttpRequestSpy' module in the 'Firebug' add-on is used,
    does not properly handle interaction between the 'XMLHttpRequestSpy' object
    and chrome privileged objects.
  - Not properly calculate index values for certain child content in a 'XUL'
    tree.
  - Error in 'NS_SecurityCompareURIs' function in netwerk/base/public/nsNetUtil.h
    which does not properly handle 'about:neterror' and 'about:certerror' pages.
  - Not properly handle certain redirections involving 'data: URLs' and
    'Java LiveConnect' scripts, which allows remote attackers to start processes.";
tag_summary = "The host is installed with Mozilla Firefox/Seamonkey that are
  prone to multiple vulnerabilities.";

if(description)
{
  script_id(801498);
  script_version("$Revision: 6444 $");
  script_tag(name:"last_modification", value:"$Date: 2017-06-27 13:24:02 +0200 (Tue, 27 Jun 2017) $");
  script_tag(name:"creation_date", value:"2010-12-27 09:55:05 +0100 (Mon, 27 Dec 2010)");
  script_cve_id("CVE-2010-3766", "CVE-2010-3767", "CVE-2010-3770", "CVE-2010-3771",
                "CVE-2010-3773", "CVE-2010-3772", "CVE-2010-3774", "CVE-2010-3775");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Mozilla Products Multiple Vulnerabilities dec-10 (Windows)");

  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2010/mfsa2010-80.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2010/mfsa2010-81.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2010/mfsa2010-84.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2010/mfsa2010-76.html");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_win.nasl", "gb_seamonkey_detect_win.nasl");
  script_mandatory_keys("Mozilla/Firefox_or_Seamonkey_or_Thunderbird/Installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  exit(0);
}


include("version_func.inc");

## Firefox Check
ffVer = get_kb_item("Firefox/Win/Ver");
if(ffVer)
{
  ## Grep for Firefox version < 3.5.16, 3.6.x < 3.6.13
  if(version_in_range(version:ffVer, test_version:"3.6", test_version2:"3.6.13") ||
     version_is_less(version:ffVer, test_version:"3.5.16"))
     {
       security_message(0);
       exit(0);
     }
}

## Seamonkey Check
smVer = get_kb_item("Seamonkey/Win/Ver");
if(smVer != NULL)
{
  ## Grep for Seamonkey version 2.0.11
  if(version_is_less(version:smVer, test_version:"2.0.11"))
  {
    security_message(0);
    exit(0);
  }
}
