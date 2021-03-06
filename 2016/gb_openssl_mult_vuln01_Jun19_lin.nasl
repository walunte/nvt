##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_mult_vuln01_Jun19_lin.nasl 5655 2017-03-21 10:44:19Z cfi $
# OpenSSL Multiple Vulnerabilities -19 Jun16 (Linux)
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

tag_insight = "Multiple flaws are due to , 
1. Incorrectly using of pointer arithmetic for heap-buffer boundary checks which might allow remote attackers to cause a denial of service or possibly 
   have unspecified other impact by leveraging unexpected malloc behavior, related to s3_srvr.c, ssl_sess.c, and t1_lib.c .
2. Improperly use of constant-time operations in crypto/dsa/dsa_oss.c which allow local users to breach the DSA private key. 
"; 

tag_impact = " Successful exploitation will allow remote attackers to cause a denial of service and will allow local users to discover a DSA private key 
via a timing side-channel attack " ;

tag_affected = " Openssl:1.0.2h and previous versions " ; 

tag_summary = " This host is running OpenSSL and is prone to multiple vulnerabilities."; 

tag_solution = "For the undefined pointer arithmetic vulnerability, there is a fix available for OpenSSL 1.0.2 and OpenSSL 1.0.1. Refer to 
https://www.openssl.org/blog/blog/2016/06/27/undefined-pointer-arithmetic/. 
    To prevent DSA private key breach, a fix is available at https://git.openssl.org/?p=openssl.git;a=commit;h=399944622df7bd81af62e67ea967c470534090e2. ";
 
CPE = "cpe:/a:openssl:openssl";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107015");
  script_version("$Revision: 5655 $");
  script_cve_id("CVE-2016-2177", "CVE-2016-2178");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-03-21 11:44:19 +0100 (Tue, 21 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-06-29 12:46:24 +0530 (Wed, 29 Jun 2016)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("OpenSSL Multiple Vulnerabilities -19 Jun16 (Linux)");

  script_tag(name:"summary", value:"This host is running OpenSSL and is prone
  to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_openssl_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("OpenSSL/installed","Host/runs_unixoide");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
sslVer = "";

## exit, if its windows
if(host_runs("Linux") != "yes")   exit(0);

## Get Version
if(!sslVer = get_app_version(cpe:CPE))
{
  exit(0);
}

## Checking for Vulnerable version

if(sslVer =~ "^(1\.0\.2)" && version_is_less_equal(version:sslVer, test_version:"1.0.2h"))  
{
  report = report_fixed_ver(installed_version:sslVer, fixed_version:"Ask vendor");
  security_message(data:report);
  exit(0);
}

