###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_cisco-sa-20160831-meetings-player.nasl 5712 2017-03-24 10:00:49Z teissa $
#
# Cisco WebEx Meetings Player Arbitrary Code Execution Vulnerability (Windows)
#
# Authors:
# Tameem Eissa <tameem.eissa@greenbone.net>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH
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

CPE = "cpe:/a:cisco:webex_wrf_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107067");
  script_version("$Revision: 5712 $");
  script_cve_id("CVE-2016-1464");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-24 11:00:49 +0100 (Fri, 24 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-10-25 11:19:11 +0530 (Tue, 25 Oct 2016)");
  script_name("Cisco WebEx Meetings Player Arbitrary Code Execution Vulnerability (Windows)");

  script_tag(name: "summary" , value: "This host is installed with Cisco
  WebEx Meetings Player and is prone to Arbitrary Code Execution Vulnerability.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the
  help  of detection NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight" , value: "The vulnerability is due to improper handling of user-supplied files. 
  An attacker could exploit this vulnerability by persuading a user to open a malicious file by using the 
  affected software.");

  script_tag(name: "impact" , value: "A successful exploit could allow the attacker to execute arbitrary 
  code on the system with the privileges of the user.");

  script_tag(name: "affected" , value:"Cisco WebEx WRF Player T29 SP10 Base Windows.");

  script_tag(name: "solution" , value:"Updates are available from the Cisco WebEx Meetings Server where the player was installed from, see advisory .");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name: "URL" , value : "https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160831-meetings-player");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("CISCO");
  script_dependencies("gb_cisco_webexwrf_detect_win.nasl");
  script_mandatory_keys("Cisco/Wrfplayer/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
wpVer = "";

## Get version
if(!wpVer = get_app_version(cpe:CPE)){
  exit(0);
}

if (version_in_range(version: wpVer, test_version:"29", test_version2:"29.13.111") ||
    version_in_range(version: wpVer, test_version:"30", test_version2:"30.12.0") ||
    version_in_range(version: wpVer, test_version:"31", test_version2:"31.5.19") ||
    version_in_range(version: wpVer, test_version:"31.R2", test_version2:"31.R1"))
{
   report = 'Installed version: ' + wpVer + '\n' +
           'Fixed versions:  29.13.112, 30.12.1, 31.5.20, 31R2 \n';
   security_message(data:report);
   exit(0);
}

