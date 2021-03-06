###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_open_xchange_appsuite_mult_vuln05.nasl 6357 2017-06-16 10:00:29Z teissa $
#
# Open-Xchange (OX) AppSuite Multiple Vulnerabilities -05 Nov15
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
  script_oid("1.3.6.1.4.1.25623.1.0.806524");
  script_version("$Revision: 6357 $");
  script_cve_id("CVE-2013-6074", "CVE-2013-6241");
  script_bugtraq_id(63565);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-06-16 12:00:29 +0200 (Fri, 16 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-11-02 10:34:36 +0530 (Mon, 02 Nov 2015)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Open-Xchange (OX) AppSuite Multiple Vulnerabilities -05 Nov15");

  script_tag(name: "summary" , value:"This host is installed with
  Open-Xchange (OX) AppSuite and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws are due to:
  - Input sanitization error in SVG file.
  - Error in Birthday widget in the backend in Open-Xchange (OX) AppSuite.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to inject arbitrary web script or HTML and to obtain sensitive
  information .

  Impact Level: Application");

  script_tag(name:"affected", value:"Open-Xchange (OX) AppSuite versions
  7.2.x before 7.2.2-rev25 and 7.4.x before 7.4.0-rev14.");

  script_tag(name:"solution", value:"Upgrade to Open-Xchange (OX) AppSuite
  version 7.2.2-rev25 or 7.4.0-rev14 or later.
  For updates refer to https://www.open-xchange.com");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://archives.neohapsis.com/archives/bugtraq/2013-11/0025.html");

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

if(oxRev)
{
  ## Updating version with revision number
  oxVer = oxVer + "." + oxRev;

  ##Check for vulnerable version
  if(version_in_range(version:oxVer, test_version:"7.2", test_version2:"7.2.2.24"))
  {
    fix = "7.2.2-rev25";
    VULN = TRUE;
  }

  if(version_in_range(version:oxVer, test_version:"7.4", test_version2:"7.4.0.13"))
  {
    fix = "7.4.0-rev14";
    VULN = TRUE;
  }

  if(VULN)
  {
    report = 'Installed Version: ' + oxVer + '\nFixed Version:     ' + fix + '\n';
    security_message(data:report);
    exit(0);
  }
}
