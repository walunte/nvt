###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_owncloud_information_exposure_vuln_sep16_lin.nasl 7174 2017-09-18 11:48:08Z asteins $
#
# ownCloud Information Exposure Vulnerability Sep16 (Linux)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
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

CPE = "cpe:/a:owncloud:owncloud";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809289");
  script_version("$Revision: 7174 $");
  script_cve_id("CVE-2015-6500");
  script_bugtraq_id(76689);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-09-18 13:48:08 +0200 (Mon, 18 Sep 2017) $");
  script_tag(name:"creation_date", value:"2016-09-23 14:35:25 +0530 (Fri, 23 Sep 2016)");
  script_name("ownCloud Information Exposure Vulnerability Sep16 (Linux)");

  script_tag(name: "summary" , value:"The host is installed with ownCloud and
  is prone to Information Exposure Vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists due to an incorrect usage
  of an ownCloud internal file system function.");

  script_tag(name: "impact" , value:"Successful exploitation will allows remote
  authenticated users to list directory contents and possibly cause a denial of
  service.

  Impact Level: Application");

  script_tag(name: "affected" , value:"ownCloud Server before 8.0.6 and 8.1.x
  before 8.1.1 on Linux.");

  script_tag(name: "solution" , value:"Upgrade to ownCloud Server 8.0.6 or
  8.1.1 later.
  For updates refer to http://owncloud.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name : "URL" , value : "https://owncloud.org/security/advisory/?id=oc-sa-2015-014");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_owncloud_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("owncloud/installed", "Host/runs_unixoide");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
ownPort = "";
ownVer = "";

## exit, if its not Linux
if(host_runs("Linux") != "yes") exit(0);

## Get the port
if(!ownPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get version
if(!ownVer = get_app_version(cpe:CPE, port:ownPort)){
  exit(0);
}

if(ownVer =~ "^8")
{
 ## Grep for vulnerable version
  if(version_is_less(version:ownVer, test_version:"8.0.6"))
  {
    fix = "8.0.6";
    VULN = TRUE;
  }

  else if(version_is_equal(version:ownVer, test_version:"8.1.0"))
  {
    fix = "8.1.1";
    VULN = TRUE;
  }

  if(VULN)
  {
    report = report_fixed_ver(installed_version:ownVer, fixed_version:fix);
    security_message(data:report, port:ownPort);
    exit(0);
  }
}
