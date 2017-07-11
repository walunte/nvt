###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cybozu_garoon_mult_vuln_aug16.nasl 6311 2017-06-12 09:06:32Z cfischer $
#
# Cybozu Garoon Multiple Vulnerabilities - Aug16
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

CPE = "cpe:/a:cybozu:garoon";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.1071655555");
  script_version("$Revision: 6311 $");
  script_tag(name:"last_modification", value:"$Date: 2017-06-12 11:06:32 +0200 (Mon, 12 Jun 2017) $");
  script_tag(name:"creation_date", value:"2017-05-11 11:54:29 +0200 (Thu, 11 May 2017)");
  script_cve_id("CVE-2016-1214", "CVE-2016-1215", "CVE-2016-1216", "CVE-2016-1217");
  script_bugtraq_id(92596, 92598, 92599, 92600, 92601);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("Cybozu Garoon Multiple Vulnerabilities - Aug16");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_cybozu_products_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("CybozuGaroon/Installed");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/92599");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/92598");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/92600");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/92596");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/92601");

  script_tag(name:"summary", value:"This host is installed with Cybozu Garoon
  and is vulnerable to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of a detect NVT
  and check if the version is vulnerable or not.");

  script_tag(name:"insight", value:"Cybozu Garoon is prone to multiple vulnerabilities");

  script_tag(name:"impact" , value:"Successful exploitation will allow remote attackers to do redirection, XSS, authentication bypass, SQL Injection and denial of services attacks.");

  script_tag(name:"affected", value:"Cybozu Garoon before 4.2.2.");

  script_tag(name:"solution", value:"Update to Cybozu Garoon 4.2.2.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");


if(!Port = get_app_port(cpe:CPE)){
  exit(0);
}

if(!Ver = get_app_version(cpe:CPE, port: Port)){
  exit(0);
}

if(version_is_less(version: Ver, test_version:"4.2.2"))
{
  report =  report_fixed_ver(installed_version:Ver, fixed_version:"4.2.2");
  security_message(data:report, port: Port);
  exit( 0 );
}

exit ( 99 );