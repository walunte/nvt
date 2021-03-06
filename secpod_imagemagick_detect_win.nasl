###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_imagemagick_detect_win.nasl 5871 2017-04-05 13:33:48Z antu123 $
#
# ImageMagick Version Detection (Windows)
#
# Authors:
# Nikita MR <rnikita@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.900562");
  script_version("$Revision: 5871 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-04-05 15:33:48 +0200 (Wed, 05 Apr 2017) $");
  script_tag(name:"creation_date", value:"2009-06-02 08:16:42 +0200 (Tue, 02 Jun 2009)");
  script_name("ImageMagick Version Detection (Windows)");

  script_tag(name: "summary" , value: "Detection of installed version of
  ImageMagick.

  The script logs in via smb, searches for ImageMagick in the registry
  and gets the version from 'DisplayName' string from registry.");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Product detection");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("secpod_smb_func.inc");
include("cpe.inc");
include("host_details.inc");

## variable Initialization
os_arch = "";
key_list = "";
key = "";
k7usecPath = "";
k7usecVer = "";
k7usecName = "";

## Get OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(-1);
}

if(!registry_key_exists(key:"SOFTWARE\ImageMagick") &&
   !registry_key_exists(key:"SOFTWARE\Wow6432Node\ImageMagick")){
  exit(0);
}

## Check for 32 bit platform
if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\");
}

## Check for 64 bit platform
else if("x64" >< os_arch){
  key_list =  make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\",
                        "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\");
}

if(isnull(key_list)){
  exit(0);
}

foreach key (key_list)
{
  foreach item (registry_enum_keys(key:key))
  {
    imName = registry_get_sz(key:key + item, item:"DisplayName");
    if("ImageMagick" >< imName)
    {
      imVer = eregmatch(pattern:"ImageMagick ([0-9.]+\-?[0-9]?)", string:imName);
      if(imVer[1] != NULL)
      {
        imVer[1] = ereg_replace(pattern:"-", string:imVer[1], replace: ".");
        imPath = registry_get_sz(key:key + item, item:"InstallLocation");
        if(!imPath){
          imPath = "Unable to find the install location from registry";
        }

        set_kb_item(name:"ImageMagick/Win/Ver", value:imVer[1]);
     
        ## build cpe and store it as host_detail
        cpe = build_cpe(value:imVer[1], exp:"^([0-9.]+)", base:"cpe:/a:imagemagick:imagemagick:");
        if(isnull(cpe))
          cpe = "cpe:/a:imagemagick:imagemagick";

        ## Register for 64 bit app on 64 bit OS once again
        if("64" >< os_arch && "Wow6432Node" >!< key)
        {
          set_kb_item(name:"ImageMagick64/Win/Ver", value:imVer[1]);
          cpe = build_cpe(value:imVer[1], exp:"^([0-9.]+)", base:"cpe:/a:imagemagick:imagemagick:x64:");

          if(isnull(cpe))
            cpe = "cpe:/a:imagemagick:imagemagick:x64";
        }

        ## Register Product and Build Report
        build_report(app:"ImageMagick", ver:imVer[1], cpe:cpe, insloc:imPath);
      }
    }
  }
}
