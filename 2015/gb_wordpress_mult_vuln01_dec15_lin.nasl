###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_mult_vuln01_dec15_lin.nasl 6513 2017-07-04 09:59:28Z teissa $
#
# WordPress Multiple Vulnerabilities Dec15 (Linux)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:wordpress:wordpress";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806801");
  script_version("$Revision: 6513 $");
  script_cve_id("CVE-2015-5734", "CVE-2015-5733", "CVE-2015-5732", "CVE-2015-5731",
                "CVE-2015-5730", "CVE-2015-2213");
  script_bugtraq_id(76331,76160);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-04 11:59:28 +0200 (Tue, 04 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-12-15 13:15:38 +0530 (Tue, 15 Dec 2015)");
  script_name("WordPress Multiple Vulnerabilities Dec15 (Linux)");

  script_tag(name:"summary", value:"This host is running WordPress and is prone
  to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to,
  - An error in the legacy theme preview implementation within the  file
   'wp-includes/theme.php', which is not properly handling the user input.
  - An error in the function 'refreshAdvancedAccessibilityOfItem' within file
    'wp-admin/js/nav-menu.js', which is not properly handling the user input.
  - An error in the function 'WP_Nav_Menu_Widget' class within file
   'wp-includes/default-widgets.php', which is not properly handling the user
    input.
  - The function 'wp_untrash_post_comments' is not properly handling a comment
    after retrieving from trash within the file 'wp-includes/post.php'
  - The no usage of constant time comaprision for widgets in function
    'sanitize_widget_instance' leads to timing side-channel attack by measuring
    the delay before inequality is calculated which is
    within the file 'wp-includes/class-wp-customize-widgets.php'
  - The Cross-site request forgery (CSRF) vulnerability in 'wp-admin/post.php'");

  script_tag(name:"impact", value:"Successfully exploiting will allow
  remote attackers to inject arbitrary web script code in a user's browser
  session within the trust relationship between their browser and the server,
  to inject or manipulate SQL queries in the back-end database and to cause
  denial of service.

  Impact Level: Application");

  script_tag(name:"affected", value:"WordPress Versions before 4.2.4
  on linux.");

  script_tag(name:"solution", value:"Upgrade to WordPress version 4.2.4
  or later, For updates refer to https://wordpress.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name : "URL" , value : "http://seclists.org/oss-sec/2015/q3/290");
  script_xref(name : "URL" , value : "https://wordpress.org/news/2015/08/wordpress-4-2-4-security-and-maintenance-release/");
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

## exit, if its not Windows
if(host_runs("Windows") == "yes") exit(0);

## get the port
if(!wpPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get the version
if(!wpVer = get_app_version(cpe:CPE, port:wpPort)){
  exit(0);
}

## Checking for vulnerable version
if(version_is_less(version:wpVer, test_version:"4.2.4"))
{
  report = 'Installed Version: ' + wpVer + '\n' +
           'Fixed Version: 4.2.4' + '\n';
  security_message(port:wpPort, data:report);
  exit(0);
}
