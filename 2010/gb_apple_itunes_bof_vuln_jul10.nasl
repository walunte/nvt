###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_itunes_bof_vuln_jul10.nasl 5263 2017-02-10 13:45:51Z teissa $
#
# Apple iTunes 'itpc:' URI Buffer Overflow Vulnerability
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

tag_impact = "Successful exploitation could allow the attacker to execute arbitrary code in
  the context of an application. Failed exploit attempts will result in a
  denial-of-service condition.
  Impact Level: Application";
tag_affected = "Apple iTunes version prior to 9.2.1";
tag_insight = "The flaw is exists in the handling of 'itpc:' URL, when loaded by the user
  will trigger a buffer overflow and execute arbitrary code on the target
  system.";
tag_solution = "Upgrade to Apple iTunes version 9.2.1 or later,
  For updates refer to http://www.apple.com/itunes/download/";
tag_summary = "This host has iTunes installed, which is prone to buffer overflow
  vulnerability.";

if(description)
{
  script_id(801409);
  script_version("$Revision: 5263 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-10 14:45:51 +0100 (Fri, 10 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-07-26 16:14:51 +0200 (Mon, 26 Jul 2010)");
  script_bugtraq_id(41789);
  script_cve_id("CVE-2010-1777");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Apple iTunes 'itpc:' URI Buffer Overflow Vulnerability");
  script_xref(name : "URL" , value : "http://isc.sans.edu/diary.html?storyid=9202");
  script_xref(name : "URL" , value : "http://securitytracker.com/alerts/2010/Jul/1024220.html");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("secpod_apple_itunes_detection_win_900123.nasl");
  script_require_keys("iTunes/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("version_func.inc");

## Get Apple iTunes version from KB
ituneVer = get_kb_item("iTunes/Win/Ver");
if(!ituneVer){
  exit(0);
}

## Check for Apple iTunes version < 9.1.2
if(version_is_less(version:ituneVer, test_version:"9.2.1")){
  security_message(0);
}
