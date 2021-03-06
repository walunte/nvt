###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_ncp_dissector_dos_vuln_may16_win.nasl 5745 2017-03-28 09:01:00Z teissa $
#
# Wireshark NCP dissector Denial of Service Vulnerability May16 (Windows)
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

CPE = "cpe:/a:wireshark:wireshark";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807576");
  script_version("$Revision: 5745 $");
  script_cve_id("CVE-2016-4085");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-03-28 11:01:00 +0200 (Tue, 28 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-05-03 11:09:01 +0530 (Tue, 03 May 2016)");
  script_name("Wireshark NCP dissector Denial of Service Vulnerability May16 (Windows)");
  
  script_tag(name:"summary", value:"This host is installed with Wireshark
  and is prone to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to stack-based buffer 
  overflow in 'epan/dissectors/packet-ncp2222.inc' script in the 
  'NCP dissector'.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to conduct denial of service attack or possibly have unspecified 
  other impact.

  Impact Level: Application");

  script_tag(name:"affected", value:"Wireshark version 1.12.x before 1.12.11
  on Windows");

  script_tag(name:"solution", value:"Upgrade to Wireshark version 1.12.11 or
  later.
  For updates refer to https://www.wireshark.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://www.wireshark.org/security/wnpa-sec-2016-28.html");

  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_wireshark_detect_win.nasl");
  script_mandatory_keys("Wireshark/Win/Ver");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
wirversion = "";

## Get the version
if(!wirversion = get_app_version(cpe:CPE)){
  exit(0);
}

## Check the vulnerable version 
if(version_in_range(version:wirversion, test_version:"1.12.0", test_version2:"1.12.10"))
{
  report = report_fixed_ver(installed_version:wirversion, fixed_version:"1.12.11");
  security_message(data:report);
  exit(0);
}
