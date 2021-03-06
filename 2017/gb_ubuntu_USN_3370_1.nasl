###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3370_1.nasl 6824 2017-08-01 05:42:09Z cfischer $
#
# Ubuntu Update for apache2 USN-3370-1
#
# Authors:
# System Generated Check
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.843260");
  script_version("$Revision: 6824 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-01 07:42:09 +0200 (Tue, 01 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-07-28 07:24:21 +0200 (Fri, 28 Jul 2017)");
  script_cve_id("CVE-2017-9788");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for apache2 USN-3370-1");
  script_tag(name: "summary", value: "Check the version of apache2");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of 
  detect NVT and check if the version is vulnerable or not."); 
  script_tag(name: "insight", value: "Robert  wicki discovered that the 
  Apache HTTP Server mod_auth_digest module incorrectly cleared values when 
  processing certain requests. A remote attacker could use this issue to cause the 
  server to crash, resulting in a denial or service, or possibly obtain sensitive 
  information."); 
  script_tag(name: "affected", value: "apache2 on Ubuntu 17.04 ,
  Ubuntu 16.04 LTS ,
  Ubuntu 14.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "3370-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-3370-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

  if ((res = isdpkgvuln(pkg:"apache2-bin", ver:"2.4.7-1ubuntu4.17", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU17.04")
{

  if ((res = isdpkgvuln(pkg:"apache2-bin", ver:"2.4.25-3ubuntu2.2", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"apache2-bin", ver:"2.4.18-2ubuntu3.4", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
