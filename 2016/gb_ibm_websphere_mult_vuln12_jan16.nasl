###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_websphere_mult_vuln12_jan16.nasl 5712 2017-03-24 10:00:49Z teissa $
#
# IBM Websphere Apllication Server Multiple Vulnerabilities -12 Jan16
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:ibm:websphere_application_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806847");
  script_version("$Revision: 5712 $");
  script_cve_id("CVE-2013-0544", "CVE-2013-0543", "CVE-2013-0542", "CVE-2013-0541");
  script_bugtraq_id(59250, 59249, 59248, 59247);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-03-24 11:00:49 +0100 (Fri, 24 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-01-20 15:32:25 +0530 (Wed, 20 Jan 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("IBM Websphere Apllication Server Multiple Vulnerabilities -12 Jan16");

  script_tag(name: "summary" , value:"This host is installed with IBM Websphere
  application server and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight", value:"Multiple flaws are due to,
  - An improper validation of user accounts when a Local OS registry is used.
  - An improper validation of input by the Administrative console.
  - The buffer overflow vulnerability when a local OS registry is used in
    conjunction with WebSphere Identity Manger.
  - The directory traversal vulnerability in the Administrative Console");

  script_tag(name: "impact" , value:"Successful exploitation will allow
  remote attacker to modify data, to bypass intended access restrictions, to
  inject arbitrary web script or HTML and to cause a denial of service.

  Impact Level: Application");

  script_tag(name: "affected" , value:"IBM WebSphere Application Server (WAS)
  6.1 before 6.1.0.47, 7.0 before 7.0.0.29, 8.0 before 8.0.0.6,
  and 8.5 before 8.5.0.2");

  script_tag(name: "solution" , value:"Upgrade to IBM WebSphere Application
  Server (WAS) version 6.1.0.47, or 7.0.0.29, or 8.0.0.6, or 8.5.0.2 or later
  For updates refer to http://www-03.ibm.com/software/products/en/appserv-was");

  script_tag(name:"solution_type", value:"VendorFix");

# 2016-06-13: 404
#  script_xref(name : "URL" , value : "http://www-01.ibm.com/support/docview.wss?&amp;uid=swg21632423");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_ibm_websphere_detect.nasl");
  script_mandatory_keys("ibm_websphere_application_server/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Get version
if(!wasVer = get_app_version(cpe:CPE, nofork:TRUE)){
  exit(0);
}

## Get port
if(!wasPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Check Adobe Reader vulnerable versions
if(version_in_range(version:wasVer, test_version:"6.1", test_version2:"6.1.0.46"))
{
  fix = "6.1.0.47";
  VULN = TRUE;
}

else if(version_in_range(version:wasVer, test_version:"7.0", test_version2:"7.0.0.28"))
{
  fix = "7.0.0.29";
  VULN = TRUE;
}

else if(version_in_range(version:wasVer, test_version:"8.0", test_version2:"8.0.0.5"))
{
  fix = "8.0.0.6";
  VULN = TRUE;
}

else if(version_in_range(version:wasVer, test_version:"8.5", test_version2:"8.5.0.1"))
{
  fix = "8.5.0.2";
  VULN = TRUE;
}

if(VULN)
{
  report = 'Installed version: ' + wasVer + '\n' +
           'Fixed version:     ' + fix  + '\n';
  security_message(data:report, port:wasPort);
  exit(0);
}