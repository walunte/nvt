###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vlc_media_player_mp4_dos_vuln_win.nasl 5958 2017-04-17 09:02:19Z teissa $
#
# VLC Media Player 'MP4' Denial of Service Vulnerability (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation could allow attackers to crash the affected
application, denying service to legitimate users.

Impact Level: Application";

tag_affected = "VLC media player version 2.0.1 on Windows";

tag_insight = "A division by zero error exists when handling MP4 files, which
can be exploited to cause a crash.";

tag_solution = "Update to version 1.7.2 or later,
For updates refer to http://www.videolan.org/vlc";

tag_summary = "This host is installed with VLC Media Player and is prone to
denial of service vulnerability.";

if(description)
{
  script_id(802920);
  script_version("$Revision: 5958 $");
  script_cve_id("CVE-2012-2396");
  script_bugtraq_id(53535, 53169);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-04-17 11:02:19 +0200 (Mon, 17 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-07-25 13:06:00 +0530 (Wed, 25 Jul 2012)");
  script_name("VLC Media Player 'MP4' Denial of Service Vulnerability (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/49159");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/75038");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/18757");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/files/111991/VLC-2.0.1-Division-By-Zero.html");

  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_dependencies("secpod_vlc_media_player_detect_win.nasl");
  script_mandatory_keys("VLCPlayer/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

## Variable Initialization
vlcVer = "";

## Get the version from KB
vlcVer = get_kb_item("VLCPlayer/Win/Ver");
if(!vlcVer){
  exit(0);
}

## Check for VLC Media Player Version is 2.0.1
if(version_is_equal(version:vlcVer, test_version:"2.0.1")){
  security_message(0);
}
