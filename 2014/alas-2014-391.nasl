# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2014-391.nasl 6715 2017-07-13 09:57:40Z teissa $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.120249");
script_version("$Revision: 6715 $");
script_tag(name:"creation_date", value:"2015-09-08 13:21:23 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-13 11:57:40 +0200 (Thu, 13 Jul 2017) $");
script_name("Amazon Linux Local Check: ALAS-2014-391");
script_tag(name: "insight", value: "A flaw was discovered in the way OpenSSL handled DTLS packets. A remote attacker could use this flaw to cause a DTLS server or client using OpenSSL to crash or use excessive amounts of memory. Multiple buffer overflows in crypto/srp/srp_lib.c in the SRP implementation in OpenSSL 1.0.1 before 1.0.1i allow remote attackers to cause a denial of service (application crash) or possibly have unspecified other impact via an invalid SRP (1) g, (2) A, or (3) B parameter. A flaw was found in the way OpenSSL handled fragmented handshake packets. A man-in-the-middle attacker could use this flaw to force a TLS/SSL server using OpenSSL to use TLS 1.0, even if both the client and the server supported newer protocol versions. A NULL pointer dereference flaw was found in the way OpenSSL performed a handshake when using the anonymous Diffie-Hellman (DH) key exchange. A malicious server could cause a DTLS client using OpenSSL to crash if that client had anonymous DH cipher suites enabled. It was discovered that the OBJ_obj2txt() function could fail to properly NUL-terminate its output. This could possibly cause an application using OpenSSL functions to format fields of X.509 certificates to disclose portions of its memory. A race condition was found in the way OpenSSL handled ServerHello messages with an included Supported EC Point Format extension. A malicious server could possibly use this flaw to cause a multi-threaded TLS/SSL client using OpenSSL to write into freed memory, causing the client to crash or execute arbitrary code. The ssl_set_client_disabled function in t1_lib.c in OpenSSL 1.0.1 before 1.0.1i allows remote SSL servers to cause a denial of service (NULL pointer dereference and client application crash) via a ServerHello message that includes an SRP ciphersuite without the required negotiation of that ciphersuite with the client."); 
script_tag(name : "solution", value : "Run yum update openssl to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2014-391.html");
script_cve_id("CVE-2014-3505", "CVE-2014-3506", "CVE-2014-3507", "CVE-2014-3512", "CVE-2014-3511", "CVE-2014-3510", "CVE-2014-3508", "CVE-2014-3509", "CVE-2014-5139");
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
if ((res = isrpmvuln(pkg:"openssl-devel", rpm:"openssl-devel~1.0.1i~1.78.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"openssl-debuginfo", rpm:"openssl-debuginfo~1.0.1i~1.78.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"openssl-perl", rpm:"openssl-perl~1.0.1i~1.78.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"openssl", rpm:"openssl~1.0.1i~1.78.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"openssl-static", rpm:"openssl-static~1.0.1i~1.78.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
