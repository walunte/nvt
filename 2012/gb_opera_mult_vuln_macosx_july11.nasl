###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_opera_mult_vuln_macosx_july11.nasl 5956 2017-04-14 09:02:12Z teissa $
#
# Opera Browser Multiple Vulnerabilities July-11 (Mac OS X)
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

tag_impact = "Successful exploitation will allow remote attackers to execute arbitrary code
  and cause a denial of service.
  Impact Level: System/Application";
tag_affected = "Opera Web Browser version prior 11.50 on Mac OS X";
tag_insight = "For information about vulnerability refer the references.";
tag_solution = "Upgrade to Opera Web Browser version 11.50 or later,
  For updates refer to http://www.opera.com/download/";
tag_summary = "The host is installed with Opera browser and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_id(802753);
  script_version("$Revision: 5956 $");
  script_cve_id("CVE-2011-1337", "CVE-2011-2609", "CVE-2011-2610", "CVE-2011-2611",
                "CVE-2011-2612", "CVE-2011-2613", "CVE-2011-2614", "CVE-2011-2615",
                "CVE-2011-2616", "CVE-2011-2617", "CVE-2011-2618", "CVE-2011-2619",
                "CVE-2011-2620", "CVE-2011-2621", "CVE-2011-2622", "CVE-2011-2623",
                "CVE-2011-2624", "CVE-2011-2625", "CVE-2011-2626", "CVE-2011-2627");
  script_bugtraq_id(48501, 48500, 48556);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-04-14 11:02:12 +0200 (Fri, 14 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-04-19 10:01:43 +0530 (Thu, 19 Apr 2012)");
  script_name("Opera Browser Multiple Vulnerabilities July-11 (Mac OS X)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/45060");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/68323");
  script_xref(name : "URL" , value : "http://www.opera.com/docs/changelogs/mac/1150/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_opera_detect_macosx.nasl");
  script_require_keys("Opera/MacOSX/Version");
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

## Variable Initialization
operaVer = "";

## Get Opera Version from KB
operaVer = get_kb_item("Opera/MacOSX/Version");
if(!operaVer){
  exit(0);
}

## Grep for Opera Versions prior to 11.50
if(version_is_less(version:operaVer, test_version:"11.50")){
  security_message(0);
}
