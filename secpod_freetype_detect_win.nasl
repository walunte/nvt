###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_freetype_detect_win.nasl 5877 2017-04-06 09:01:48Z teissa $
#
# FreeType Version Detection (Windows)
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{

  script_oid("1.3.6.1.4.1.25623.1.0.901144");
  script_version("$Revision: 5877 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-04-06 11:01:48 +0200 (Thu, 06 Apr 2017) $");
  script_tag(name:"creation_date", value:"2010-09-01 09:34:36 +0200 (Wed, 01 Sep 2010)");
  script_tag(name:"qod_type", value:"registry");
  script_name("FreeType Version Detection (Windows)");

tag_summary =
"Detection of installed version of FreeType.

The script logs in via smb, searches for FreeType in the registry and
gets the version from registry.";


  script_tag(name : "summary" , value : tag_summary);

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
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

osArch = "";
key_list = "";
appName = "";
appLoc = "";
ftVer = "";

osArch = get_kb_item("SMB/Windows/Arch");
if(!osArch)
{
  exit(-1);
}

if(!registry_key_exists(key:"SOFTWARE\GnuWin32\FreeType") &&
   !registry_key_exists(key:"SOFTWARE\Wow6432Node\GnuWin32\FreeType"))
{
  exit(0);
}

## if os is 32 bit iterate over comman path
if("x86" >< osArch){
  key_list = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
}

## Check for 64 bit platform
else if("x64" >< osArch){
 key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\",
                      "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\");
}

foreach key (key_list)
{
  foreach item (registry_enum_keys(key:key))
  {
    appName = registry_get_sz(key:key + item, item:"DisplayName");

    # Confirm the application
    if("FreeType" >< appName)
    {
      ftVer = registry_get_sz(key:key + item, item:"DisplayVersion");

      if(ftVer)
      {
        appLoc = registry_get_sz(key:key + item, item:"InstallLocation");
        if(!appLoc){
          appLoc = "Couldn find the install location from registry";
        }

        # Set KB for FreeType
        set_kb_item(name:"FreeType/Win/Ver", value:ftVer);

        cpe = build_cpe(value:ftVer, exp:"^([0-9.]+)", base:"cpe:/a:freetype:freetype:");
        if(isnull(cpe))
          cpe = "cpe:/a:freetype:freetype";

        ## 64 bit apps on 64 bit platform
        if("x64" >< osArch && "Wow6432Node" >!< key)
        {
          set_kb_item(name:"FreeType64/Win/Ver", value:ftVer);

          cpe = build_cpe(value:ftVer, exp:"^([0-9.]+)", base:"cpe:/a:freetype:freetype:x64:");
          if(isnull(cpe))
            cpe = "cpe:/a:freetype:freetype:x64";

        }
        ## Register Product and Build Report
        register_product(cpe:cpe, location:appLoc);
        log_message(data: build_detection_report(app: appName,
                                           version: ftVer,
                                           install: appLoc,
                                           cpe: cpe,
                                           concluded: ftVer));

      }
    }
  }
}
