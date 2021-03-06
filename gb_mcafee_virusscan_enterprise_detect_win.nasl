###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mcafee_virusscan_enterprise_detect_win.nasl 7052 2017-09-04 11:50:51Z teissa $
#
# McAfee VirusScan Enterprise Version Detection (Windows)
#
# Authors:
# Arun Kallavi <karun@secpod.com>
#
# Updated By: Thanga Prakash S <tprakash@secpod.com> on 2014-06-24
# Updated plugin completely according to CR57 and to support 32 and 64 bit
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.803319");
  script_version("$Revision: 7052 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-09-04 13:50:51 +0200 (Mon, 04 Sep 2017) $");
  script_tag(name:"creation_date", value:"2013-03-04 09:45:42 +0530 (Mon, 04 Mar 2013)");
  script_tag(name:"qod_type", value:"registry");
  script_name("McAfee VirusScan Enterprise Version Detection (Windows)");

  tag_summary =
"Detection of installed version of McAfee VirusScan Enterprise.

The script detects the version of McAfee VirusScan Enterprise and sets the
version in KB.";


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
include("version_func.inc");

## Variable Initialization
appName = "";
appPath = "";
appVer = "";
key = "";
cpe = "";

## Confirm Application
key = "SOFTWARE\McAfee\DesktopProtection";
if(!registry_key_exists(key:key))
{
  key = "SOFTWARE\Wow6432Node\McAfee\DesktopProtection";
  if(!registry_key_exists(key:key)){
    exit(0);
  }
}

## Get Product Name
appName = registry_get_sz(key:key, item:"Product");

if("McAfee VirusScan Enterprise" >< appName)
{
  ##Get version
  appVer = registry_get_sz(key:key, item:"szProductVer");

  if(appVer)
  {
    ## Get Install Path
    appPath =registry_get_sz(key:key, item:"szInstallDir");

    if(appPath)
    {
      appPath += "Readme.txt";
      share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:appPath);
      file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1", string:appPath);
      txtRead = read_file(share:share, file:file, offset:0, count:500000);

      ## Get Version
      fileVer = eregmatch(pattern:"Version ([0-9.]+[a-z])", string:txtRead);
      verRegex = "^([0-9.]+)";

      if(fileVer[1])
      {
        appVer = fileVer[1];
        verRegex = "^([0-9.]+[a-z])";
      }

      set_kb_item(name:"McAfee/VirusScan/Win/Ver", value:appVer);

      ## Build cpe
      cpe = build_cpe(value:appVer, exp:verRegex, base:"cpe:/a:mcafee:virusscan_enterprise:");
      if(isnull(cpe))
        cpe = 'cpe:/a:mcafee:virusscan_enterprise';

      build_report(app:appName, ver:appVer, cpe:cpe, insloc:appPath, concluded:appVer);
    }
  }
}
