###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_winword_ms14-081.nasl 6769 2017-07-20 09:56:33Z teissa $
#
# Microsoft Office Word Remote Code Execution Vulnerabilities (3017301)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805025");
  script_version("$Revision: 6769 $");
  script_cve_id("CVE-2014-6356", "CVE-2014-6357");
  script_bugtraq_id(71469, 71470);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-20 11:56:33 +0200 (Thu, 20 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-12-10 12:08:06 +0530 (Wed, 10 Dec 2014)");
  script_name("Microsoft Office Word Remote Code Execution Vulnerabilities (3017301)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS14-081.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaws are due to,
  - An invalid indexing error when parsing Office files can be exploited to
    execute arbitrary code via a specially crafted Office file.
  - A use-after-free error when parsing Office files can be exploited to execute
    arbitrary code via a specially crafted Office file.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute the arbitrary code, cause memory corruption and
  compromise the system.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"
  Microsoft Word 2007 SP3 and prior
  Microsoft Word 2010 Service Pack 2 and prior
  Microsoft Word 2013 Service Pack 1 and prior");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS14-081");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/61149");
  script_xref(name : "URL" , value : "https://support.microsoft.com/kb/3017301");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS14-081");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/Word/Version");
  exit(0);
}


include("version_func.inc");

## variable Initialization
winwordVer = "";

winwordVer = get_kb_item("SMB/Office/Word/Version");

## Microsoft Office Word 2007
if(winwordVer && winwordVer =~ "^(12|14|15).*")
{
  ## Grep for version Winword.exe 12 < 12.0.6707.5000, 14 < 14.0.7140.5000
  ## 15 < 15.0.4675.1000
  if(version_in_range(version:winwordVer, test_version:"12.0", test_version2:"12.0.6713.4999") ||
     version_in_range(version:winwordVer, test_version:"14.0", test_version2:"14.0.7140.4999") ||
     version_in_range(version:winwordVer, test_version:"15.0", test_version2:"15.0.4675.999"))
  {
    security_message(0);
    exit(0);
  }
}
