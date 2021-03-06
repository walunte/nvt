###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for policycoreutils FEDORA-2011-3043
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
tag_insight = "Security-enhanced Linux is a feature of the Linux&#174; kernel and a number
  of utilities with enhanced security functionality designed to add
  mandatory access controls to Linux.  The Security-enhanced Linux
  kernel contains new architectural components originally developed to
  improve the security of the Flask operating system. These
  architectural components provide general support for the enforcement
  of many kinds of mandatory access control policies, including those
  based on the concepts of Type Enforcement&#174;, Role-based Access
  Control, and Multi-level Security.

  policycoreutils contains the policy core utilities that are required
  for basic operation of a SELinux system.  These utilities include
  load_policy to load policies, setfiles to label filesystems, newrole
  to switch roles, and run_init to run /etc/init.d scripts in the proper
  context.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "policycoreutils on Fedora 14";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2011-March/056227.html");
  script_id(862929);
  script_version("$Revision: 6626 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:30:10 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2011-03-24 14:29:52 +0100 (Thu, 24 Mar 2011)");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "FEDORA", value: "2011-3043");
  script_cve_id("CVE-2011-1011");
  script_name("Fedora Update for policycoreutils FEDORA-2011-3043");

  script_summary("Check for the Version of policycoreutils");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");


res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC14")
{

  if ((res = isrpmvuln(pkg:"policycoreutils", rpm:"policycoreutils~2.0.85~19.fc14", rls:"FC14")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
