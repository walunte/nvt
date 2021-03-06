###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_zarafa_collab_plat_arbit_file_acc_vuln.nasl 2015-06-25 10:20:28 +0530 Jun$
#
# Zarafa Collaboration Platform Arbitrary File Access Vulnerability
#
# Authors:
# Deependra Bapna <bdeepednra@secpod.com>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:zarafa:zarafa_collaboration_platform";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805708");
  script_version("$Revision: 6376 $");
  script_tag(name:"cvss_base", value:"6.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-06-20 12:00:24 +0200 (Tue, 20 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-07-03 15:19:25 +0530 (Fri, 03 Jul 2015)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Zarafa Collaboration Platform Arbitrary File Access Vulnerability");

  script_tag(name: "summary" , value:"This host is installed with Zarafa
  Collaboration Platform and is prone to a arbitrary file access
  vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw is due to
  'provider/server/ECServer.cpp' allows local users to write to arbitrary
  files via a symlink attack on '/tmp/zarafa-upgrade-lock'");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to retrieve or delete arbitrary files, which may aid in further
  attacks.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Zarafa Collaboration Platform (ZCP)
  before 7.1.13 and 7.2.x before 7.2.1");

  script_tag(name: "solution" , value:"Upgrade to 7.1.13 or 7.2.1 or later,
  For updates refer to https://www.zarafa.com");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://jira.zarafa.com/browse/ZCP-13282");
  script_xref(name:"URL", value:"http://lists.fedoraproject.org/pipermail/package-announce/2015-June/159497.html");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_zarafa_webapp_detect.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_mandatory_keys("zarafa_zcp/installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
zcpVer = "";
zcpPort = "";

## get the port
if(!zcpPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get the version
if(!zcpVer = get_app_version(cpe:CPE, port:zcpPort)){
  exit(0);
}

if(version_is_less(version:zcpVer, test_version:"7.1.13"))
{
  fix = "7.1.13";
  vuln = TRUE;
}

if(zcpVer =~ "^7\.2")
{
  if(version_is_less(version:zcpVer, test_version:"7.2.1"))
  {
    fix = "7.2.1";
    vuln = TRUE;
  }
}

if(vuln)
{
  report = 'Installed Version: ' + zcpVer + '\n' +
           'Fixed Version:     ' + fix + '\n';
  security_message(data:report, port:zcpPort);
  exit(0);
}
