###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_libreoffice_use_after_free_vuln_july16_win.nasl 5527 2017-03-09 10:00:25Z teissa $
#
# LibreOffice Use-after-free Vulnerability July16 (Windows)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:libreoffice:libreoffice";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808574");
  script_version("$Revision: 5527 $");
  script_cve_id("CVE-2016-4324");
  script_bugtraq_id(91499);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-03-09 11:00:25 +0100 (Thu, 09 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-07-12 11:01:16 +0530 (Tue, 12 Jul 2016)");
  script_tag(name:"qod_type", value:"registry");
  script_name("LibreOffice Use-after-free Vulnerability July16 (Windows)");

  script_tag(name: "summary" , value:"The host is installed with LibreOffice
  and is prone to use-after-free vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw is due to insufficient validation
  of RTF parser validity.");

  script_tag(name: "impact" , value:"Successful exploitation will allows remote
  attackers to execute arbitrary code.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"LibreOffice version before 5.1.4 on Windows.");

  script_tag(name: "solution" , value:"Upgrade to LibreOffice version
  5.1.4 or 5.2.0 or later, For updates refer to http://www.libreoffice.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www.libreoffice.org/about-us/security/advisories/cve-2016-4324");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("secpod_libre_office_detect_win.nasl");
  script_mandatory_keys("LibreOffice/Win/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
libreVer = "";
report = "";

## Get version
if(!libreVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:libreVer, test_version:"5.1.4"))
{
  report = report_fixed_ver(installed_version:libreVer, fixed_version:"5.1.4 or 5.2.0");
  security_message(data:report);
  exit(0);
}
