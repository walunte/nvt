###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for 389-ds-base CESA-2012:0997 centos6 
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
tag_insight = "The 389 Directory Server is an LDAPv3 compliant server. The base packages
  include the Lightweight Directory Access Protocol (LDAP) server and
  command-line utilities for server administration.

  A flaw was found in the way 389 Directory Server handled password changes.
  If an LDAP user has changed their password, and the directory server has
  not been restarted since that change, an attacker able to bind to the
  directory server could obtain the plain text version of that user's
  password via the &quot;unhashed#user#password&quot; attribute. (CVE-2012-2678)
  
  It was found that when the password for an LDAP user was changed, and audit
  logging was enabled (it is disabled by default), the new password was
  written to the audit log in plain text form. This update introduces a new
  configuration parameter, &quot;nsslapd-auditlog-logging-hide-unhashed-pw&quot;, which
  when set to &quot;on&quot; (the default option), prevents 389 Directory Server from
  writing plain text passwords to the audit log. This option can be
  configured in &quot;/etc/dirsrv/slapd-[ID]/dse.ldif&quot;. (CVE-2012-2746)
  
  All users of 389-ds-base are advised to upgrade to these updated packages,
  which resolve these issues. After installing this update, the 389 server
  service will be restarted automatically.";

tag_affected = "389-ds-base on CentOS 6";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2012-July/018726.html");
  script_id(881214);
  script_version("$Revision: 6654 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:48:17 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-07-30 16:47:54 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2012-2678", "CVE-2012-2746");
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:S/C:P/I:N/A:N");
  script_xref(name: "CESA", value: "2012:0997");
  script_name("CentOS Update for 389-ds-base CESA-2012:0997 centos6 ");

  script_summary("Check for the Version of 389-ds-base");
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

  if ((res = isrpmvuln(pkg:"389-ds-base", rpm:"389-ds-base~1.2.10.2~18.el6_3", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"389-ds-base-devel", rpm:"389-ds-base-devel~1.2.10.2~18.el6_3", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"389-ds-base-libs", rpm:"389-ds-base-libs~1.2.10.2~18.el6_3", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
