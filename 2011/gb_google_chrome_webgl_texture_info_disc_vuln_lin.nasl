###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_webgl_texture_info_disc_vuln_lin.nasl 7029 2017-08-31 11:51:40Z teissa $
#
# Google Chrome WebGL Texture Information Disclosure Vulnerability (Linux)
#
# Authors:
# Shashi Kiran N <nskiran@secpod.com>
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

tag_impact = "Successful exploitation will allow remote attackers to gain
sensitive information.

Impact Level: Application";

tag_affected = "Google Chrome version 11 on Linux.";

tag_insight = "The flaw is present in the application, which does not block use
of a cross-domain image as a WebGL texture.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is installed with Google Chrome and is prone to
information disclosure Vulnerability.";

if(description)
{
  script_id(802304);
  script_version("$Revision: 7029 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-31 13:51:40 +0200 (Thu, 31 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-07-07 15:43:33 +0200 (Thu, 07 Jul 2011)");
  script_cve_id("CVE-2011-2599");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_name("Google Chrome WebGL Texture Information Disclosure Vulnerability (Linux)");
  script_xref(name : "URL" , value : "http://security-tracker.debian.org/tracker/CVE-2011-2599");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_google_chrome_detect_lin.nasl");
  script_require_keys("Google-Chrome/Linux/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"qod_type", value:"executable_version");
  exit(0);
}


include("version_func.inc");

chromeVer = get_kb_item("Google-Chrome/Linux/Ver");
if(!chromeVer){
  exit(0);
}

# Check for Google Chrome version 11
if(chromeVer =~ "^11\."){
  security_message(0);
}
