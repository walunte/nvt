###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for libxslt USN-1595-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");
tag_insight = "Chris Evans discovered that libxslt incorrectly handled generate-id XPath
  functions. If a user or automated system were tricked into processing a
  specially crafted XSLT document, a remote attacker could obtain potentially
  sensitive information. This issue only affected Ubuntu 8.04 LTS, Ubuntu
  10.04 LTS and Ubuntu 11.04. (CVE-2011-1202)

  It was discovered that libxslt incorrectly parsed certain patterns. If a
  user or automated system were tricked into processing a specially crafted
  XSLT document, a remote attacker could cause libxslt to crash, causing a
  denial of service. (CVE-2011-3970)
  
  Nicholas Gregoire discovered that libxslt incorrectly handled unexpected
  DTD nodes. If a user or automated system were tricked into processing a
  specially crafted XSLT document, a remote attacker could cause libxslt to
  crash, causing a denial of service. (CVE-2012-2825)
  
  Nicholas Gregoire discovered that libxslt incorrectly managed memory. If a
  user or automated system were tricked into processing a specially crafted
  XSLT document, a remote attacker could cause libxslt to crash, causing a
  denial of service. (CVE-2012-2870)
  
  Nicholas Gregoire discovered that libxslt incorrectly handled certain
  transforms. If a user or automated system were tricked into processing a
  specially crafted XSLT document, a remote attacker could cause libxslt to
  crash, causing a denial of service, or possibly execute arbitrary code.
  (CVE-2012-2871)
  
  Cris Neckar discovered that libxslt incorrectly managed memory. If a user
  or automated system were tricked into processing a specially crafted XSLT
  document, a remote attacker could cause libxslt to crash, causing a denial
  of service, or possibly execute arbitrary code. (CVE-2012-2893)";

tag_summary = "Ubuntu Update for Linux kernel vulnerabilities USN-1595-1";
tag_affected = "libxslt on Ubuntu 12.04 LTS ,
  Ubuntu 11.10 ,
  Ubuntu 11.04 ,
  Ubuntu 10.04 LTS ,
  Ubuntu 8.04 LTS";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://lists.ubuntu.com/archives/ubuntu-security-announce/2012-October/001854.html");
  script_id(841174);
  script_version("$Revision: 6643 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:00:30 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-10-05 09:44:04 +0530 (Fri, 05 Oct 2012)");
  script_cve_id("CVE-2011-1202", "CVE-2011-3970", "CVE-2012-2825", "CVE-2012-2870", "CVE-2012-2871", "CVE-2012-2893");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "USN", value: "1595-1");
  script_name("Ubuntu Update for libxslt USN-1595-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libxslt1.1", ver:"1.1.26-1ubuntu1.1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libxslt1.1", ver:"1.1.26-8ubuntu1.2", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"libxslt1.1", ver:"1.1.26-7ubuntu0.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"libxslt1.1", ver:"1.1.26-6ubuntu0.1", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU8.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libxslt1.1", ver:"1.1.22-1ubuntu1.3", rls:"UBUNTU8.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
