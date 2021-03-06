###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_samba_infinite_loop_dos_vuln.nasl 6396 2017-06-21 15:28:58Z teissa $
#
# Samba 'fd_open_atomic infinite loop' Denial-of-Service Vulnerability
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

CPE = "cpe:/a:samba:samba";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811083");
  script_version("$Revision: 6396 $");
  script_cve_id("CVE-2017-9461");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-06-21 17:28:58 +0200 (Wed, 21 Jun 2017) $");
  script_tag(name:"creation_date", value:"2017-06-07 17:35:53 +0530 (Wed, 07 Jun 2017)");
  script_name("Samba 'fd_open_atomic infinite loop' Denial-of-Service Vulnerability");

  script_tag(name:"summary", value:"This host is running Samba and is prone
  to denial-of-service vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to error in smbd
  which enters infinite loop when trying to open an invalid symlink with O_CREAT.");

  script_tag(name:"impact", value:"Successfully exploiting this issue will allow
  remote attackers to conduct a denial-of-service condition(infinite loop with
  high CPU usage and memory consumption).

  Impact Level: Application");

  script_tag(name:"affected", value:"Samba versions before 4.4.10 and 4.5.x
  before 4.5.6");

  script_tag(name:"solution", value:"Upgrade to Samba 4.4.10 or 4.5.6 or later.
  For updates refer to https://www.samba.org ");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name : "URL" , value : "https://bugzilla.samba.org/show_bug.cgi?id=12572");
  script_xref(name : "URL" , value : "https://git.samba.org/?p=samba.git;a=commit;h=10c3e3923022485c720f322ca4f0aca5d7501310");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("smb_nativelanman.nasl", "gb_samba_detect.nasl");
  script_mandatory_keys("samba/detected");
  script_require_ports(139, 445);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

##Variable Initialization
sambaPort = "";
sambaVer = "";
fix = "";
report = "";

##Fetch Port
if(!sambaPort = get_app_port(cpe:CPE)){
  exit(0);
}

##Fetch Version
if(!sambaVer = get_app_version(cpe:CPE, port:sambaPort)){
  exit(0);
}

##Check for vulnerable versions
if(version_is_less(version:sambaVer, test_version:"4.4.10")){
  fix = "4.4.10";
}

else if(sambaVer =~ "^(4\.5\.)" && version_is_less(version:sambaVer, test_version:"4.5.6")){
  fix = "4.5.6";
}

if(fix)
{
  report = report_fixed_ver(installed_version:sambaVer, fixed_version:fix);
  security_message( data:report, port:sambaPort);
  exit(0);
}
exit(0);
