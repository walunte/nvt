###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms14-033.nasl 6637 2017-07-10 09:58:13Z teissa $
#
# Microsoft Window XML Core Services Information Disclosure Vulnerability (2966061)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.804635");
  script_version("$Revision: 6637 $");
  script_cve_id("CVE-2014-1816");
  script_bugtraq_id(67895);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 11:58:13 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-06-11 08:45:39 +0530 (Wed, 11 Jun 2014)");
  script_tag(name:"solution_type", value: "VendorFix");
  script_name(" Microsoft Window XML Core Services Information Disclosure Vulnerability (2966061)");

   tag_summary =
"This host is missing an important security update according to Microsoft
Bulletin MS14-033.";

  tag_vuldetect =
"Get the vulnerable file version and check appropriate patch is applied
or not.";

  tag_insight =
"The flaw is due to an error when parsing XML entities that is triggered
when handling specially crafted XML content on a webpage.";

  tag_impact =
"Successful exploitation will allow remote attackers to disclose sensitive
information.

Impact Level: Application ";

  tag_affected =
"Microsoft Windows 2003 x32/x64 Service Pack 2 and prior
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
https://technet.microsoft.com/en-us/library/security/ms14-033";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "https://support.microsoft.com/kb/2939576");
  script_xref(name : "URL" , value : "https://support.microsoft.com/kb/2957482");
  script_xref(name : "URL" , value : "https://support.microsoft.com/kb/2966631");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/library/security/ms14-033");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
dllVer3 = "";
dllVer6 = "";

## Check for OS and Service Pack
if(hotfix_check_sp(win2003:3, win2003x64:3, winVista:3, winVistax64:3, win7:2, win7x64:2,
                   win2008:3, win2008x64:3, win2008r2:2, win8:1, win8x64:1, win2012:1,
                   win8_1:1, win8_1x64:1) <= 0)
{
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

## Get Version for XML Core Services 3.0 from Msxml3.dll file
dllVer3 = fetch_file_version(sysPath, file_name:"system32\Msxml3.dll");

if(dllVer3)
{
  ## Windows 2003
  if(hotfix_check_sp(win2003:3, win2003x64:3) > 0)
  {
    ## Check for XML Core Services 3.0
    if(version_is_less(version:dllVer3, test_version:"8.100.1055.0")){
      security_message(0);
    }
    exit(0);
  }

  ## Windows Vista and Server 2008
  else if(hotfix_check_sp(winVista:3, win2008:3) > 0)
  {
    ## Check for XML Core Services 3.0 from Msxml3.dll file
    if(version_is_less(version:dllVer3, test_version:"8.100.5008.0")){
      security_message(0);
    }
    exit(0);
  }

  ## Windows 7 and Server 2008r2
  else if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
  {
    ## Check for XML Core Services 3.0 from Msxml3.dll file
    if(version_in_range(version:dllVer3, test_version:"8.110.7601.18000", test_version2:"8.110.7601.18430") ||
       version_in_range(version:dllVer3, test_version:"8.110.7601.22000", test_version2:"8.110.7601.22639")){
      security_message(0);
    }
    exit(0);
  }

  ## Windows 8-64bit and Windows Server 2012
  else if(hotfix_check_sp(win8x64:1, win2012:1) > 0)
  {
    ## Check for XML Core Services 3.0 from Msxml3.dll file
    if(version_in_range(version:dllVer3, test_version:"8.110.9200.16000", test_version2:"8.110.9200.16862") ||
       version_in_range(version:dllVer3, test_version:"8.110.9200.20000", test_version2:"8.110.9200.20981")){
      security_message(0);
    }
    exit(0);
  }

  ##Windows 8.1 and Windows Server 2012 R2
  ## Currently not supporting for Windows Server 2012 R2
  else if(hotfix_check_sp(win8_1:1, win8_1x64:1) > 0)
  {
    ## Check for XML Core Services 3.0 from Msxml3.dll file
    if(version_in_range(version:dllVer3, test_version:"8.110.9200.16800", test_version2:"8.110.9200.16862") ||
       version_in_range(version:dllVer3, test_version:"8.110.9200.20000", test_version2:"8.110.9200.20981") ||
       version_in_range(version:dllVer3, test_version:"8.110.9600.16000", test_version2:"8.110.9600.16662")){
      security_message(0);
    }
    exit(0);
  }
}

## Get Version for XML Core 3.0 from Msxml3r.dll file
dllVer4 = fetch_file_version(sysPath, file_name:"system32\Msxml3r.dll");

if(dllVer4)
{
  if(hotfix_check_sp(win8:1) > 0)
  {
    dllVer4 = fetch_file_version(sysPath, file_name:"system32\Msxml3r.dll");

    ## Check for XML Core Services 3.0 from Msxml3r.dll file
    if(version_is_less(version:dllVer4, test_version:"8.110.9600.16384")){
      security_message(0);
    }
    exit(0);
  }
}


## Get Version for XML Core Services 6.0 from Msxml6.dll file
dllVer6 = fetch_file_version(sysPath, file_name:"system32\Msxml6.dll");

if(dllVer6)
{
  ## Windows Vista and Server 2008
  if(hotfix_check_sp(winVista:3, win2008:3) > 0)
  {
    ## Check for XML Core Services 6.0 from Msxml6.dll file
    if(version_is_less(version:dllVer6, test_version:"6.20.5007.0")){
      security_message(0);
    }
    exit(0);
  }

  ## Windows 7 and Server 2008r2
  else if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
  {
    ## Check for XML Core Services 6.0 from Msxml6.dll file
    if(version_is_less(version:dllVer6, test_version:"6.30.7601.18431") ||
      version_in_range(version:dllVer6, test_version:"6.30.7601.22000", test_version2:"6.30.7601.22639")){
      security_message(0);
    }
    exit(0);
  }

  ## Windows 2003
  else if(hotfix_check_sp(win2003:3, win2003x64:3) > 0)
  {
    ## Check for XML Core Services 6.0
    if(version_is_less(version:dllVer6, test_version:"6.20.2017.0")){
      security_message(0);
    }
    exit(0);
  }
}
