###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_mult_vuln_lin_mar17.nasl 5606 2017-03-17 17:09:01Z cfi $
#
# WordPress Multiple Vulnerabilities Mar17 (Linux)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:wordpress:wordpress";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809896");
  script_version("$Revision: 5606 $");
  script_cve_id("CVE-2017-6804", "CVE-2017-6815", "CVE-2017-6814", "CVE-2017-6816",
		"CVE-2017-6818", "CVE-2017-6817", "CVE-2017-6819");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-03-17 18:09:01 +0100 (Fri, 17 Mar 2017) $");
  script_tag(name:"creation_date", value:"2017-03-07 15:00:55 +0530 (Tue, 07 Mar 2017)");
  script_name("WordPress Multiple Vulnerabilities Mar17 (Linux)");

  script_tag(name:"summary", value:"This host is running WordPress and is prone
  to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to,
  - A cross-site scripting (XSS) vulnerability in media file metadata.
  - An improper URL validation.
  - Unintended files can be deleted by administrators using the plugin deletion
    functionality.
  - A cross-site scripting (XSS) in video URL in YouTube embeds.
  - A Cross-site request forgery (CSRF) in Press.");

  script_tag(name:"impact", value:"Successfully exploiting will allow remote
  attacker to create a specially crafted URL,execute arbitrary script code
  in a user's browser session within the trust relationship between their
  browser and the server and leading to excessive use of server resources.

  Impact Level: Application");

  script_tag(name:"affected", value:"WordPress versions 4.7.2 and prior on Linux.");

  script_tag(name:"solution", value:"Upgrade to WordPress 4.7.3 or later,
  For updates refer to https://wordpress.org");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_xref(name : "URL" , value : "https://wordpress.org/news/2017/03/wordpress-4-7-3-security-and-maintenance-release");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("os_detection.nasl", "secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed","Host/runs_unixoide");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
wpPort = "";
wpVer = "";

## exit, if its not Linux
if(host_runs("Linux") != "yes") exit(0);

## get the port
if(!wpPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get the version
if(!wpVer = get_app_version(cpe:CPE, port:wpPort)){
  exit(0);
}

## Check for version
if(version_is_less(version:wpVer, test_version:"4.7.3"))
{
  report = report_fixed_ver(installed_version:wpVer, fixed_version:"4.7.3");
  security_message(data:report, port:wpPort);
  exit(0);
}
