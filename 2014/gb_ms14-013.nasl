###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms14-013.nasl 6715 2017-07-13 09:57:40Z teissa $
#
# Microsoft DirectShow Remote Code Execution Vulnerability (2929961)
#
# Authors:
# Veerendra GG <veerendragg@secpod.com>
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
  script_id(802068);
  script_version("$Revision: 6715 $");
  script_cve_id("CVE-2014-0301");
  script_bugtraq_id(66045);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-13 11:57:40 +0200 (Thu, 13 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-03-12 08:12:10 +0530 (Wed, 12 Mar 2014)");
  script_tag(name:"solution_type", value: "VendorFix");
  script_name("Microsoft DirectShow Remote Code Execution Vulnerability (2929961)");

  tag_summary =
"This host is missing a critical security update according to Microsoft
Bulletin MS14-013.";

  tag_vuldetect =
"Get the vulnerable file version and check appropriate patch is applied
or not.";

  tag_insight =
"Flaw is due to an error within DirectShow when parsing JPEG image files.";

  tag_impact =
"Successful exploitation will allow attackers to execute arbitrary code and
cause memory corruption in the context of the current user.

Impact Level: System/Application";

  tag_affected =
"Microsoft Windows XP Service Pack 3 and prior
Microsoft Windows XP x64 Service Pack 2 and prior
Microsoft Windows 2003 x32 Pack 3 and prior
Microsoft Windows 2003 x64 Service Pack 2 and prior
Microsoft Windows Vista x32/x64 Service Pack 2 and prior
Microsoft Windows Server 2008 x32/x64 Service Pack 2 and prior
Microsoft Windows 7 x32/x64 Service Pack 1 and prior
Microsoft Windows Server 2008 R2 x64 Service Pack 1 and prior
Microsoft Windows 8 x32/x64
Microsoft Windows 8.1 x32/x64
Microsoft Windows Server 2012
Microsoft Windows Server 2012 R2";

  tag_solution =
"Run Windows Update and update the listed hotfixes or download and
update mentioned hotfixes in the advisory from the below link,
https://technet.microsoft.com/en-us/security/bulletin/ms14-013";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/57325");
  script_xref(name : "URL" , value : "https://support.microsoft.com/kb/2929961");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/security/bulletin/ms14-013");
  script_category(ACT_GATHER_INFO);
  script_family("Windows : Microsoft Bulletins");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
sysVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(xp:4, xpx64:3, win2003:3, win2003x64:3, winVista:3, winVistax64:3,
                   win7:2, win7x64:2, win2008:3, win2008x64:3, win2008r2:2,
                   win8:1, win8x64:1, win2012:1, win8_1:1, win8_1x64:1) <= 0)
{
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath){
  exit(0);
}

## Get Version from Qedit.dll file
sysVer = fetch_file_version(sysPath, file_name:"\system32\qedit.dll");
if(!sysVer){
  exit(0);
}

## Windows XP
if(hotfix_check_sp(xp:4) > 0)
{
  ## Check for Qedit.dll version before 6.5.2600.6512
  if(version_is_less(version:sysVer, test_version:"6.5.2600.6512")){
    security_message(0);
  }
  exit(0);
}

## Windows 2003 x86, Windows XP x64 and Windows 2003 x64
else if(hotfix_check_sp(win2003:3, xpx64:3, win2003x64:3) > 0)
{
  ## Check for Qedit.dll version before 6.5.3790.5294
  if(version_is_less(version:sysVer, test_version:"6.5.3790.5294")){
    security_message(0);
  }
  exit(0);
}

## Windows Vista and Windows Server 2008
## Currently not supporting for Vista and Windows Server 2008 64 bit
else if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  ## Check for Qedit.dll version
  if(version_is_less(version:sysVer, test_version:"6.6.6002.19033") ||
     version_in_range(version:sysVer, test_version:"6.6.6002.23000", test_version2:"6.6.6002.23320")){
    security_message(0);
  }
  exit(0);
}

## Windows 7 and Windows 2008 R2
else if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  ## Check for Qedit.dll version
  if(version_is_less(version:sysVer, test_version:"6.6.7601.18386") ||
     version_in_range(version:sysVer, test_version:"6.6.7601.22000", test_version2:"6.6.7601.22589")){
    security_message(0);
  }
  exit(0);
}

## Win 8 and 2012
else if(hotfix_check_sp(win8:1, win8x64:1, win2012:1) > 0)
{
 ## Check for Qedit.dll version
  if(version_is_less(version:sysVer, test_version:"6.6.9200.16812") ||
     version_in_range(version:sysVer, test_version:"6.6.9200.20000", test_version2:"6.6.9200.20930")){
    security_message(0);
  }
  exit(0);
}

## Win 8.1
## Currently not supporting for Windows Server 2012 R2
else if(hotfix_check_sp(win8_1:1, win8_1x64:1) > 0)
{
 ## Check for Qedit.dll version
  if(version_is_less(version:sysVer, test_version:"6.6.9600.16650")){
    security_message(0);
  }
  exit(0);
}
