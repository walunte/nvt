###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for radvd USN-1257-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "Vasiliy Kulikov discovered that radvd incorrectly parsed the
  ND_OPT_DNSSL_INFORMATION option. A remote attacker could exploit this with
  a specially-crafted request and cause the radvd daemon to crash, or
  possibly execute arbitrary code. The default compiler options for affected
  releases should reduce the vulnerability to a denial of service. This issue
  only affected Ubuntu 11.04 and 11.10. (CVE-2011-3601)

  Vasiliy Kulikov discovered that radvd incorrectly filtered interface names
  when creating certain files. A local attacker could exploit this to
  overwrite certain files on the system, bypassing intended permissions.
  (CVE-2011-3602)

  Vasiliy Kulikov discovered that radvd incorrectly handled certain lengths.
  A remote attacker could exploit this to cause the radvd daemon to crash,
  resulting in a denial of service. (CVE-2011-3604)

  Vasiliy Kulikov discovered that radvd incorrectly handled delays when used
  in unicast mode, which is not the default in Ubuntu. If used in unicast
  mode, a remote attacker could cause radvd outages, resulting in a denial of
  service. (CVE-2011-3605)";

tag_summary = "Ubuntu Update for Linux kernel vulnerabilities USN-1257-1";
tag_affected = "radvd on Ubuntu 11.04 ,
  Ubuntu 10.10 ,
  Ubuntu 10.04 LTS";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "https://lists.ubuntu.com/archives/ubuntu-security-announce/2011-November/001474.html");
  script_id(840799);
  script_version("$Revision: 7015 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-28 13:51:24 +0200 (Mon, 28 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-11-11 09:55:29 +0530 (Fri, 11 Nov 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name: "USN", value: "1257-1");
  script_cve_id("CVE-2011-3601", "CVE-2011-3602", "CVE-2011-3604", "CVE-2011-3605");
  script_name("Ubuntu Update for radvd USN-1257-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
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

if(release == "UBUNTU10.10")
{

  if ((res = isdpkgvuln(pkg:"radvd", ver:"1:1.6-1ubuntu0.1", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"radvd", ver:"1:1.3-1.1ubuntu0.1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"radvd", ver:"1:1.7-1ubuntu0.1", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
