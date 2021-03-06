###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_open_xchange_appsuite_drive_filename_xss_vuln.nasl 6415 2017-06-23 09:59:48Z teissa $
#
# Open-Xchange (OX) AppSuite Drive File Cross Site Scripting Vulnerability
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

CPE = "cpe:/a:open-xchange:open-xchange_appsuite";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806074");
  script_version("$Revision: 6415 $");
  script_cve_id("CVE-2014-2393");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-06-23 11:59:48 +0200 (Fri, 23 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-10-06 12:24:33 +0530 (Tue, 06 Oct 2015)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Open-Xchange (OX) AppSuite Drive File Cross Site Scripting Vulnerability");

  script_tag(name: "summary" , value:"The host is installed with
  Open-Xchange (OX) AppSuite and is prone to cross site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw is due to 'Drive filename' is
  not properly handled during use of the composer to add an e-mail attachment.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to inject arbitrary web script or HTML leading to session hijacking or
  triggering unwanted actions via the web interface.

  Impact Level: Application");

  script_tag(name:"affected", value:"Open-Xchange (OX) AppSuite versins 7.4.1
  before 7.4.1-rev11, and 7.4.2 before 7.4.2-rev13");

  script_tag(name:"solution", value:"Upgrade to Open-Xchange (OX) AppSuite
  version 7.4.1-rev11 or 7.4.2-rev13 or later.
  For updates refer to https://www.open-xchange.com");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://packetstormsecurity.com/files/126066");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/531762");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_ox_app_suite_detect.nasl");
  script_mandatory_keys("open_xchange_appsuite/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}

##
### Code Starts Here
##

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
oxPort = "";
oxVer = "";


## Get HTTP Port
if(!oxPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get the version
oxVer = get_app_version(cpe:CPE, port:oxPort);
if(!oxVer || "unknown" >< oxVer){
  exit(0);
}

## Get the revision
oxRev = get_kb_item("open_xchange_appsuite/" + oxPort + "/revision");

if(oxRev){

  ## Updating version with revision number
  oxVer = oxVer + "." + oxRev;

  ##Check for vulnerable version
  if(version_in_range(version:oxVer, test_version:"7.4.2", test_version2:" 7.4.2.12"))
  {
    fix = "7.4.2.13";
    VULN = TRUE;
  }

  if(version_in_range(version:oxVer, test_version:"7.4.1", test_version2:"7.4.1.10"))
  {
    fix = "7.4.1.11";
    VULN = TRUE;
  }

  if(VULN)
  {
    report = 'Installed Version: ' + oxVer + '\nFixed Version:     ' + fix + '\n';
    security_message(data:report);
    exit(0);
  }
}
