###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_dotnet_framework_kb4040980.nasl 7260 2017-09-26 06:48:48Z asteins $
#
# Microsoft .NET Framework Remote Code Execution Vulnerability (KB4040980)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.811322");
  script_version("$Revision: 7260 $");
  script_cve_id("CVE-2017-8759");
  script_bugtraq_id(100742);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-09-26 08:48:48 +0200 (Tue, 26 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-09-13 14:11:50 +0530 (Wed, 13 Sep 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft .NET Framework Remote Code Execution Vulnerability (KB4040980)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4040980");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"A remote code execution vulnerability exists
  when Microsoft .NET Framework processes untrusted input. An attacker who
  successfully exploited this vulnerability in software using the .NET framework
  could take control of an affected system."); 

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute code.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft .NET Framework 3.5.1");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4040980");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/4040980");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
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
dotpath = "";
dllVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp( win7:2, win7x64:2, win2008r2:2 ) <= 0){
  exit(0);
}

## Confirm .NET
key = "SOFTWARE\Microsoft\ASP.NET\";
if(!registry_key_exists(key:key)){
  exit(0);
}

## Try to Get Version
foreach item (registry_enum_keys(key:key))
{
  dotpath = registry_get_sz(key:key + item, item:"Path");
  if(dotpath && "\Microsoft.NET\Framework" >< dotpath)
  {
    ## Get version from System.dll file
    dllVer = fetch_file_version(sysPath:dotpath, file_name:"System.dll");
    if(dllVer)
    {
      ##.NET Framework 3.5.1 for Windows Server 2012: September 12, 2017
      if(version_in_range(version:dllVer, test_version:"2.0.50727.8000", test_version2:"2.0.50727.8769"))
      {
        report = 'File checked:     ' + dotpath + "\system.dll" + '\n' +
                 'File version:     ' + dllVer  + '\n' +
                 'Vulnerable range: 2.0.50727.8000 - 2.0.50727.8769' + '\n' ;
        security_message(data:report);
        exit(0);
      }
    }
  }
}  
