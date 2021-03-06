###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for kernel CESA-2012:0052 centos6 
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
tag_insight = "The kernel packages contain the Linux kernel, the core of any Linux
  operating system.

  This update fixes the following security issue:
  
  * It was found that permissions were not checked properly in the Linux
  kernel when handling the /proc/[pid]/mem writing functionality. A local,
  unprivileged user could use this flaw to escalate their privileges. Refer
  to Red Hat Knowledgebase article DOC-69129, linked to in the References,
  for further information. (CVE-2012-0056, Important)
  
  Red Hat would like to thank J�ri Aedla for reporting this issue.
  
  This update fixes the following bugs:
  
  * The RHSA-2011:1849 kernel update introduced a bug in the Linux kernel
  scheduler, causing a &quot;WARNING: at kernel/sched.c:5915 thread_return&quot;
  message and a call trace to be logged. This message was harmless, and was
  not due to any system malfunctions or adverse behavior. With this update,
  the WARN_ON_ONCE() call in the scheduler that caused this harmless message
  has been removed. (BZ#768288)
  
  * The RHSA-2011:1530 kernel update introduced a regression in the way
  the Linux kernel maps ELF headers for kernel modules into kernel memory.
  If a third-party kernel module is compiled on a Red Hat Enterprise Linux
  system with a kernel prior to RHSA-2011:1530, then loading that module on
  a system with RHSA-2011:1530 kernel would result in corruption of one byte
  in the memory reserved for the module. In some cases, this could prevent
  the module from functioning correctly. (BZ#769595)
  
  * On some SMP systems the tsc may erroneously be marked as unstable during
  early system boot or while the system is under heavy load. A &quot;Clocksource
  tsc unstable&quot; message was logged when this occurred. As a result the system
  would switch to the slower access, but higher precision HPET clock.
  
  The &quot;tsc=reliable&quot; kernel parameter is supposed to avoid this problem by
  indicating that the system has a known good clock, however, the parameter
  only affected run time checks.  A fix has been put in to avoid the boot
  time checks so that the TSC remains as the clock for the duration of
  system runtime. (BZ#755867)
  
  Users should upgrade to these updated packages, which contain backported
  patches to correct these issues. The system must be rebooted for this
  update to take effect.";

tag_affected = "kernel on CentOS 6";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2012-January/018384.html");
  script_id(881102);
  script_version("$Revision: 6654 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:48:17 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-07-30 16:08:56 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2012-0056");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2012:0052");
  script_name("CentOS Update for kernel CESA-2012:0052 centos6 ");

  script_summary("Check for the Version of kernel");
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

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.32~220.4.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.32~220.4.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.32~220.4.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~2.6.32~220.4.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.32~220.4.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-firmware", rpm:"kernel-firmware~2.6.32~220.4.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~2.6.32~220.4.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perf", rpm:"perf~2.6.32~220.4.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-perf", rpm:"python-perf~2.6.32~220.4.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
