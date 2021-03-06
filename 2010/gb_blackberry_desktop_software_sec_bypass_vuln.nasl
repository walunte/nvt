###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_blackberry_desktop_software_sec_bypass_vuln.nasl 5263 2017-02-10 13:45:51Z teissa $
#
# BlackBerry Desktop Software Security Bypass Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Updated By: 
# Antu Sanadi <santu@secpod.com> on 2010-10-12
# Updated the version check 
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

tag_impact = "Successful exploitation could allow attackers to steal or guess
document's password via a brute force attacks.

Impact Level: Application";

tag_affected = "BlackBerry Desktop Software version 6.0.0.43 and prior.";

tag_insight = "The flaw is cused due to error in 'offline backup' mechanism in
'Research In Motion' (RIM), which uses single-iteration 'PBKDF2', which
makes it easier for local users to decrypt a '.ipd' file via a brute-force
attack.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host has BlackBerry Desktop Software installed and is prone to
security bypass vulnerability.";

if(description)
{
  script_id(801523);
  script_version("$Revision: 5263 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-10 14:45:51 +0100 (Fri, 10 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-10-08 08:29:14 +0200 (Fri, 08 Oct 2010)");
  script_tag(name:"cvss_base", value:"4.7");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:N/A:N");
  script_cve_id("CVE-2010-3741");
  script_name("BlackBerry Desktop Software Security Bypass Vulnerability");
  script_xref(name : "URL" , value : "http://it.slashdot.org/story/10/10/01/166226/");
  script_xref(name : "URL" , value : "http://twitter.com/elcomsoft/statuses/25954970586");
  script_xref(name : "URL" , value : "http://blog.crackpassword.com/2010/09/smartphone-forensics-cracking-blackberry-backup-passwords/");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Brute force attacks");
  script_dependencies("secpod_blackberry_desktop_software_detect_win.nasl");
  script_require_keys("BlackBerry/Desktop/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

bbdVer = get_kb_item("BlackBerry/Desktop/Win/Ver");
if(!bbdVer){
  exit(0);
}

# Check for BlackBerry Desktop Software version 6.0.0.43
if(version_is_less_equal(version:bbdVer, test_version:"6.0.0.43")){
  security_message(0);
}
