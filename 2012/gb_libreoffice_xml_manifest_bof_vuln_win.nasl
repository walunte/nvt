###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_libreoffice_xml_manifest_bof_vuln_win.nasl 5963 2017-04-18 09:02:14Z teissa $
#
# LibreOffice XML Manifest Handling Buffer Overflow Vulnerabilities (Windows)
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
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

tag_impact = "Successful exploitation will allow remote attackers to cause a denial of
  service condition or execute arbitrary code.
  Impact Level: System/Application";
tag_affected = "LibreOffice version before 3.5.5 on Windows";

tag_insight = "Multiple heap-based buffer overflows in the XML manifest encryption tag
  parsing functionality allows attacker to crash the application via crafted
  Open Document Tex (.odt) file.";
tag_solution = "Upgrade to LibreOffice version 3.5.5 or later,
  For updates refer to http://www.libreoffice.org/download/";
tag_summary = "This host is installed with LibreOffice and is prone to buffer
  overflow vulnerabilities.";

if(description)
{
  script_id(803086);
  script_version("$Revision: 5963 $");
  script_cve_id("CVE-2012-2665");
  script_bugtraq_id(54769);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-04-18 11:02:14 +0200 (Tue, 18 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-12-24 17:30:05 +0530 (Mon, 24 Dec 2012)");
  script_name("LibreOffice XML Manifest Handling Buffer Overflow Vulnerabilities (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/50142/");
  script_xref(name : "URL" , value : "http://www.libreoffice.org/advisories/CVE-2012-2665/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("secpod_libre_office_detect_win.nasl");
  script_require_keys("LibreOffice/Win/Ver");
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

libreVer = "";

## Get the version from KB
libreVer = get_kb_item("LibreOffice/Win/Ver");
if(!libreVer){
  exit(0);
}

## Check for LibreOffice version less than 3.5.5
if(version_is_less(version: libreVer, test_version:"3.5.5")){
  security_message(0);
}
