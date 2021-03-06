###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for devscripts USN-1593-1
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
tag_insight = "Raphael Geissert discovered that the debdiff.pl tool incorrectly handled
  shell metacharacters. If a user or automated system were tricked into
  processing a specially crafted filename, a remote attacher could possibly
  execute arbitrary code. (CVE-2012-0212)

  Raphael Geissert discovered that the dscverify tool incorrectly escaped
  arguments to external commands. If a user or automated system were tricked
  into processing specially crafted files, a remote attacher could possibly
  execute arbitrary code. (CVE-2012-2240)
  
  Raphael Geissert discovered that the dget tool incorrectly performed input
  validation. If a user or automated system were tricked into processing
  specially crafted files, a remote attacher could delete arbitrary files.
  (CVE-2012-2241)
  
  Raphael Geissert discovered that the dget tool incorrectly escaped
  arguments to external commands. If a user or automated system were tricked
  into processing specially crafted files, a remote attacher could possibly
  execute arbitrary code. This issue only affected Ubuntu 10.04 LTS and
  Ubuntu 11.04. (CVE-2012-2242)
  
  Jim Meyering discovered that the annotate-output tool incorrectly handled
  temporary files. A local attacker could use this flaw to alter files being
  processed by the annotate-output tool. On Ubuntu 11.04 and later, this
  issue was mitigated by the Yama kernel symlink restrictions.
  (CVE-2012-3500)";

tag_summary = "Ubuntu Update for Linux kernel vulnerabilities USN-1593-1";
tag_affected = "devscripts on Ubuntu 12.04 LTS ,
  Ubuntu 11.10 ,
  Ubuntu 11.04 ,
  Ubuntu 10.04 LTS";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://lists.ubuntu.com/archives/ubuntu-security-announce/2012-October/001851.html");
  script_id(841169);
  script_version("$Revision: 6643 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:00:30 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-10-03 09:24:12 +0530 (Wed, 03 Oct 2012)");
  script_cve_id("CVE-2012-0212", "CVE-2012-2240", "CVE-2012-2241", "CVE-2012-2242", "CVE-2012-3500");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "USN", value: "1593-1");
  script_name("Ubuntu Update for devscripts USN-1593-1");

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

  if ((res = isdpkgvuln(pkg:"devscripts", ver:"2.10.61ubuntu5.3", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"devscripts", ver:"2.11.6ubuntu1.4", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"devscripts", ver:"2.11.1ubuntu3.2", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"devscripts", ver:"2.10.69ubuntu2.2", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
