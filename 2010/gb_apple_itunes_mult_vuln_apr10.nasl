###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_itunes_mult_vuln_apr10.nasl 5263 2017-02-10 13:45:51Z teissa $
#
# Apple iTunes Multiple Vulnerabilities - Apr10
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

tag_impact = "Successful exploitation could allow the attacker to cause denial of service and
  obtain system privileges during installation.
  Impact Level: Application";
tag_affected = "Apple iTunes version prior to 9.1 (9.1.0.79)";
tag_insight = "Multiple flaws are due to:
  - An infinite loop issue in the handling of 'MP4' files. A maliciously
    crafted podcast may be able to cause an infinite loop in iTunes, and prevent
    its operation even after it is relaunched.
  - A privilege escalation issue in Windows installation package. During
    the installation process, a race condition may allow a local user to modify
    a file that is then executed with system privileges.";
tag_solution = "Upgrade to Apple Apple iTunes version 9.1 or later,
  For updates refer to http://www.apple.com/itunes/download/";
tag_summary = "This host has iTunes installed, which is prone to multiple
  vulnerabilities.";

if(description)
{
  script_id(800495);
  script_version("$Revision: 5263 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-10 14:45:51 +0100 (Fri, 10 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-04-06 08:47:09 +0200 (Tue, 06 Apr 2010)");
  script_cve_id("CVE-2010-0531", "CVE-2010-0532");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Apple iTunes Multiple Vulnerabilities - Apr10");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/39135");
  script_xref(name : "URL" , value : "http://en.securitylab.ru/nvd/392444.php");
  script_xref(name : "URL" , value : "http://lists.apple.com/archives/security-announce/2010//Mar/msg00003.html");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("General");
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

ituneVer= get_kb_item("iTunes/Win/Ver");
if(!ituneVer){
  exit(0);
}

#  Apple iTunes version < 9.1 (9.1.0.79)
if(version_is_less(version:ituneVer, test_version:"9.1.0.79")){
  security_message(0);
}
