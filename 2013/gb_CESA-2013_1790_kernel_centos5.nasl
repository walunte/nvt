###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for kernel CESA-2013:1790 centos5 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_id(881835);
  script_version("$Revision: 6655 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:48:58 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-12-17 11:56:43 +0530 (Tue, 17 Dec 2013)");
  script_cve_id("CVE-2013-4355");
  script_tag(name:"cvss_base", value:"1.5");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:S/C:P/I:N/A:N");
  script_name("CentOS Update for kernel CESA-2013:1790 centos5 ");

  tag_insight = "The kernel packages contain the Linux kernel, the core of any Linux
operating system.

* An information leak flaw was found in the way the Xen hypervisor handled
error conditions when reading guest memory during certain guest-originated
operations, such as port or memory mapped I/O writes. A privileged user in
a fully-virtualized guest could use this flaw to leak hypervisor stack
memory to a guest. (CVE-2013-4355, Moderate)

Red Hat would like to thank the Xen project for reporting this issue.

This update also fixes the following bugs:

* A previous fix to the kernel did not contain a memory barrier in the
percpu_up_write() function. Consequently, under certain circumstances, a
race condition could occur leading to memory corruption and a subsequent
kernel panic. This update introduces a new memory barrier pair, light_mb()
and heavy_mb(), for per-CPU basis read and write semaphores
(percpu-rw-semaphores) ensuring that the race condition can no longer
occur. In addition, the read path performance of 'percpu-rw-semaphores' has
been improved. (BZ#1014715)

* Due to a bug in the tg3 driver, systems that had the Wake-on-LAN (WOL)
feature enabled on their NICs could not have been woken up from suspension
or hibernation using WOL. A missing pci_wake_from_d3() function call has
been added to the tg3 driver, which ensures that WOL functions properly by
setting the PME_ENABLE bit. (BZ#1014973)

* Due to an incorrect test condition in the mpt2sas driver, the driver was
unable to catch failures to map a SCSI scatter-gather list. The test
condition has been corrected so that the mpt2sas driver now handles SCSI
scatter-gather mapping failures as expected. (BZ#1018458)

* A previous patch to the kernel introduced the 'VLAN tag re-insertion'
workaround to resolve a problem with incorrectly handled VLAN-tagged
packets with no assigned VLAN group while the be2net driver was in
promiscuous mode. However, this solution led to packet corruption and a
subsequent kernel oops if such a processed packed was a GRO packet.
Therefore, a patch has been applied to restrict VLAN tag re-insertion only
to non-GRO packets. The be2net driver now processes VLAN-tagged packets
with no assigned VLAN group correctly in this situation. (BZ#1023348)

All kernel users are advised to upgrade to these updated packages, which
contain backported patches to correct these issues. The system must be
rebooted for this update to take effect.
";

  tag_affected = "kernel on CentOS 5";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "CESA", value: "2013:1790");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2013-December/020048.html");
  script_summary("Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.18~371.3.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.18~371.3.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.18~371.3.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~2.6.18~371.3.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.18~371.3.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~2.6.18~371.3.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-PAE", rpm:"kernel-PAE~2.6.18~371.3.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-PAE-devel", rpm:"kernel-PAE-devel~2.6.18~371.3.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen", rpm:"kernel-xen~2.6.18~371.3.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-devel", rpm:"kernel-xen-devel~2.6.18~371.3.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}