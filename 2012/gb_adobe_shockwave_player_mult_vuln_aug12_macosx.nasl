###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_shockwave_player_mult_vuln_aug12_macosx.nasl 5958 2017-04-17 09:02:19Z teissa $
#
# Adobe Shockwave Player Multiple Vulnerabilities - August 2012 (Mac Os X)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow attackers to cause denial of service or
  execute arbitrary code by tricking a user into visiting a specially crafted
  web page.
  Impact Level: System/Application";
tag_affected = "Adobe Shockwave Player Versions 11.6.5.635 and prior on Mac OS X";
tag_insight = "The flaws are due to multiple unspecified errors in the application.";
tag_solution = "Upgrade to Adobe Shockwave Player version 11.6.6.636 or later,
  For updates refer to http://get.adobe.com/shockwave/otherversions/";
tag_summary = "This host is installed with Adobe Shockwave Player and is prone
  to multiple vulnerabilities.";

if(description)
{
  script_id(802939);
  script_version("$Revision: 5958 $");
  script_cve_id("CVE-2012-2043", "CVE-2012-2044", "CVE-2012-2045", "CVE-2012-2046",
                "CVE-2012-2047");
  script_bugtraq_id(55025, 55028, 55029, 55030, 55031);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-04-17 11:02:19 +0200 (Mon, 17 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-08-20 12:36:45 +0530 (Mon, 20 Aug 2012)");
  script_name("Adobe Shockwave Player Multiple Vulnerabilities - August 2012 (Mac OS X)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/50283/");
  script_xref(name : "URL" , value : "http://www.adobe.com/support/security/bulletins/apsb12-17.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_prdts_detect_macosx.nasl");
  script_require_keys("Adobe/Shockwave/Player/MacOSX/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

## Variables Initialization
shockVer = "";

shockVer = get_kb_item("Adobe/Shockwave/Player/MacOSX/Version");
if(!shockVer){
  exit(0);
}

## Check for Adobe Shockwave Player versions prior to 11.6.5.635
if(version_is_less_equal(version:shockVer, test_version:"11.6.5.635")){
  security_message(0);
}
