###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for xen CESA-2012:1236 centos5 
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
tag_insight = "The xen packages contain administration tools and the xend service for
  managing the kernel-xen kernel for virtualization on Red Hat Enterprise
  Linux.

  A flaw was found in the way QEMU handled VT100 terminal escape sequences
  when emulating certain character devices. A guest user with privileges to
  write to a character device that is emulated on the host using a virtual
  console back-end could use this flaw to crash the qemu process on the
  host or, possibly, escalate their privileges on the host. (CVE-2012-3515)
  
  This flaw did not affect the default use of the Xen hypervisor
  implementation in Red Hat Enterprise Linux 5. This problem only affected
  fully-virtualized guests that have a serial or parallel device that uses a
  virtual console (vc) back-end. By default, the virtual console back-end is
  not used for such devices; only guests explicitly configured to use them
  in this way were affected.
  
  Red Hat would like to thank the Xen project for reporting this issue.
  
  All users of xen are advised to upgrade to these updated packages, which
  correct this issue. After installing the updated packages, all
  fully-virtualized guests must be restarted for this update to take effect.";

tag_affected = "xen on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2012-September/018846.html");
  script_id(881485);
  script_version("$Revision: 6654 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:48:17 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-09-07 11:26:04 +0530 (Fri, 07 Sep 2012)");
  script_cve_id("CVE-2012-3515");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2012:1236");
  script_name("CentOS Update for xen CESA-2012:1236 centos5 ");

  script_summary("Check for the Version of xen");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"xen", rpm:"xen~3.0.3~135.el5_8.5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-devel", rpm:"xen-devel~3.0.3~135.el5_8.5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs", rpm:"xen-libs~3.0.3~135.el5_8.5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
