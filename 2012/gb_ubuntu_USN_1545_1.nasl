###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for nova USN-1545-1
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
tag_insight = "Padraig Brady discovered that the fix for CVE-2012-3361 was incomplete and
  an authenticated user could still corrupt arbitrary files on the host
  running Nova. A remote attacker could use this to cause a denial of service
  or possibly gain privileges.";

tag_summary = "Ubuntu Update for Linux kernel vulnerabilities USN-1545-1";
tag_affected = "nova on Ubuntu 12.04 LTS ,
  Ubuntu 11.10";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://lists.ubuntu.com/archives/ubuntu-security-announce/2012-August/001800.html");
  script_id(841121);
  script_version("$Revision: 6643 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:00:30 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-08-24 09:56:40 +0530 (Fri, 24 Aug 2012)");
  script_cve_id("CVE-2012-3361", "CVE-2012-3447");
  script_tag(name:"cvss_base", value:"5.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:P/A:P");
  script_xref(name: "USN", value: "1545-1");
  script_name("Ubuntu Update for nova USN-1545-1");

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

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"python-nova", ver:"2012.1+stable~20120612-3ee026e-0ubuntu1.3", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"python-nova", ver:"2011.3-0ubuntu6.10", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
