###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for mysql-5.7 USN-3040-1
#
# Authors:
# System Generated Check
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.842841");
  script_version("$Revision: 6647 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:04:05 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-08-02 10:55:44 +0530 (Tue, 02 Aug 2016)");
  script_cve_id("CVE-2016-3424", "CVE-2016-3459", "CVE-2016-3477", "CVE-2016-3486",
		"CVE-2016-3501", "CVE-2016-3518", "CVE-2016-3521", "CVE-2016-3588",
	 	"CVE-2016-3614", "CVE-2016-3615", "CVE-2016-5436", "CVE-2016-5437",
	 	"CVE-2016-5439", "CVE-2016-5440", "CVE-2016-5441", "CVE-2016-5442",
		"CVE-2016-5443");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for mysql-5.7 USN-3040-1");
  script_tag(name: "summary", value: "Check the version of mysql-5.7");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Multiple security issues were discovered in
  MySQL and this update includes new upstream MySQL versions to fix these issues.

MySQL has been updated to 5.5.50 in Ubuntu 12.04 LTS and Ubuntu 14.04 LTS.
Ubuntu 15.10 has been updated to MySQL 5.6.31. Ubuntu 16.04 LTS has been
updated to MySQL 5.7.13.

In addition to security fixes, the updated packages contain bug fixes,
new features, and possibly incompatible changes.

Please see the following for more information:
http://dev.mysql.com/doc/relnotes/mysql/5.5/en/news-5-5-50.html
http://dev.mysql.com/doc/relnotes/mysql/5.6/en/news-5-6-31.html
http://dev.mysql.com/doc/relnotes/mysql/5.7/en/news-5-7-13.html
http://www.oracle.com/technetwork/security-advisory/cpujul2016-2881720.html");
  script_tag(name: "affected", value: "mysql-5.7 on Ubuntu 16.04 LTS ,
  Ubuntu 15.10 ,
  Ubuntu 14.04 LTS ,
  Ubuntu 12.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "3040-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-3040-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"mysql-server-5.5", ver:"5.5.50-0ubuntu0.14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"mysql-server-5.5", ver:"5.5.50-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"mysql-server-5.7", ver:"5.7.13-0ubuntu0.16.04.2", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU15.10")
{

  if ((res = isdpkgvuln(pkg:"mysql-server-5.6", ver:"5.6.31-0ubuntu0.15.10.1", rls:"UBUNTU15.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
