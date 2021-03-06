###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_opera_mult_vuln_lin01_jul11.nasl 5988 2017-04-20 09:02:29Z teissa $
#
# Opera Browser Multiple Vulnerabilities-01 July-11 (Linux)
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

tag_impact = "Successful exploitation will allow remote attackers to execute arbitrary
  code and cause a denial of service.
  Impact Level: System/Application";
tag_affected = "Opera Web Browser Version prior 11.11 on Linux";
tag_insight = "The flaws are due to an error,
  - In certain frameset constructs, fails to correctly handle when the page
    is unloaded, causing a memory corruption.
  - When reloading page after opening a pop-up of easy-sticky-note extension.
  - In Cascading Style Sheets (CSS) implementation, when handling the
    column-count property.
  - When handling destruction of a silver light instance.";
tag_solution = "Upgrade to Opera Web Browser Version 11.11 or later,
  For updates refer to http://www.opera.com/download/";
tag_summary = "The host is installed with Opera browser and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_id(802740);
  script_version("$Revision: 5988 $");
  script_cve_id("CVE-2011-2628", "CVE-2011-2629", "CVE-2011-2630", "CVE-2011-2631",
                "CVE-2011-2632", "CVE-2011-2633");
  script_bugtraq_id(48570);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-04-20 11:02:29 +0200 (Thu, 20 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-04-10 11:54:09 +0530 (Tue, 10 Apr 2012)");
  script_name("Opera Browser Multiple Vulnerabilities-01 July-11 (Linux)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/44611");
  script_xref(name : "URL" , value : "http://www.opera.com/support/kb/view/992/");
  script_xref(name : "URL" , value : "http://www.opera.com/docs/changelogs/unix/1111/");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_opera_detection_linux_900037.nasl");
  script_require_keys("Opera/Linux/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("version_func.inc");

## Variable Initialization
operaVer = "";

## Get Opera Version from KB
operaVer = get_kb_item("Opera/Linux/Version");
if(!operaVer){
  exit(0);
}

## Grep for Opera Versions prior to 11.11
if(version_is_less(version:operaVer, test_version:"11.11")){
  security_message(0);
}
