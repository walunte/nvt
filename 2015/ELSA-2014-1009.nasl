# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2014-1009.nasl 6559 2017-07-06 11:57:32Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.com> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.123343");
script_version("$Revision: 6559 $");
script_tag(name:"creation_date", value:"2015-10-06 14:02:32 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:57:32 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2014-1009");
script_tag(name: "insight", value: "ELSA-2014-1009 -  samba4 security update - [4.0.0-63.rc4]- resolves: #1126011 - CVE-2014-3560: remote code execution in nmbd.[4.0.0-62.rc4]- resolves: #1105501 - CVE-2014-0244: DoS in nmbd.- resolves: #1108842 - CVE-2014-3493: DoS in smbd with unicode path names.- resolves: #1105571 - CVE-2014-0178: Uninitialized memory exposure."); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2014-1009");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2014-1009.html");
script_cve_id("CVE-2014-3560");
script_tag(name:"cvss_base", value:"7.9");
script_tag(name:"cvss_base_vector", value:"AV:A/AC:M/Au:N/C:C/I:C/A:C");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_copyright("Eero Volotinen");
script_family("Oracle Linux Local Security Checks");
exit(0);
}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");
release = get_kb_item("ssh/login/release");
res = "";
if(release == NULL)
{
 exit(0);
}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"samba4", rpm:"samba4~4.0.0~63.el6_5.rc4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba4-client", rpm:"samba4-client~4.0.0~63.el6_5.rc4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba4-common", rpm:"samba4-common~4.0.0~63.el6_5.rc4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba4-dc", rpm:"samba4-dc~4.0.0~63.el6_5.rc4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba4-dc-libs", rpm:"samba4-dc-libs~4.0.0~63.el6_5.rc4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba4-devel", rpm:"samba4-devel~4.0.0~63.el6_5.rc4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba4-libs", rpm:"samba4-libs~4.0.0~63.el6_5.rc4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba4-pidl", rpm:"samba4-pidl~4.0.0~63.el6_5.rc4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba4-python", rpm:"samba4-python~4.0.0~63.el6_5.rc4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba4-swat", rpm:"samba4-swat~4.0.0~63.el6_5.rc4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba4-test", rpm:"samba4-test~4.0.0~63.el6_5.rc4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba4-winbind", rpm:"samba4-winbind~4.0.0~63.el6_5.rc4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba4-winbind-clients", rpm:"samba4-winbind-clients~4.0.0~63.el6_5.rc4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"samba4-winbind-krb5-locator", rpm:"samba4-winbind-krb5-locator~4.0.0~63.el6_5.rc4", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

