###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-092.nasl 5580 2017-03-15 10:00:34Z teissa $
#
# Microsoft Windows Multiple Vulnerabilities (3171910)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808249") ;
  script_version("$Revision: 5580 $");
  script_cve_id("CVE-2016-3258", "CVE-2016-3272");
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-03-15 11:00:34 +0100 (Wed, 15 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-07-13 09:33:37 +0530 (Wed, 13 Jul 2016)");
  script_name("Microsoft Windows Multiple Vulnerabilities (3171910)");
  
  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-092");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The multiple flaws are due to,
  - The kernel in Microsoft Windows mishandles page-fault system calls.
  - The race condition in the kernel in Microsoft Windows.");

  script_tag(name:"impact", value:"Successful exploitation will allow local
  attackers to bypass the low integrity protection mechanism and write to 
  files by leveraging unspecified object-manager features and also to obtain 
  sensitive information from an arbitrary process via a crafted application.

  Impact Level: System");

  script_tag(name:"affected", value:"
  Microsoft Windows 8.1 x32/x64 Edition
  Microsoft Windows Server 2012/2012R2
  Microsoft Windows 10 x32/x64
  Microsoft Windows 10 Version 1511 x32/x64");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS16-092");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3171910");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/library/security/MS16-092");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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
sysVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(win2012:1, win2012R2:1, win8_1:1, win8_1x64:1, win10:1, win10x64:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

##Fetch the version of Ntoskrnl.exe
sysVer = fetch_file_version(sysPath, file_name:"System32\Ntoskrnl.exe");
if(!sysVer){
  exit(0);
}

if (sysVer =~ "^(6\.2\.9200\.2)"){
  Vulnerable_range = "Less than - 6.2.9200.21896";
}
else if (sysVer =~ "^(6\.3\.9600\.1)"){
  Vulnerable_range = "Less than 6.3.9600.18378";
}


## Server 2012
if(hotfix_check_sp(win2012:1) > 0)
{
  ## Check for Ntoskrnl.exe version
  if(version_is_less(version:sysVer, test_version:"6.2.9200.21896")){
     VULN = TRUE ;
  }
}

## Windows 8.1 and Server 2012 R2
else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  ## Check for Ntoskrnl.exe version
  if(version_is_less(version:sysVer, test_version:"6.3.9600.18378")){
    VULN = TRUE ;
  }
}

##Windows 10
if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  ## Windows 10 Core
  ## Check for Ntoskrnl.exe version
  if(version_is_less(version:sysVer, test_version:"10.0.10240.17022"))
  {
    Vulnerable_range = "Less than 10.0.10240.17022";
    VULN = TRUE ;
  }
  ## Windows 10 version 1511
  ## Check for Ntoskrnl.exe version
  else if(version_in_range(version:sysVer, test_version:"10.0.10586.0", test_version2:"10.0.10586.493"))
  {
    Vulnerable_range = "10.0.10586.0 - 10.0.10586.493";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\system32\Ntoskrnl.exe" + '\n' +
           'File version:     ' + sysVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
