###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_investintech_prdts_dos_vuln.nasl 6517 2017-07-04 13:34:20Z cfischer $
#
# Investintech Products Denial of Service Vulnerabilities
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
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

tag_impact = "Successful exploitation will allow remote attackers to cause a
denial of service or possibly execute arbitrary code via a crafted PDF document.

Impact Level: System/Application";

tag_affected = "Able2Extract version 7.0 and prior
SlimPDF Reader version 1.0.0.1 and prior
Able2Extract PDF Server version 1.0.0 or prior
Able2Doc and Able2Doc Professional version 6.0 and prior";

tag_insight = "The flaws are due to
- Unspecified errors in Investintech Able2Extract, Able2Doc,
  and Able2Doc Professional.
- Not properly restricting write operations in SlimPDF Reader, the arguments
  to unspecified function calls and read operations during block data moves.
- Fails to prevent faulting-instruction data from affecting write operations
  and faulting-address data from affecting branch selection in SlimPDF Reader.";

tag_solution = "Update to the below versions,
Slim PDF Reader v1.0.1.12:
http://www.investintech.com/download/SPR/1.0.1.12/InstallSlimPDFReader.exe

Able2Doc Std 6.0.8.22:
http://www.investintech.com/download/A2E/7.0.8.22/InstallAble2Doc.exe

Able2Doc Pro 6.0.8.22:
http://www.investintech.com/download/A2E/7.0.8.22/InstallAble2DocPro.exe

Able2Extract Std 7.0.8.22:
http://www.investintech.com/download/A2E/7.0.8.22/InstallAble2Extract.exe

Able2Extract Pro 7.0.8.22:
http://www.investintech.com/download/A2E/7.0.8.22/InstallAble2ExtractPro.exe";

tag_summary = "This host is installed with Investintech products and is prone
to denial of service vulnerability.";

if(description)
{
  script_id(802506);
  script_version("$Revision: 6517 $");
  script_cve_id("CVE-2011-4216", "CVE-2011-4218", "CVE-2011-4219", "CVE-2011-4220",
                "CVE-2011-4217", "CVE-2011-4221", "CVE-2011-4222", "CVE-2011-4223");
  script_bugtraq_id(49923);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-04 15:34:20 +0200 (Tue, 04 Jul 2017) $");
  script_tag(name:"creation_date", value:"2011-11-09 17:35:24 +0530 (Wed, 09 Nov 2011)");
  script_name("Investintech Products Denial of Service Vulnerabilities");
  script_xref(name : "URL" , value : "http://www.kb.cert.org/vuls/id/275036");
  script_xref(name : "URL" , value : "http://www.security-database.com/detail.php?alert=CVE-2011-4216");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_investintech_prdts_detect.nasl");
  script_mandatory_keys("Investintech/Products/Installed");
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  exit(0);
}

include("version_func.inc");

## Get the version for SlimPDF Reader
slimVer = get_kb_item("SlimPDF/Reader/Ver");
if(slimVer)
{
  ## Check the version for SlimPDF Reader
  if(version_is_less_equal(version:slimVer, test_version:"1.0.0.1"))
  {
    security_message(0);
    exit(0);
  }
}

## Get the version for Able2Doc and Able2Doc Professional
docVer = get_kb_item("Able2Doc/Ver");
if(!docVer){
  docVer = get_kb_item("Able2Doc/Pro/Ver");
}

if(docVer != NULL)
{
 ## Check the version for Able2Doc and Able2Doc Professional
 if(version_is_less_equal(version:docVer, test_version:"6.0"))
  {
    security_message(0);
    exit(0);
  }
}

## Get the version for Able2Extract
extractVer = get_kb_item("Able2Extract/Ver");
if(extractVer)
{
  ## Check the version for Able2Extract
  if(version_is_less_equal(version:extractVer, test_version:"7.0")){
    security_message(0);
    exit(0);
  }
}

## Get the version for Able2Extract PDF Server
pdfVer = get_kb_item("Able2Extract/PDF/Server/Ver");
if(pdfVer)
{
  ## Check the version for Able2Extract PDF Server
  if(version_is_less_equal(version:pdfVer, test_version:"1.0.0")){
    security_message(0);
  }
}
