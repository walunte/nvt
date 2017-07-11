###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_webLogic_server_cpuapr2017-3236618_02.nasl 6092 2017-05-10 07:02:40Z cfi $
#
# Oracle WebLogic Server 'Servlet Runtime' RCE Vulnerability (cpuapr2017-3236618)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

CPE = "cpe:/a:bea:weblogic_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810749");
  script_version("$Revision: 6092 $");
  script_cve_id("CVE-2017-3531");
  script_bugtraq_id(97894);
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-10 09:02:40 +0200 (Wed, 10 May 2017) $");
  script_tag(name:"creation_date", value:"2017-04-19 15:13:16 +0530 (Wed, 19 Apr 2017)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Oracle WebLogic Server 'Servlet Runtime' RCE Vulnerability (cpuapr2017-3236618)");

  script_tag(name: "summary" , value:"The host is running Oracle WebLogic Server
  and is prone to remote code execution vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists due to some unspecified
  error in the 'Servlet Runtime' sub-component within Oracle WebLogic Server.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to execute arbitrary code. 

  Impact Level: Application");

  script_tag(name:"affected", value:"Oracle WebLogic Server versions 12.1.3.0,
  12.2.1.0, 12.2.1.1 and 12.2.1.2");

  script_tag(name:"solution", value:"Apply update from the link mentioned below,
  http://www.oracle.com/technetwork/security-advisory/cpuapr2017-3236618.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/security-advisory/cpuapr2017-3236618.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("oracle_webLogic_server_detect.nasl");
  script_mandatory_keys("OracleWebLogicServer/installed");
  script_require_ports("Services/www", 7001);
  exit(0);
}


##
#Code Starts Here
##

include("host_details.inc");
include("version_func.inc");

##Variable initialization
webVer = "";
webPort = "";
report = "";

##Get Port
if(!webPort = get_app_port(cpe:CPE)){
  exit(0);
}

##Get version
if(!webVer = get_app_version(cpe:CPE, port:webPort)){
  exit(0);
}

affected = make_list('12.1.3.0', '12.2.1.0', '12.2.1.2', '12.2.1.1');
foreach version (affected)
{
  if( webVer == version)
  {
    report = report_fixed_ver(installed_version:webVer, fixed_version:"Apply the appropriate patch");
    security_message(data:report, port:webPort);
    exit(0);
  }
}