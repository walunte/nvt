###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for kdelibs RHSA-2011:0464-01
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
tag_insight = "The kdelibs packages provide libraries for the K Desktop Environment (KDE).

  A cross-site scripting (XSS) flaw was found in the way KHTML, the HTML
  layout engine used by KDE applications such as the Konqueror web browser,
  displayed certain error pages. A remote attacker could use this flaw to
  perform a cross-site scripting attack against victims by tricking them into
  visiting a specially-crafted URL. (CVE-2011-1168)

  A flaw was found in the way kdelibs checked the user specified hostname
  against the name in the server's SSL certificate. A man-in-the-middle
  attacker could use this flaw to trick an application using kdelibs into
  mistakenly accepting a certificate as if it was valid for the host, if that
  certificate was issued for an IP address to which the user specified
  hostname was resolved to. (CVE-2011-1094)

  Note: As part of the fix for CVE-2011-1094, this update also introduces
  stricter handling for wildcards used in servers' SSL certificates.

  Users should upgrade to these updated packages, which contain backported
  patches to correct these issues. The desktop must be restarted (log out,
  then log back in) for this update to take effect.";

tag_affected = "kdelibs on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-April/msg00023.html");
  script_id(870612);
  script_version("$Revision: 6686 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-12 11:46:01 +0200 (Wed, 12 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-06-06 10:34:01 +0530 (Wed, 06 Jun 2012)");
  script_cve_id("CVE-2011-1094", "CVE-2011-1168");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_xref(name: "RHSA", value: "2011:0464-01");
  script_name("RedHat Update for kdelibs RHSA-2011:0464-01");

  script_summary("Check for the Version of kdelibs");
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

  if ((res = isrpmvuln(pkg:"kdelibs", rpm:"kdelibs~4.3.4~11.el6_0.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kdelibs-common", rpm:"kdelibs-common~4.3.4~11.el6_0.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kdelibs-debuginfo", rpm:"kdelibs-debuginfo~4.3.4~11.el6_0.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kdelibs-devel", rpm:"kdelibs-devel~4.3.4~11.el6_0.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kdelibs-apidocs", rpm:"kdelibs-apidocs~4.3.4~11.el6_0.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
