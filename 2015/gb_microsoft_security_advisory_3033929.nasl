###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_microsoft_security_advisory_3033929.nasl 6513 2017-07-04 09:59:28Z teissa $
#
# MS Windows SHA-2 Code Signing Support Vulnerability (3033929)
#
# Authors:
# Deependra Bapna <bdeepedra@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.805354");
  script_version("$Revision: 6513 $");
  script_cve_id("CVE-2015-0073", "CVE-2015-0075");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-04 11:59:28 +0200 (Tue, 04 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-03-20 17:53:39 +0530 (Fri, 20 Mar 2015)");
  script_name("MS Windows SHA-2 Code Signing Support Vulnerability (3033929)");

  script_tag(name: "summary" , value:"This host is missing an important security
  update according to Microsoft Advisory 3033929.");

  script_tag(name: "vuldetect" , value: "Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name: "insight" , value: "The flaw is due to an error within the
  WebDAV kernel-mode driver (Winload.exe).");

  script_tag(name: "impact" , value: "Successful exploitation will allow remote
  attackers to bypass security and gain restricted privileges

  Impact Level: System");

  script_tag(name: "affected" , value:"
  Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior");

  script_tag(name: "solution" , value: "Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/3033929");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/kb/294871");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/3033929");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
dllVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(win7:2, win7x64:2,win2008r2:2) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}


## Elevation of Privilege KB294871
dllVer = fetch_file_version(sysPath, file_name:"system32\Winload.exe");
if(!dllVer){
  exit(0);
}

## Windows 7 and Windows Server 2008 R2
if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  ## Check for Winload.exe version
  if(version_is_less(version:dllVer, test_version:"6.1.7601.18649") ||
     version_in_range(version:dllVer, test_version:"6.1.7601.22000", test_version2:"6.1.7601.22853")){
    security_message(0);
  }
  exit(0);
}
