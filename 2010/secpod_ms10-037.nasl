###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms10-037.nasl 5934 2017-04-11 12:28:28Z antu123 $
#
# Microsoft Windows OpenType Compact Font Format Driver Privilege Escalation Vulnerability (980218)
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Updated By: Madhuri D <dmadhuri@secpod.com> on 2010-11-15
#  - To detect file version 'atmfd.dll' on vista, win 2008 and win 7 os
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

if(description)
{
  script_id(901119);
  script_version("$Revision: 5934 $");
  script_tag(name:"last_modification", value:"$Date: 2017-04-11 14:28:28 +0200 (Tue, 11 Apr 2017) $");
  script_tag(name:"creation_date", value:"2010-06-09 17:19:57 +0200 (Wed, 09 Jun 2010)");
  script_bugtraq_id(40572);
  script_cve_id("CVE-2010-0819");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Microsoft Windows OpenType Compact Font Format Driver Privilege Escalation Vulnerability (980218)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/38176/");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/ms10-037.mspx");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : "Successful exploitation could allow local users to gain elevated privileges.
  Impact Level: System");
  script_tag(name : "affected" , value : "Micorsoft Windows 7
  Microsoft Windows 2000 Service Pack 4 and prior.
  Microsoft Windows XP Service Pack 3 and prior.
  Microsoft Windows 2003 Service Pack 2 and prior.
  Microsoft Windows Vista Service Pack 1/2 and prior.
  Microsoft Windows Server 2008 Service Pack 1/2 and prior.");
  script_tag(name : "insight" , value : "The flaw is due to improper validation of data processed by Windows OpenType
  Compact Font Format (CFF) driver, which could allow elevation of privilege
  if user views content rendered in a specially crafted CFF font.");
  script_tag(name : "solution" , value : "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/Bulletin/MS10-037.mspx");
  script_tag(name : "summary" , value : "This host is missing an important security update according to
  Microsoft Bulletin MS10-037.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Check For OS and Service Packs
if(hotfix_check_sp(win2k:5, xp:4, win2003:3, winVista:3, win7:1, win2008:3) <= 0){
  exit(0);
}

## Check for MS10-037 Hotfix
if(hotfix_missing(name:"980218") == 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_system32root();
if(sysPath)
{
  dllVer = fetch_file_version(sysPath, file_name:"atmfd.dll");
  if(!dllVer){
    exit(0);
  }
}

## Windows 2K
if(hotfix_check_sp(win2k:5) > 0)
{
  ##Grep for atmfd.dll version < 5.0.2.227
  if(version_is_less(version:dllVer, test_version:"5.0.2.227")){
    security_message(0);
  }
}

## Windows XP
else if(hotfix_check_sp(xp:4) > 0)
{
  SP = get_kb_item("SMB/WinXP/ServicePack");
  if(("Service Pack 2" >< SP) || ("Service Pack 3" >< SP))
  {
    ##Grep for atmfd.dll version < 5.1.2.228
    if(version_is_less(version:dllVer, test_version:"5.1.2.228")){
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
    ##Grep for atmfd.dll version < 5.2.2.228
    if(version_is_less(version:dllVer, test_version:"5.2.2.228")){
      security_message(0);
    }
     exit(0);
  }
  security_message(0);
}

## Get System32 path
sysPath = smb_get_system32root();
if(sysPath)
{
  dllVer = fetch_file_version(sysPath, file_name:"atmfd.dll");
  if(!dllVer){
    exit(0);
  }
}

# Windows 7, Vista and 2008 server 
if(hotfix_check_sp(winVista:3, win7:1, win2008:3) > 0)
{
  # Grep for atmfd.dll version < 5.1.2.228
  if(version_is_less(version:dllVer, test_version:"5.1.2.228"))
  {
    security_message(0);
    exit(0);
  }
}

