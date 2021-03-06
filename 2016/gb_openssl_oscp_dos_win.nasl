##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_oscp_dos_win.nasl 5659 2017-03-21 11:24:51Z cfi $
# OpenSSL OCSP Status Request extension unbounded memory growth vulnerability (Windows)
#
# Authors:
# Tameem Eissa <tameem.eissa..at..greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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

tag_insight = " OPENSSL suffers from the possibility of DoS attack through sending a large OCSP Status Request extensions which lead to unbounded memory growth on the server which in turn lead to denial of service. ";

tag_impact = "Successful exploitation could result in service crash.";

tag_affected = "OpenSSL 1.1.0 and previous versions.";

tag_summary = "This host is running OpenSSL and prone to denial of service vulnerability.";

tag_solution = "OpenSSL 1.1.0 users should upgrade to 1.1.0a. OpenSSL 1.0.2 users should upgrade to 1.0.2i. OpenSSL 1.0.1 users should upgrade to 1.0.1u. ";

CPE = "cpe:/a:openssl:openssl";


if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107051");
  script_version("$Revision: 5659 $");
  script_cve_id("CVE-2016-6304");
  script_tag(name:"last_modification", value:"$Date: 2017-03-21 12:24:51 +0100 (Tue, 21 Mar 2017) $");
  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"creation_date", value:"2016-09-26 06:40:16 +0200 (Mon, 26 Sep 2016)");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_name("OpenSSL OCSP Status Request extension unbounded memory growth vulnerability (Windows)");
  script_xref(name:"URL", value:"https://www.openssl.org/news/secadv/20160922.txt");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_openssl_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("OpenSSL/installed","Host/runs_windows");
  script_require_ports("Services/www", 80);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}
include("host_details.inc");
include("version_func.inc");


## Variable Initialization
sslVer = "";

## check if the server runs windows
if(host_runs("Windows") != "yes")   exit(0);

## Get Version
if(!sslVer = get_app_version(cpe:CPE))
{
  exit(0);
}

## Checking for Vulnerable version 

if(sslVer =~ "^(1\.1\.0)" && version_is_less(version:sslVer, test_version:"1.1.0a"))
{
  fix = "1.1.0a";
  VUL = TRUE;
}
else if (sslVer =~ "^(1\.0\.2)" && version_is_less( version:sslVer, test_version:"1.0.2i"))
{
  fix = "1.0.2i";
  VUL = TRUE;
}
else if (sslVer =~ "^(1\.0\.1)" && version_is_less( version:sslVer, test_version:"1.0.1u"))
{
  fix = "1.0.1u";
  VUL = TRUE;
}

if (VUL)
{
  report = report_fixed_ver(installed_version:sslVer, fixed_version:fix);
  security_message(data:report);
  exit(0);
}

