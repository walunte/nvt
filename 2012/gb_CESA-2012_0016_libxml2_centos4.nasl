###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for libxml2 CESA-2012:0016 centos4 
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
tag_insight = "The libxml2 library is a development toolbox providing the implementation
  of various XML standards. One of those standards is the XML Path Language
  (XPath), which is a language for addressing parts of an XML document.

  A heap-based buffer overflow flaw was found in the way libxml2 decoded
  entity references with long names. A remote attacker could provide a
  specially-crafted XML file that, when opened in an application linked
  against libxml2, would cause the application to crash or, potentially,
  execute arbitrary code with the privileges of the user running the
  application. (CVE-2011-3919)
  
  An off-by-one error, leading to a heap-based buffer overflow, was found in
  the way libxml2 parsed certain XML files. A remote attacker could provide a
  specially-crafted XML file that, when opened in an application linked
  against libxml2, would cause the application to crash or, potentially,
  execute arbitrary code with the privileges of the user running the
  application. (CVE-2011-0216)
  
  A flaw was found in the way libxml2 parsed certain XPath expressions. If an
  attacker were able to supply a specially-crafted XML file to an application
  using libxml2, as well as an XPath expression for that application to run
  against the crafted file, it could cause the application to crash.
  (CVE-2011-2834)
  
  Note: Red Hat does not ship any applications that use libxml2 in a way that
  would allow the CVE-2011-2834 flaw to be exploited; however, third-party
  applications may allow XPath expressions to be passed which could trigger
  this flaw.
  
  An out-of-bounds memory read flaw was found in libxml2. A remote attacker
  could provide a specially-crafted XML file that, when opened in an
  application linked against libxml2, would cause the application to crash.
  (CVE-2011-3905)
  
  All users of libxml2 are advised to upgrade to these updated packages,
  which contain backported patches to correct these issues. The desktop must
  be restarted (log out, then log back in) for this update to take effect.";

tag_affected = "libxml2 on CentOS 4";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2012-January/018369.html");
  script_id(881090);
  script_version("$Revision: 6654 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:48:17 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-07-30 16:05:28 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2011-0216", "CVE-2011-2834", "CVE-2011-3905", "CVE-2011-3919");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2012:0016");
  script_name("CentOS Update for libxml2 CESA-2012:0016 centos4 ");

  script_summary("Check for the Version of libxml2");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

if(release == "CentOS4")
{

  if ((res = isrpmvuln(pkg:"libxml2", rpm:"libxml2~2.6.16~12.9", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxml2-devel", rpm:"libxml2-devel~2.6.16~12.9", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxml2-python", rpm:"libxml2-python~2.6.16~12.9", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
