###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for struts RHSA-2014:0474-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_id(871164);
  script_version("$Revision: 6688 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-12 11:49:31 +0200 (Wed, 12 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-05-12 09:14:04 +0530 (Mon, 12 May 2014)");
  script_cve_id("CVE-2014-0114");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("RedHat Update for struts RHSA-2014:0474-01");

  tag_insight = "Apache Struts is a framework for building web applications with Java.

It was found that the Struts 1 ActionForm object allowed access to the
'class' parameter, which is directly mapped to the getClass() method. A
remote attacker could use this flaw to manipulate the ClassLoader used by
an application server running Struts 1. This could lead to remote code
execution under certain conditions. (CVE-2014-0114)

All struts users are advised to upgrade to these updated packages, which
contain a backported patch to correct this issue. All running applications
using struts must be restarted for this update to take effect.
";

  tag_affected = "struts on Red Hat Enterprise Linux (v. 5 server)";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "RHSA", value: "2014:0474-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2014-May/msg00005.html");
  script_summary("Check for the Version of struts");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
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

  if ((res = isrpmvuln(pkg:"struts", rpm:"struts~1.2.9~4jpp.8.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"struts-debuginfo", rpm:"struts-debuginfo~1.2.9~4jpp.8.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"struts-javadoc", rpm:"struts-javadoc~1.2.9~4jpp.8.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"struts-manual", rpm:"struts-manual~1.2.9~4jpp.8.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"struts-webapps-tomcat5", rpm:"struts-webapps-tomcat5~1.2.9~4jpp.8.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
