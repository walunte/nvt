###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ikiwiki_teximg_info_disclosure_vuln.nasl 4869 2016-12-29 11:01:45Z teissa $
#
# ikiwiki Teximg Plugin TeX Command Arbitrary File Disclosure Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will let the remote attacker to disclose the content
  of arbitrary local files.
  Impact Level: Application";
tag_affected = "ikiwiki versions 2.x through 2.53.3 and 3.x through 3.1415925";
tag_insight = "The vulnerability is due to error in 'teximg' plugin. It incorrectly
  allows the usage of unsafe TeX commands.";
tag_solution = "Upgrade to ikiwiki version 3.1415926 or 2.53.4
  http://ikiwiki.info/download/";
tag_summary = "This host has ikiwiki installed and is prone to Information Disclosure
  Vulnerability.";

if(description)
{
  script_id(800689);
  script_version("$Revision: 4869 $");
  script_tag(name:"last_modification", value:"$Date: 2016-12-29 12:01:45 +0100 (Thu, 29 Dec 2016) $");
  script_tag(name:"creation_date", value:"2009-09-03 16:18:01 +0200 (Thu, 03 Sep 2009)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_cve_id("CVE-2009-2944");
  script_bugtraq_id(36181);
  script_name("ikiwiki Teximg Plugin TeX Command Arbitrary File Disclosure Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/36516");
  script_xref(name : "URL" , value : "http://ikiwiki.info/security/#index35h2");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2009/2475");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_ikiwiki_detect.nasl");
  script_require_keys("ikiwiki/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("version_func.inc");

ikiwikiVer = get_kb_item("ikiwiki/Ver");
if(ikiwikiVer != NULL)
{
  if(version_in_range(version:ikiwikiVer, test_version:"2.0", test_version2:"2.53.3")||
     version_in_range(version:ikiwikiVer, test_version:"3.0", test_version2:"3.1415925")){
      security_message(0);
  }
}
