###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_hpe_loadrunner_mms_protocol_remote_code_exec_vuln.nasl 7174 2017-09-18 11:48:08Z asteins $
#
# HPE LoadRunner MMS Protocol Remote Code Execution Vulnerability
# 
# Authors:
# Tushar Khelge <ktushar@secpod.com>
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

CPE = "cpe:/a:hp:loadrunner";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810328");
  script_version("$Revision: 7174 $");
  script_cve_id("CVE-2016-8512");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-09-18 13:48:08 +0200 (Mon, 18 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-01-10 12:29:27 +0530 (Tue, 10 Jan 2017)");
  script_name("HPE LoadRunner MMS Protocol Remote Code Execution Vulnerability");

  script_tag(name:"summary", value:"This host is installed with HPE LoadRunner
  and is prone to remote code execution vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to an unspecified buffer 
  overflow condition in the MMS protocol due to improper validation of 
  user-supplied input.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  unauthenticated remote attacker to cause a denial of service or the execution
  of arbitrary code.

  Impact Level: System/Application.");

  script_tag(name:"affected", value:"HPE LoadRunner version 12.53.1203.0 and prior.");

  script_tag(name:"solution", value:"HPE has released the following mitigation information to resolve the vulnerability in impacted versions of HPE LoadRunner and Performance Center.
https://softwaresupport.hp.com/group/softwaresupport/search-result/-/facetsearch/document/KM02608184");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"http://h20565.www2.hpe.com/hpsc/doc/public/display?docLocale=en_US&docId=emr_na-c05354136");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_hpe_loadrunner_detect.nasl");
  script_mandatory_keys("HPE/LoadRunner/Win/Ver");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
hpVer= "";

## Get version
if(!hpVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Check For Version 12.53.1203.0 (Installed latest version 12.53 = 12.53.1203.0)
if(version_is_less_equal(version:hpVer, test_version:"12.53.1203.0"))
{
  report = report_fixed_ver(installed_version:hpVer, fixed_version:"See Vendor");
  security_message(data:report);
  exit(0);
}
