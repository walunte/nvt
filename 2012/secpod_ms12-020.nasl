###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms12-020.nasl 5341 2017-02-18 16:59:12Z cfi $
#
# Microsoft Remote Desktop Protocol Remote Code Execution Vulnerabilities (2671387)
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
#
# Copyright:
# Copyright (c) 2012 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation could allow remote attackers to execute arbitrary
  code as the logged-on user or cause a denial of service condition.
  Impact Level: System/Application";
tag_affected = "Microsoft Windows XP x32 Edition Service Pack 3 and prior
  Microsoft Windows XP x64 Edition Service Pack 2 and prior
  Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior
  Microsoft Windows 2003 x32/x64 Edition Service Pack 2 and prior
  Microsoft Windows Vista x32/x64 Edition Service Pack 2 and prior
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2 and prior";
tag_insight = "The flaws are due to the way Remote Desktop Protocol accesses an
  object in memory that has been improperly initialized or has been deleted
  and the way RDP service processes the packets.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://technet.microsoft.com/en-us/security/bulletin/ms12-020";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS12-020.";

if(description)
{
  script_id(902663);
  script_version("$Revision: 5341 $");
  script_cve_id("CVE-2012-0002", "CVE-2012-0152");
  script_bugtraq_id(52353, 52354);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-02-18 17:59:12 +0100 (Sat, 18 Feb 2017) $");
  script_tag(name:"creation_date", value:"2012-03-14 09:43:49 +0530 (Wed, 14 Mar 2012)");
  script_name("Microsoft Remote Desktop Protocol Remote Code Execution Vulnerabilities (2671387)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/48395");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2671387");
  script_xref(name : "URL" , value : "http://www.securitytracker.com/id/1026790");
  script_xref(name : "URL" , value : "http://technet.microsoft.com/en-us/security/bulletin/ms12-020");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
rdpVer1 = "";
rdpVer2 = "";

## Check for OS and Service Packi
## Currently not supporting for Vista and Windows Server 2008 64 bit
if(hotfix_check_sp(xp:4, win2003:3, winVista:3, win7:2, win2008:3) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

## Get Version from Rdpwd.sys file
rdpVer1 = fetch_file_version(sysPath, file_name:"system32\drivers\Rdpwd.sys");
## Get Version from Rdpwsx.dll file for Terminal Server
rdpVer2 = fetch_file_version(sysPath, file_name:"system32\Rdpwsx.dll");
if(!rdpVer1 && !rdpVer2){
  exit(0);
}

if(rdpVer1)
{
  # Windows XP
  if(hotfix_check_sp(xp:4) > 0)
  {
    # Check for Rdpwd.sys version < 5.1.2600.6187
    if(version_is_less(version:rdpVer1, test_version:"5.1.2600.6187")){
       security_message(0);
    }
    exit(0);
  }

  # Windows 2003
  else if(hotfix_check_sp(win2003:3) > 0)
  {
    ## Check for Rdpwd.sys version before 5.2.3790.4952
    if(version_is_less(version:rdpVer1, test_version:"5.2.3790.4952")){
      security_message(0);
    }
    exit(0);
  }

  ## Windows Vista and Windows Server 2008
  else if(hotfix_check_sp(winVista:3, win2008:3) > 0)
  {
    ## Check for Rdpwd.sys version
    if(version_is_less(version:rdpVer1, test_version:"6.0.6002.18568") ||
       version_in_range(version:rdpVer1, test_version:"6.0.6002.22000", test_version2:"6.0.6002.22773")){
      security_message(0);
    }
    exit(0);
  }
}
  ## Windows 7
if(hotfix_check_sp(win7:2) > 0)
{
  if(rdpVer1)
  {
    ## Check for Rdpwd.sys and Rdpwsx.dll versions
    if(version_is_less(version:rdpVer1, test_version:"6.1.7600.16963") ||
       version_in_range(version:rdpVer1, test_version:"6.1.7600.20000", test_version2:"6.1.7600.21150")||
       version_in_range(version:rdpVer1, test_version:"6.1.7601.17000", test_version2:"6.1.7601.17778")||
       version_in_range(version:rdpVer1, test_version:"6.1.7601.21000", test_version2:"6.1.7601.21923")){
      security_message(0);
    }
  }

  if(rdpVer2)
  {
    if(version_is_less(version:rdpVer2, test_version:"6.1.7600.17009") ||
       version_in_range(version:rdpVer2, test_version:"6.1.7600.20000", test_version2:"6.1.7600.21199")||
       version_in_range(version:rdpVer2, test_version:"6.1.7601.17000", test_version2:"6.1.7601.17827")||
       version_in_range(version:rdpVer2, test_version:"6.1.7601.21000", test_version2:"6.1.7601.21979")){
      security_message(0);
    }
  }
}
