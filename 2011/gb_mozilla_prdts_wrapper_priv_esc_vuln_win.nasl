###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_prdts_wrapper_priv_esc_vuln_win.nasl 7019 2017-08-29 11:51:27Z teissa $
#
# Mozilla Products 'NoWaiverWrapper' Privilege Escalation Vulnerability (Windows)
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

tag_solution = "Upgrade to Mozilla Firefox version 8.0 or later,
  For updates refer to http://www.mozilla.com/en-US/firefox/all.html

  Upgrade to Thunderbird version to 8.0 or later
  http://www.mozilla.org/en-US/thunderbird/";

tag_impact = "Successful exploitation will let attackers to gain privileges via a crafted
  web site.
  Impact Level: System/Application";
tag_affected = "Thunderbird version 5.0 through 7.0
  Mozilla Firefox version 4.x through 7.0";
tag_insight = "The flaw is due to, performing access control without checking for
  use of the NoWaiverWrapper wrapper, which allows remote attackers to gain
  privileges via a crafted web site.";
tag_summary = "The host is installed with Mozilla firefox/thunderbird and is prone
  to privilege escalation vulnerability.";

if(description)
{
  script_id(802509);
  script_version("$Revision: 7019 $");
  script_cve_id("CVE-2011-3655");
  script_bugtraq_id(50594);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-08-29 13:51:27 +0200 (Tue, 29 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-11-11 13:42:01 +0530 (Fri, 11 Nov 2011)");
  script_name("Mozilla Products 'NoWaiverWrapper' Privilege Escalation Vulnerability (Windows)");

  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2011/mfsa2011-52.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Privilege escalation");
  script_dependencies("gb_firefox_detect_win.nasl",
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
  if(version_in_range(version:ffVer, test_version:"4.0", test_version2:"7.0"))
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
  if(version_in_range(version:tbVer, test_version:"5.0", test_version2:"7.0")){
    security_message(0);
  }
}
