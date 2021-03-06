###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for sssd RHSA-2011:0975-01
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
tag_insight = "The System Security Services Daemon (SSSD) provides a set of daemons to
  manage access to remote directories and authentication mechanisms. It
  provides an NSS and PAM interface toward the system and a pluggable
  back-end system to connect to multiple different account sources. It is
  also the basis to provide client auditing and policy services for projects
  such as FreeIPA.

  A flaw was found in the SSSD PAM responder that could allow a local
  attacker to force SSSD to enter an infinite loop via a carefully-crafted
  packet. With SSSD unresponsive, legitimate users could be denied the
  ability to log in to the system. (CVE-2010-4341)
  
  Red Hat would like to thank Sebastian Krahmer for reporting this issue.
  
  These updated sssd packages include a number of bug fixes and enhancements.
  Space precludes documenting all of these changes in this advisory. Refer to
  the Red Hat Enterprise Linux 5.7 Technical Notes for information about
  these changes:

  https://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/5/html/5.7_Technical_Notes/sssd.html#RHSA-2011-0975
  
  All sssd users are advised to upgrade to these updated sssd packages, which
  upgrade SSSD to upstream version 1.5.1 to correct this issue, and fix the
  bugs and add the enhancements noted in the Technical Notes.";

tag_affected = "sssd on Red Hat Enterprise Linux (v. 5 server)";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-July/msg00020.html");
  script_id(870456);
  script_version("$Revision: 6685 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-12 11:44:46 +0200 (Wed, 12 Jul 2017) $");
  script_tag(name:"creation_date", value:"2011-07-22 14:44:51 +0200 (Fri, 22 Jul 2011)");
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name: "RHSA", value: "2011:0975-01");
  script_cve_id("CVE-2010-4341");
  script_name("RedHat Update for sssd RHSA-2011:0975-01");

  script_summary("Check for the Version of sssd");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
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

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"sssd", rpm:"sssd~1.5.1~37.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"sssd-client", rpm:"sssd-client~1.5.1~37.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"sssd-debuginfo", rpm:"sssd-debuginfo~1.5.1~37.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"sssd-tools", rpm:"sssd-tools~1.5.1~37.el5", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
