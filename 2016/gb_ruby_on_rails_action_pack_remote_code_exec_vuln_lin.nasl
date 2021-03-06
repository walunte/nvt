###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ruby_on_rails_action_pack_remote_code_exec_vuln_lin.nasl 5580 2017-03-15 10:00:34Z teissa $
#
# Ruby on Rails Action Pack Remote Code Execution Vulnerability (Linux)
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

CPE = 'cpe:/a:rubyonrails:ruby_on_rails';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809353");
  script_version("$Revision: 5580 $");
  script_cve_id("CVE-2016-2098");
  script_bugtraq_id(83725);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-03-15 11:00:34 +0100 (Wed, 15 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-10-14 16:40:26 +0530 (Fri, 14 Oct 2016)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("Ruby on Rails Action Pack Remote Code Execution Vulnerability (Linux)");

  script_tag(name:"summary", value:"This host is running Ruby on Rails and is
  prone to remote code execution vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to an improper sanitization
  of user supplied inputs to the 'render' method in a controller or view by 
  'Action Pack'.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to control the arguments of the render method in a controller or a view,
  resulting in the possibility of executing arbitrary ruby code.

  Impact Level: Application");

  script_tag(name:"affected", value:"
  Ruby on Rails before 3.2.22.2,
  Ruby on Rails 4.x before 4.1.14.2 and
  Ruby on Rails 4.2.x before 4.2.5.2 on Linux.");

  script_tag(name:"solution", value:"Upgrade to Ruby on Rails 3.2.22.2 or 4.1.14.2 or
  4.2.5.2 or later. For updates refer to http://rubyonrails.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://www.debian.org/security/2016/dsa-3509");
  script_xref(name : "URL" , value : "https://groups.google.com/forum/message/raw?msg=rubyonrails-security/ly-IH-fxr_Q/WLoOhcMZIAAJ");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_ruby_rails_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("RubyOnRails/installed", "Host/runs_unixoide");
  script_require_ports("Services/www", 3000);
  exit(0);
}


##
### Code Starts Here
##

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
RubyonRailPort = "";
RubyonRailVer = "";

## exit, if its not Linux
if(host_runs("Linux") != "yes")exit(0);

## Get HTTP Port
if(!RubyonRailPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get the version
if(!RubyonRailVer = get_app_version(cpe:CPE, port:RubyonRailPort)){
  exit(0);
}

##Check for version before 3.2.22.2
if(version_is_less(version:RubyonRailVer, test_version:"3.2.22.2"))
{
  fix = "3.2.22.2";
  VULN = TRUE;
}

## Check for version 4.1 before 4.1.14.2
else if(RubyonRailVer =~ "^(4\.1)")
{
  if(version_is_less(version:RubyonRailVer, test_version:"4.1.14.2"))
  {
    fix = "4.1.14.2";
    VULN = TRUE;
  }
}

## Check for version 4.2 before 4.2.5.2
else if(RubyonRailVer =~ "^(4\.2)")
{
  if(version_is_less(version:RubyonRailVer, test_version:"4.2.5.2"))
  {
    fix = "4.2.5.2";
    VULN = TRUE;
  }
}

if(VULN)
{
  report = report_fixed_ver(installed_version:RubyonRailVer, fixed_version:fix);
  security_message(port:RubyonRailPort, data:report);
  exit(0);
}
