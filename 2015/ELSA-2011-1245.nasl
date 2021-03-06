# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2011-1245.nasl 6556 2017-07-06 11:54:54Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.122095");
script_version("$Revision: 6556 $");
script_tag(name:"creation_date", value:"2015-10-06 14:12:59 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:54:54 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2011-1245");
script_tag(name: "insight", value: "ELSA-2011-1245 -  httpd security update - [2.2.15-9.0.1.el6_1.2]- replace index.html with Oracle's index page- update vstring in specfile[2.2.15-9.2,]- updated patch for CVE-2011-3192 from upstream (#733062)[2.2.15-9.1]- fix #733062 - backported CVE-2011-3192 fix from httpd trunk"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2011-1245");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2011-1245.html");
script_cve_id("CVE-2011-3192");
script_tag(name:"cvss_base", value:"7.8");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
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
if(release == "OracleLinux5")
{
  if ((res = isrpmvuln(pkg:"httpd", rpm:"httpd~2.2.3~53.0.1.el5_7.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"httpd-devel", rpm:"httpd-devel~2.2.3~53.0.1.el5_7.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"httpd-manual", rpm:"httpd-manual~2.2.3~53.0.1.el5_7.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"mod_ssl", rpm:"mod_ssl~2.2.3~53.0.1.el5_7.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"httpd", rpm:"httpd~2.2.15~9.0.1.el6_1.2", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"httpd-devel", rpm:"httpd-devel~2.2.15~9.0.1.el6_1.2", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"httpd-manual", rpm:"httpd-manual~2.2.15~9.0.1.el6_1.2", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"httpd-tools", rpm:"httpd-tools~2.2.15~9.0.1.el6_1.2", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"mod_ssl", rpm:"mod_ssl~2.2.15~9.0.1.el6_1.2", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

