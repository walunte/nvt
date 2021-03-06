###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_dos_vuln01_mar15_win.nasl 6183 2017-05-22 09:03:43Z teissa $
#
# Wireshark Denial-of-Service Vulnerability-01 Mar15 (Windows)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.805485");
  script_version("$Revision: 6183 $");
  script_cve_id("CVE-2015-2192", "CVE-2015-2190", "CVE-2015-2187");
  script_bugtraq_id(72937, 72938, 72940);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-22 11:03:43 +0200 (Mon, 22 May 2017) $");
  script_tag(name:"creation_date", value:"2015-03-09 16:41:59 +0530 (Mon, 09 Mar 2015)");
  script_name("Wireshark Denial-of-Service Vulnerability-01 Mar15 (Windows)");

  script_tag(name: "summary" , value:"This host is installed with Wireshark
  and is prone to denial of service vulnerability.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value: "Flaw exists due to Integer overflow in
  the 'dissect_osd2_cdb_continuation' function in epan/dissectors/packet-scsi-osd.c
  script and a a flaws in the ATN-CPDLC dissector and LLDP dissector.");

  script_tag(name: "impact" , value: "Successful exploitation will allow remote
  attackers to conduct denial of service attack.

  Impact Level: Application");

  script_tag(name: "affected" , value: "Wireshark version 1.12.x before 1.12.4
  on Windows");

  script_tag(name: "solution" , value: "Upgrade to version 1.12.4 or later,
  For updates refer to https://www.wireshark.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/62367");
  script_xref(name : "URL" , value : "http://www.wireshark.org/security/wnpa-sec-2015-06.html");
  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

## Check the vulnerable version is 1.10.x before 1.10.11
if(version_in_range(version:wirversion, test_version:"1.12.0", test_version2:"1.12.3"))
{
  fix = "1.12.4";
  VULN = TRUE;
}

if(VULN)
{
  report = 'Installed Version: ' + wirversion + '\nFixed Version:     ' + fix + '\n';
  security_message(data:report);
  exit(0);
}


