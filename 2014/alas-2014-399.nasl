# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2014-399.nasl 6663 2017-07-11 09:58:05Z teissa $
 
# Authors: 
# Eero Volotinen <eero.volotinen@iki.fi> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://ping-viini.org 
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
script_oid("1.3.6.1.4.1.25623.1.0.120241");
script_version("$Revision: 6663 $");
script_tag(name:"creation_date", value:"2015-09-08 13:21:13 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-11 11:58:05 +0200 (Tue, 11 Jul 2017) $");
script_name("Amazon Linux Local Check: ALAS-2014-399");
script_tag(name: "insight", value: "An off-by-one heap-based buffer overflow flaw was found in glibc's internal __gconv_translit_find() function. An attacker able to make an application call the iconv_open() function with a specially crafted argument could possibly use this flaw to execute arbitrary code with the privileges of that application."); 
script_tag(name : "solution", value : "Run yum update glibc to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2014-399.html");
script_cve_id("CVE-2014-5119");
script_tag(name:"cvss_base", value:"7.5");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
script_copyright("Eero Volotinen");
script_family("Amazon Linux Local Security Checks");
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
if(release == "AMAZON")
{
if ((res = isrpmvuln(pkg:"glibc-devel", rpm:"glibc-devel~2.17~55.85.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"glibc", rpm:"glibc~2.17~55.85.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"glibc-utils", rpm:"glibc-utils~2.17~55.85.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"nscd", rpm:"nscd~2.17~55.85.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"glibc-headers", rpm:"glibc-headers~2.17~55.85.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"glibc-debuginfo-common", rpm:"glibc-debuginfo-common~2.17~55.85.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"glibc-static", rpm:"glibc-static~2.17~55.85.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"glibc-common", rpm:"glibc-common~2.17~55.85.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"glibc-debuginfo", rpm:"glibc-debuginfo~2.17~55.85.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
