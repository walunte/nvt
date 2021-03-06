###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_comodo_race_cond_vuln01_win.nasl 6079 2017-05-08 09:03:33Z teissa $
#
# Comodo Internet Security Race Condition Vulnerability-01
#
# Authors:
# Arun Kallavi <karun@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation allows local attacker to bypass the defense+
  feature.
  Impact Level: System/Application";

tag_affected = "Comodo Internet Security versions before 5.8.211697.2124";
tag_insight = "Unspecified flaw that is triggered by multiple race conditions.";
tag_solution = "Upgrade to Comodo Internet Security version 5.8.211697.2124 or later,
  For updates refer to http://personalfirewall.comodo.com";
tag_summary = "The host is installed with Comodo Internet Security and is prone
  to race condition vulnerability.";

if(description)
{
  script_id(803684);
  script_version("$Revision: 6079 $");
  script_cve_id("CVE-2011-5119");
  script_tag(name:"cvss_base", value:"1.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-05-08 11:03:33 +0200 (Mon, 08 May 2017) $");
  script_tag(name:"creation_date", value:"2013-07-05 15:20:22 +0530 (Fri, 05 Jul 2013)");
  script_name("Comodo Internet Security Race Condition Vulnerability-01");
  script_xref(name : "URL" , value : "http://en.securitylab.ru/nvd/429023.php");
  script_xref(name : "URL" , value : "http://personalfirewall.comodo.com/release_notes.html");
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_comodo_internet_security_detect_win.nasl");
  script_mandatory_keys("Comodo/InternetSecurity/Win/Ver");
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

# Variable Initialization
Ver ="";

# Get the version from KB
Ver = get_kb_item("Comodo/InternetSecurity/Win/Ver");

# Check for Comodo Internet Security Version
if(Ver)
{
  if(version_is_less(version:Ver, test_version:"5.8.211697.2124")){
    security_message(0);
    exit(0);
  }
}
