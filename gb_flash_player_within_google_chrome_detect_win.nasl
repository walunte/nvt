###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_flash_player_within_google_chrome_detect_win.nasl 7287 2017-09-27 06:56:51Z cfischer $
#
# Adobe Flash Player Within Google Chrome Detection (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.810612");
  script_version("$Revision: 7287 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-09-27 08:56:51 +0200 (Wed, 27 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-03-13 12:06:29 +0530 (Mon, 13 Mar 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Adobe Flash Player Within Google Chrome Detection (Windows)");

  script_tag(name : "summary" , value : "Detection of installed version of Adobe
  Flash within google chrome.

  The script logs in via smb, searches for file 'pepflashplayer.dll' and gets
  version from the file.");

  script_category(ACT_GATHER_INFO);
  script_xref(name: "URL" , value: "https://helpx.adobe.com/flash-player/kb/flash-player-google-chrome.html");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("gb_google_chrome_detect_win.nasl");
  script_mandatory_keys("GoogleChrome/Win/Ver");
  script_require_ports(139, 445);
  exit(0);
}

include("smb_nt.inc");
include("cpe.inc");
include("host_details.inc");

## Variable Initialization
host = "";
query = "";
usrname = "";
passwd = "";
ver = 0;
handle= "";
fileVer = "";
checkduplicate = "";
checkduplicate_path = "";
flashVer ="";
insPath = "";
version = "";

## Get host
host    = get_host_ip();

usrname = get_kb_item("SMB/login");
passwd  = get_kb_item("SMB/password");
domain  = get_kb_item("SMB/domain");
if( domain ) usrname = domain + '\\' + usrname;

if(!host || !usrname || !passwd){
  exit(0);
}

## Get the handle to execute wmi query
handle = wmi_connect(host:host, username:usrname, password:passwd);
if(!handle){
  exit(0);
}

## WMI query to grep the file version
query = 'Select Version from CIM_DataFile Where FileName ='
        + raw_string(0x22) +'pepflashplayer' +raw_string(0x22) + ' AND Extension ='
        + raw_string(0x22) +'dll' + raw_string(0x22);

fileVer = wmi_query(wmi_handle:handle, query:query);
if(fileVer) {
  fileVer = tolower(fileVer);
} else {
  exit(0);
}

foreach ver (split(fileVer))
{
  if(ver =~ "google.chrome")
  {
    version = eregmatch(pattern:"(.*)pepflashplayer.dll.?([0-9.]+)", string:ver);
    if(version[1] && version[2])
    {
      flashVer = version[2];
      insPath = version[1];

      ## Check if version is already set
      if (flashVer + ", " >< checkduplicate && insPath + ", " >< checkduplicate_path){
        continue;
      }
      ##Assign detected version value to checkduplicate so as to check in next loop iteration
      checkduplicate  += flashVer + ", ";
      checkduplicate_path += insPath + ", ";

      set_kb_item(name:"AdobeFlashPlayer/Chrome/Win/Ver", value:flashVer);

      ## Build CPE
      cpe = build_cpe(value:flashVer, exp:"^([0-9.]+)", base:"cpe:/a:adobe:flash_player_chrome:");
      if(isnull(cpe))
        cpe = "cpe:/a:adobe:flash_player_chrome";

      ## Register Product and Build Report
      register_product(cpe:cpe, location:insPath);
      log_message(data: build_detection_report(app: "Flash Player Within Google Chrome",
                                               version: flashVer,
                                               install: insPath,
                                               cpe: cpe,
                                               concluded: flashVer));
    }
  }
}
exit(0);
