# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2013-164.nasl 6577 2017-07-06 13:43:46Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.120389");
script_version("$Revision: 6577 $");
script_tag(name:"creation_date", value:"2015-09-08 13:25:14 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:43:46 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: ALAS-2013-164");
script_tag(name: "insight", value: "Apache Axis did not verify that the server hostname matched the domain name in the subject's Common Name (CN) or subjectAltName field in X.509 certificates. This could allow a man-in-the-middle attacker to spoof an SSL server if they had a certificate that was valid for any domain name. (CVE-2012-5784 )"); 
script_tag(name : "solution", value : "Run yum update axis to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2013-164.html");
script_cve_id("CVE-2012-5784");
script_tag(name:"cvss_base", value:"5.8");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
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
if ((res = isrpmvuln(pkg:"axis-manual", rpm:"axis-manual~1.2.1~7.3.11.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"axis", rpm:"axis~1.2.1~7.3.11.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"axis-javadoc", rpm:"axis-javadoc~1.2.1~7.3.11.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"axis", rpm:"axis~1.2.1~7.3.11.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
