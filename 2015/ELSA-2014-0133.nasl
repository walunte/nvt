# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2014-0133.nasl 6600 2017-07-07 09:58:31Z teissa $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123474");
script_version("$Revision: 6600 $");
script_tag(name:"creation_date", value:"2015-10-06 14:04:18 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-07 11:58:31 +0200 (Fri, 07 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2014-0133");
script_tag(name: "insight", value: "ELSA-2014-0133 -  thunderbird security update - [24.3.0-2.0.1.el6_5]- Replaced thunderbird-redhat-default-prefs.js with thunderbird-oracle-default-prefs.js- Make sure build with nspr-devel >= 4.10.0[24.3.0-2]- Update to 24.3.0 ESR Build 2[24.3.0-1]- Update to 24.3.0[24.2.0-2]- Fixed requested nspr/nss versions"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2014-0133");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2014-0133.html");
script_cve_id("CVE-2014-1477","CVE-2014-1479","CVE-2014-1481","CVE-2014-1482","CVE-2014-1486","CVE-2014-1487");
script_tag(name:"cvss_base", value:"10.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
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
  if ((res = isrpmvuln(pkg:"thunderbird", rpm:"thunderbird~24.3.0~2.0.1.el5_10", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"thunderbird", rpm:"thunderbird~24.3.0~2.0.1.el6_5", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

