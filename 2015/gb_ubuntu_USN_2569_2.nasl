###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for apport USN-2569-2
#
# Authors:
# System Generated Check
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.842170");
  script_version("$Revision: 6646 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:03:11 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-04-17 07:09:13 +0200 (Fri, 17 Apr 2015)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for apport USN-2569-2");
  script_tag(name: "summary", value: "Check the version of apport");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "USN-2569-1 fixed a vulnerability in Apport.
Tavis Ormandy discovered that the fixed packages were still vulnerable to a
privilege escalation attack. This update completely disables crash report handling
for containers until a more complete solution is available.

Original advisory details:

St&#233 phane Graber and Tavis Ormandy independently discovered that Apport
incorrectly handled the crash reporting feature. A local attacker could use
this issue to gain elevated privileges.");
  script_tag(name: "affected", value: "apport on Ubuntu 14.10 ,
  Ubuntu 14.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "USN", value: "2569-2");
  script_xref(name: "URL" , value: "https://lists.ubuntu.com/archives/ubuntu-security-announce/2015-April/002908.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

if(release == "UBUNTU14.10")
{

  if ((res = isdpkgvuln(pkg:"apport", ver:"2.14.7-0ubuntu8.4", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"apport", ver:"2.14.1-0ubuntu3.10", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
