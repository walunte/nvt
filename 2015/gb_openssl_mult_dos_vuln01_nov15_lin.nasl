###############################################################################
#OpenVAS Vulnerability Test
# $Id: gb_openssl_mult_dos_vuln01_nov15_lin.nasl 6600 2017-07-07 09:58:31Z teissa $
#
# OpenSSL Multiple Denial of Service Vulnerabilities -01 Nov15 (Linux)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:openssl:openssl";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806734");
  script_version("$Revision: 6600 $");
  script_cve_id("CVE-2015-0292", "CVE-2014-8176");
  script_bugtraq_id(73228, 75159);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-07 11:58:31 +0200 (Fri, 07 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-11-24 18:49:30 +0530 (Tue, 24 Nov 2015)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("OpenSSL Multiple Denial of Service Vulnerabilities -01 Nov15 (Linux)");

  script_tag(name:"summary", value:"This host is running OpenSSL and is prone
  to multiple denial of service vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to: 
  - Integer underflow in the 'EVP_DecodeUpdate' function in 'crypto/evp/encode.c' script in the
    base64-decoding implementation.
  - Memory corruption vulnerability while handling data structures.");

  script_tag(name:"impact", value:"Successful exploitation will allow an remote
  attackers to cause a denial of service or possibly have unspecified other impact.

  Impact Level: Application");

  script_tag(name:"affected", value:"OpenSSL versions before 0.9.8za, 1.0.0
  before 1.0.0m, and 1.0.1 before 1.0.1h on Linux");

  script_tag(name:"solution", value:"Upgrade to OpenSSL 0.9.8za or 1.0.0m or
  1.0.1h or later.
  For updates refer to https://www.openssl.org");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "http://www.ubuntu.com/usn/USN-2537-1");
  script_xref(name : "URL" , value : "https://www.openssl.org/news/secadv/20150319.txt");
  script_xref(name : "URL" , value : "https://www.openssl.org/news/secadv/20150319.txt");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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
if(host_runs("Windows") == "yes")exit(0);

## Get Version
if(!sslVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Checking for Vulnerable version
if(sslVer =~ "^(0\.9\.8)")
{
  if(version_is_less(version:sslVer, test_version:"0.9.8za"))
  {
    fix = "0.9.8za";
    VULN = TRUE;
  }
}
else if(sslVer =~ "^(1\.0\.0)")
{
  if(version_is_less(version:sslVer, test_version:"1.0.0m"))
  {
    fix = "1.0.0m";
    VULN = TRUE;
  }
}
else if(sslVer =~ "^(1\.0\.1)")
{
  if(version_is_less(version:sslVer, test_version:"1.0.1h"))
  {
    fix = "1.0.1h";
    VULN = TRUE;
  }
}
if(VULN)
{
  report = 'Installed version: ' + sslVer + '\n' +
           'Fixed version:    ' + fix + '\n';

  security_message(data:report);
  exit(0);
}
