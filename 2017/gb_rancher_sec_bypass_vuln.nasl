###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_rancher_sec_bypass_vuln.nasl 7451 2017-10-17 04:59:58Z cfischer $
#
# Rancher Server Security Bypass Vulnerability
#
# Authors:
# Tameem Eissa <tameem.eissa@greenbone.net>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:rancher:rancher";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107248");
  script_version("$Revision: 7451 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-17 06:59:58 +0200 (Tue, 17 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-10-16 10:53:43 +0200 (Mon, 16 Oct 2017)");
  script_cve_id("CVE-2017-7297");
  script_bugtraq_id(97180);

  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");

  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Rancher Server Security Bypass Vulnerability");
  script_tag(name: "summary", value: "Rancher Server is prone to a security-bypass vulnerability.");

  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "Security Exposure: Any authenticated users can disable auth via API");

  script_tag(name: "impact" , value: "Attackers can exploit this issue to bypass certain security restrictions to perform unauthorized actions");

  script_tag(name: "affected", value: "rancher Server 1.5.2, rancher Server 1.4.2, rancher Server 1.3.4, rancher Server 1.2.3");
  script_tag(name: "solution", value: "Update to : rancher Server 1.5.3, rancher Server 1.4.3, rancher Server 1.3.5 or rancher Server 1.2.4.");

  script_xref(name: "URL" , value: "http://www.securityfocus.com/bid/97180");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");

  script_family("Web application abuses");

  script_dependencies("gb_rancher_detect.nasl");
  script_mandatory_keys("rancher/installed");
  script_require_ports("Services/www", 8080);

  exit(0);
}

include("host_details.inc");
include("version_func.inc");


if(!Port = get_app_port(cpe: CPE)){
  exit(0);
}

if(!Ver = get_app_version(cpe: CPE, port: Port)){
  exit(0);
}

Vuln = FALSE;

if(version_is_equal(version: Ver, test_version: "1.5.2"))
{
  Vuln = TRUE;
  fix = "1.5.3";
}

else if(version_is_equal(version: Ver, test_version: "1.4.2"))
{
  Vuln = TRUE;
  fix = "1.4.3";
}

else if(version_is_equal(version: Ver, test_version: "1.3.4"))
{
  Vuln = TRUE;
  fix = "1.3.5";
}

else if(version_is_equal(version: Ver, test_version: "1.2.4"))
{
  Vuln = TRUE;
  fix = "1.2.4";
}

if (Vuln)
{
  report =  report_fixed_ver(installed_version: Ver, fixed_version: fix);
  security_message(data: report);
  exit( 0 );
}

exit ( 99 );


