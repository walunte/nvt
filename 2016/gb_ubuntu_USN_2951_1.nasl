###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for optipng USN-2951-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.842717");
  script_version("$Revision: 6647 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:04:05 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-04-19 05:18:12 +0200 (Tue, 19 Apr 2016)");
  script_cve_id("CVE-2015-7801", "CVE-2015-7802", "CVE-2016-2191", "CVE-2016-3981",
 		"CVE-2016-3982");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for optipng USN-2951-1");
  script_tag(name: "summary", value: "Check the version of optipng");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Gustavo Grieco discovered that OptiPNG
  incorrectly handled memory. A remote attacker could use this issue with a
  specially crafted image file to cause OptiPNG to crash, resulting in a denial
  of service. (CVE-2015-7801)

  Gustavo Grieco discovered that OptiPNG incorrectly handled memory. A remote
  attacker could use this issue with a specially crafted image file to cause
  OptiPNG to crash, resulting in a denial of service. (CVE-2015-7802)

  Hans Jerry Illikainen discovered that OptiPNG incorrectly handled memory. A
  remote attacker could use this issue with a specially crafted image file to
  cause OptiPNG to crash, resulting in a denial of service, or possibly
  execute arbitrary code. (CVE-2016-2191)

  Henri Salo discovered that OptiPNG incorrectly handled memory. A remote
  attacker could use this issue with a specially crafted image file to cause
  OptiPNG to crash, resulting in a denial of service, or possibly execute
  arbitrary code. (CVE-2016-3981)

  Henri Salo discovered that OptiPNG incorrectly handled memory. A remote
  attacker could use this issue with a specially crafted image file to cause
  OptiPNG to crash, resulting in a denial of service, or possibly execute
  arbitrary code. (CVE-2016-3982)");
  script_tag(name: "affected", value: "optipng on Ubuntu 15.10 ,
  Ubuntu 14.04 LTS ,
  Ubuntu 12.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "2951-1");
  script_xref(name: "URL" , value: "https://lists.ubuntu.com/archives/ubuntu-security-announce/2016-April/003383.html");
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

  if ((res = isdpkgvuln(pkg:"optipng", ver:"0.6.4-1ubuntu0.14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"optipng", ver:"0.6.4-1ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU15.10")
{

  if ((res = isdpkgvuln(pkg:"optipng", ver:"0.7.5-1ubuntu0.1", rls:"UBUNTU15.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
