###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for imap CESA-2009:0275 centos3 i386
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
tag_insight = "The imap package provides server daemons for both the IMAP (Internet
  Message Access Protocol) and POP (Post Office Protocol) mail access protocols.

  A buffer overflow flaw was discovered in the dmail and tmail mail delivery
  utilities shipped with imap. If either of these utilities were used as a
  mail delivery agent, a remote attacker could potentially use this flaw to
  run arbitrary code as the targeted user by sending a specially-crafted mail
  message to the victim. (CVE-2008-5005)
  
  Users of imap should upgrade to these updated packages, which contain a
  backported patch to resolve this issue.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "imap on CentOS 3";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2009-February/015645.html");
  script_id(880714);
  script_version("$Revision: 6653 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:46:53 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2009:0275");
  script_cve_id("CVE-2008-5005");
  script_name("CentOS Update for imap CESA-2009:0275 centos3 i386");

  script_summary("Check for the Version of imap");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

if(release == "CentOS3")
{

  if ((res = isrpmvuln(pkg:"imap", rpm:"imap~2002d~15", rls:"CentOS3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"imap-devel", rpm:"imap-devel~2002d~15", rls:"CentOS3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"imap-utils", rpm:"imap-utils~2002d~15", rls:"CentOS3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
