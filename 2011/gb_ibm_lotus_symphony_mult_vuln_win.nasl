###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_lotus_symphony_mult_vuln_win.nasl 7024 2017-08-30 11:51:43Z teissa $
#
# IBM Lotus Symphony Multiple Vulnerabilities (Windows)
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
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

tag_solution = "Upgrade to IBM Lotus Symphony version 3 FP3 or later,
  For updates refer to http://www.ibm.com/software/lotus/symphony/home.nsf/home

  *****
  NOTE: Ignore this warning, if above mentioned patch is already applied.
  *****";

tag_impact = "Successful exploitation will allow attacker to cause a denial of service.
  Impact Level: Application";
tag_affected = "IBM Lotus Symphony Version 3 before FP3.";
tag_insight = "Multiple flaws are due to unspecified errors related to,
  - critical security vulnerability issues.
  - sample .doc document that incorporates a user-defined toolbar.
  - a .docx document with empty bullet styles for parent bullets.
  - complex graphics in a presentation.
  - a large .xls spreadsheet with an invalid Value reference.";
tag_summary = "This host is installed with IBM Lotus Symphony and is prone to
  multiple unspecified vulnerabilities.";

if(description)
{
  script_id(802227);
  script_version("$Revision: 7024 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-30 13:51:43 +0200 (Wed, 30 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-08-05 09:04:20 +0200 (Fri, 05 Aug 2011)");
  script_cve_id("CVE-2011-2884", "CVE-2011-2885", "CVE-2011-2886",
                "CVE-2011-2888", "CVE-2011-2893");
  script_bugtraq_id(48936);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("IBM Lotus Symphony Multiple Vulnerabilities (Windows)");


  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_ibm_lotus_symphony_detect_win.nasl");
  script_require_keys("IBM/Lotus/Symphony/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/45271");
  script_xref(name : "URL" , value : "https://www-304.ibm.com/support/docview.wss?uid=swg21505448");
  script_xref(name : "URL" , value : "http://www-03.ibm.com/software/lotus/symphony/idcontents/releasenotes/en/readme_fixpack3_standalone_long.htm");
  script_xref(name : "URL" , value : "https://www-304.ibm.com/jct03001c/software/lotus/symphony/idcontents/releasenotes/en/readme_embedded_in_fixpack3_long.htm");
  script_xref(name : "URL" , value : "http://www-03.ibm.com/software/lotus/symphony/buzz.nsf/web_DisPlayPlugin?open&unid=9717F6F587AAA939852578D300404BCF&category=announcements");
  exit(0);
}


include("version_func.inc");

## Get version from KB
version = get_kb_item("IBM/Lotus/Symphony/Win/Ver");
if(version =~ "^3\..*")
{
  ## Check for IBM Lotus Symphony Version 3 FP2 and prior.
  if(version_is_less_equal(version:version, test_version:"3.0.10289")){
    security_message(0);
  }
}
