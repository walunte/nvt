###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms12-004.nasl 5341 2017-02-18 16:59:12Z cfi $
#
# Microsoft Windows Media Could Allow Remote Code Execution Vulnerabilities (2636391)
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
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

tag_impact = "Successful exploitation will allow the attacker to execute arbitrary code in
  the context of the user running the application which can compromise the
  application and possibly the computer.
  Impact Level: System/Application";
tag_affected = "Micorsoft Windows 7 Service Pack 1 and prior.
  Microsoft Windows XP Service Pack 3 and prior.
  Microsoft Windows 2003 Service Pack 2 and prior.
  Microsoft Windows Vista Service Pack 2 and prior.
  Microsoft Windows Server 2008 Service Pack 2 and prior.
  Microsoft Windows Media Center TV Pack for Windows Vista.";
tag_insight = "- An unspecified error in the Windows multimedia library (winmm.dll) when
    parsing MIDI files can be exploited via a specially crafted file opened
    in Windows Media Player.
  - An unspecified error exists in the Line21 DirectShow filter (Quartz.dll
    and Qdvd.dll) when parsing specially crafted media files.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://technet.microsoft.com/en-us/security/bulletin/ms12-004";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS12-004.";

if(description)
{
  script_id(902807);
  script_version("$Revision: 5341 $");
  script_bugtraq_id(51292, 51295);
  script_cve_id("CVE-2012-0003", "CVE-2012-0004");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-02-18 17:59:12 +0100 (Sat, 18 Feb 2017) $");
  script_tag(name:"creation_date", value:"2012-01-11 10:10:10 +0530 (Wed, 11 Jan 2012)");
  script_name("Microsoft Windows Media Could Allow Remote Code Execution Vulnerabilities (2636391)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/47485");
  script_xref(name : "URL" , value : "http://securitytracker.com/id/1026492");
  script_xref(name : "URL" , value : "http://www.securelist.com/en/advisories/47485");
  script_xref(name : "URL" , value : "http://technet.microsoft.com/en-us/security/bulletin/ms12-004");

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

## Check for OS and Service Pack
if(hotfix_check_sp(xp:4, win2003:3, winVista:3, win2008:3, win7:2) <= 0){
  exit(0);
}

## MS12-004 Hotfix
if(hotfix_missing(name:"2598479") == 0 && hotfix_missing(name:"2631813") == 0){
  exit(0);
}

winName = get_kb_item("SMB/WindowsName");
if("Windows Vista" >< winName)
{
  ## Confirm Windows Media Center TV Pack installed by checking version 5.1
  ## http://msdn.microsoft.com/en-us/library/ms815274.aspx
  mediaTVPackVer = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\Current" +
                                       "Version\Media Center", item:"Ident");
  if(hotfix_missing(name:"2628642") == 0){
     exit(0);
  }
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath){
  exit(0);
}

## Get Version from Mciseq.dll file
mciseqVer = fetch_file_version(sysPath, file_name:"system32\Mciseq.dll");
quartzVer = fetch_file_version(sysPath, file_name:"system32\Quartz.dll");

## Windows XP
if(hotfix_check_sp(xp:4) > 0)
{
  SP = get_kb_item("SMB/WinXP/ServicePack");
  if("Service Pack 3" >< SP)
  {
    ## Check for Mciseq.dll and Quartz.dll versions
    if((mciseqVer && version_is_less(version:mciseqVer, test_version:"5.1.2600.6160"))||
       (quartzVer && version_is_less(version:quartzVer, test_version:"6.5.2600.6169"))){
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
    ## Check for Mciseq.dll and Quartz.dll versions
    if((mciseqVer && version_is_less(version:mciseqVer, test_version:"5.2.3790.4916"))||
       (quartzVer && version_is_less(version:quartzVer, test_version:"6.5.3790.4928"))){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

## Windows Vista and Windows Server 2008
else if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  SP = get_kb_item("SMB/WinVista/ServicePack");

  if(!SP) {
    SP = get_kb_item("SMB/Win2008/ServicePack");
  }

  if(mediaTVPackVer && ("5.1" >< mediaTVPackVer))
  {
    ## Get Version from Mstvcapn.dll file
    mstvVer = fetch_file_version(sysPath, file_name:"ehome\Mstvcapn.dll");
    if(mstvVer && version_is_less(version:mstvVer, test_version:"6.1.1000.18311"))
    {
      security_message(0);
      exit(0);
    }
  }

  if("Service Pack 2" >< SP)
  {
    ## Check for Mciseq.dll and Quartz.dll versions
    if((mciseqVer && (version_in_range(version:mciseqVer, test_version:"6.0.6002.18000", test_version2:"6.0.6002.18527")||
        version_in_range(version:mciseqVer, test_version:"6.0.6002.22000", test_version2:"6.0.6002.22725"))) ||
       (quartzVer && (version_in_range(version:quartzVer, test_version:"6.0.6002.18000", test_version2:"6.6.6002.18532")||
        version_in_range(version:quartzVer, test_version:"6.6.6002.22000", test_version2:"6.6.6002.22731")))){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

## Windows 7
else if(hotfix_check_sp(win7:2) > 0)
{
  ## Check for Quartz.dll version
  if(quartzVer &&
    (version_is_less(version:quartzVer, test_version:"6.6.7600.16905")||
     version_in_range(version:quartzVer, test_version:"6.6.7600.21000", test_version2:"6.6.7600.21076")||
     version_in_range(version:quartzVer, test_version:"6.6.7601.17000", test_version2:"6.6.7601.17712")||
     version_in_range(version:quartzVer, test_version:"6.6.7601.21000", test_version2:"6.6.7601.21846"))){
    security_message(0);
  }
}
