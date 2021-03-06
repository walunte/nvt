###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_typo3_link_validator_xss_vuln_may16.nasl 5867 2017-04-05 09:01:13Z teissa $
#
# TYPO3 Link Validator Component XSS Vulnerability May16 (SA-2016-002)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:typo3:typo3";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807827");
  script_version("$Revision: 5867 $");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-04-05 11:01:13 +0200 (Wed, 05 Apr 2017) $");
  script_tag(name:"creation_date", value:"2016-05-20 17:40:01 +0530 (Fri, 20 May 2016)");
  script_name("TYPO3 Link Validator Component XSS Vulnerability May16 (SA-2016-002)");

  script_tag(name: "summary" , value: "This host is installed with TYPO3 and
  is prone to cross site scripting vulnerability.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value: "The flaw exists due to an error in
  the link validator component which fails to sanitize content from editors.");

  script_tag(name: "impact" , value: "Successful exploitation will allow
  remote attackers to execute arbitrary script code in a user's browser session
  within the trust relationship between their browser and the server.

  Impact Level: Application.");

  script_tag(name: "affected" , value:"TYPO3 versions 6.2.0 through 6.2.17 and
  7.6.0 through 7.6.2");

  script_tag(name: "solution" , value:"Upgrade to TYPO3 version 6.2.18 or 7.6.3
  or later. For updates refer to https://typo3.org/typo3-cms");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name: "URL" , value : "https://typo3.org/teams/security/security-bulletins/typo3-core/typo3-core-sa-2016-002");

  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_typo3_detect.nasl");
  script_mandatory_keys("TYPO3/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

## Variable initialisation
typoPort = "";
typoVer = "";

## Get Application HTTP Port
if(!typoPort = get_app_port(cpe:CPE)){
  exit(0);
}

##Get Typo3 version
if(!typoVer = get_app_version(cpe:CPE, port:typoPort)){
  exit(0);
}

if(typoVer !~ "[0-9]+\.[0-9]+\.[0-9]+") exit(0); # Version is not exact enough

## Check for version 6.2.0 to 6.2.17
if(typoVer =~ "6\.2")
{
  if(version_in_range(version:typoVer, test_version:"6.2.0", test_version2:"6.2.17"))
  {
    fix = "6.2.18";
    VULN = TRUE;
  }
}

##Check for version 7.x before 7.6.1
if(typoVer =~ "7\.6")
{
  if(version_in_range(version:typoVer, test_version:"7.6.0", test_version2:"7.6.2"))
  {
    fix = "7.6.3";
    VULN = TRUE;
  }
}

if(VULN)
{
  report = report_fixed_ver(installed_version:typoVer, fixed_version:fix);
  security_message(port:typoPort, data:report);
  exit(0);
}

exit(99);
