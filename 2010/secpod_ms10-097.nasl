###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms10-097.nasl 5361 2017-02-20 11:57:13Z cfi $
#
# MS Windows ICSW Remote Code Execution Vulnerability (2443105)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploition allows attackers to execute arbitrary code by tricking
  a user into opening a file from a network share.
  Impact Level: System/Application";
tag_affected = "Microsoft Windows XP Service Pack 3 and prior.
  Microsoft Windows Server 2003 Service Pack 2 and prior.";
tag_insight = "The issue is caused by an error in the Internet Connection Signup Wizard
  when loading librairies from the current working directory.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/Bulletin/MS10-097.mspx";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS10-097.";

if(description)
{
  script_id(902278);
  script_version("$Revision: 5361 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-20 12:57:13 +0100 (Mon, 20 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-12-15 14:53:45 +0100 (Wed, 15 Dec 2010)");
  script_cve_id("CVE-2010-3144");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("MS Windows ICSW Remote Code Execution Vulnerability (2443105)");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2443105");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/MS10-097.mspx");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
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

## Check for OS and Service Pack
if(hotfix_check_sp(xp:4, win2003:3)<= 0){
  exit(0);
}

## MS10-097 Hotfix (2443105)
if(hotfix_missing(name:"2443105") == 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

dllPath = sysPath + "\system32\Isign32.dll";
share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:dllPath);
file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1", string:dllPath);

## Get Version from Schannel.dll file
sysVer = GetVer(file:file, share:share);
if(!sysVer){
  exit(0);
}

## Windows XP
if(hotfix_check_sp(xp:4) > 0)
{
  SP = get_kb_item("SMB/WinXP/ServicePack");
  if("Service Pack 3" >< SP)
  {
    ## Grep for Win32k.sys version < 6.0.2900.6052
    if(version_is_less(version:sysVer, test_version:"6.0.2900.6052")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

## Windows 2003
else if(hotfix_check_sp(win2003:3) > 0)
{
  SP = get_kb_item("SMB/Win2003/ServicePack");
  if("Service Pack 2" >< SP)
  {
    ## Grep for Win32k.sys version < 6.0.3790.4799
    if(version_is_less(version:sysVer, test_version:"6.0.3790.4799")){
       security_message(0);
    }
    exit(0);
  }
 security_message(0);
}
