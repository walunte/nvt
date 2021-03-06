###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_frontpage_detect.nasl 7006 2017-08-25 11:51:20Z teissa $
#
# Microsoft FrontPage Detection (Windows)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Updated By: Shakeel <bshakeel@secpod.com> on 2014-06-24
# According to CR57 and to support 32 and 64 bit.
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.803891");
  script_version("$Revision: 7006 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-08-25 13:51:20 +0200 (Fri, 25 Aug 2017) $");
  script_tag(name:"creation_date", value:"2013-09-11 11:32:12 +0530 (Wed, 11 Sep 2013)");
  script_tag(name:"qod_type", value:"registry");
  script_name("Microsoft FrontPage Detection (Windows)");

  tag_summary =
"Detection of installed version of Microsoft FrontPage.

The script logs in via smb, searches for Microsoft Office FrontPage and gets
the version from 'DisplayVersion' string in registry";


  script_tag(name : "summary" , value : tag_summary);

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("secpod_reg_enum.nasl", "smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("secpod_smb_func.inc");
include("cpe.inc");
include("host_details.inc");

## Variable Initialization
os_arch = "";
key_list = "";
key = "";
insloc= "";
pageVer= "";
pageName = "";

## Get OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(-1);
}

## Check for 32 bit platform
if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\Microsoft\Office");
  key_list2 = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\");
}

## Check for 64 bit platform, Currently only 32-bit application is available
else if("x64" >< os_arch)
{
  key_list =  make_list("SOFTWARE\Wow6432Node\Microsoft\Office");
  key_list2 = make_list("SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\");
}

if(isnull(key_list && key_list2)){
  exit(0);
}


## Confirm Application
if(!registry_key_exists(key:"SOFTWARE\Microsoft\Office")){
  if(!registry_key_exists(key:"SOFTWARE\Wow6432Node\Microsoft\Office")){
    exit(0);
  }
}

foreach key (key_list)
{
  foreach item (registry_enum_keys(key:key))
  {
    if(eregmatch(pattern:"^([0-9.]+)" , string:item))
    {
      rootkey = key + "\" + item + "\FrontPage";
      if(!registry_key_exists(key: rootkey)){
        exit(0);
      }
      break;
    }
  }
}

foreach key (key_list2)
{
  foreach item (registry_enum_keys(key:key))
  {
    pageName = registry_get_sz(key:key + item, item:"DisplayName");
    if("Microsoft Office FrontPage" >< pageName)
    {

      ## Get the Installed Path
      insloc = registry_get_sz(key:key + item, item:"InstallLocation");
      if(!insloc)
      {
        insloc = registry_get_sz(key: rootkey + "\InstallRoot", item:"Path");
        if(!insloc){
          insloc = "Unable to find the install location";
        }
      }

      ## Get Version
      pageVer = registry_get_sz(key:key + item, item:"DisplayVersion");

      set_kb_item(name:"Microsoft/FrontPage/Ver", value:pageVer);

      ## build cpe and store it as host_detail
      cpe = build_cpe(value:pageVer, exp:"^([0-9.]+)", base:"cpe:/a:microsoft:frontpage:");
      if(isnull(cpe))
        cpe = "cpe:/a:microsoft:frontpage";

      ## Register Product and Build Report
      build_report(app: pageName, ver:pageVer , cpe:cpe, insloc:insloc);
    }
  }
}
