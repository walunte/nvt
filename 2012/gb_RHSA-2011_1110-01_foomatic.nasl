###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for foomatic RHSA-2011:1110-01
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
tag_insight = "Foomatic is a comprehensive, spooler-independent database of printers,
  printer drivers, and driver descriptions. The package also includes
  spooler-independent command line interfaces to manipulate queues and to
  print files and manipulate print jobs. foomatic-rip is a print filter
  written in C.

  An input sanitization flaw was found in the foomatic-rip print filter. An
  attacker could submit a print job with the username, title, or job options
  set to appear as a command line option that caused the filter to use a
  specified PostScript printer description (PPD) file, rather than the
  administrator-set one. This could lead to arbitrary code execution with the
  privileges of the &quot;lp&quot; user. (CVE-2011-2964)

  All foomatic users should upgrade to this updated package, which contains
  a backported patch to resolve this issue.";

tag_affected = "foomatic on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-August/msg00001.html");
  script_id(870742);
  script_version("$Revision: 6686 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-12 11:46:01 +0200 (Wed, 12 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-07-09 10:59:27 +0530 (Mon, 09 Jul 2012)");
  script_cve_id("CVE-2011-2964");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "RHSA", value: "2011:1110-01");
  script_name("RedHat Update for foomatic RHSA-2011:1110-01");

  script_summary("Check for the Version of foomatic");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
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

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"foomatic", rpm:"foomatic~4.0.4~1.el6_1.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"foomatic-debuginfo", rpm:"foomatic-debuginfo~4.0.4~1.el6_1.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
