###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ruby_on_rails_action_view_render_dir_trav_vuln_win.nasl 5745 2017-03-28 09:01:00Z teissa $
#
# Ruby on Rails Action View 'render' Directory Traversal Vulnerability (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.809354");
  script_version("$Revision: 5745 $");
  script_cve_id("CVE-2016-2097");
  script_bugtraq_id(83726);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-03-28 11:01:00 +0200 (Tue, 28 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-10-14 20:09:25 +0530 (Fri, 14 Oct 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Ruby on Rails Action View 'render' Directory Traversal Vulnerability (Windows)");

  script_tag(name:"summary", value:"This host is running Ruby on Rails and is
  prone to directory traversal vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to an improper validation of
  crafted requests to action view, one of the components of action pack.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attackers to read arbitrary files by leveraging an application's unrestricted
  use of the render method.

  Impact Level: Application");

  script_tag(name:"affected", value:"
  Ruby on Rails before 3.2.22.2,
  Ruby on Rails 4.x before 4.1.14.2 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Ruby on Rails 3.2.22.2 or 4.1.14.2
  or later. For updates refer to http://rubyonrails.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://www.debian.org/security/2016/dsa-3509");
  script_xref(name : "URL" , value : "https://groups.google.com/forum/message/raw?msg=rubyonrails-security/ly-IH-fxr_Q/WLoOhcMZIAAJ");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_ruby_rails_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("RubyOnRails/installed", "Host/runs_windows");
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

## exit, if its not windows
if(host_runs("Windows") != "yes")exit(0);

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

if(VULN)
{
  report = report_fixed_ver(installed_version:RubyonRailVer, fixed_version:fix);
  security_message(port:RubyonRailPort, data:report);
  exit(0);
}