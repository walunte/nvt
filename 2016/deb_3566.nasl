# OpenVAS Vulnerability Test
# $Id: deb_3566.nasl 6608 2017-07-07 12:05:05Z cfischer $
# Auto-generated from advisory DSA 3566-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#


if(description)
{
    script_id(703566);
    script_version("$Revision: 6608 $");
    script_cve_id("CVE-2016-2105", "CVE-2016-2106", "CVE-2016-2107", "CVE-2016-2108",
                  "CVE-2016-2109");
    script_name("Debian Security Advisory DSA 3566-1 (openssl - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-07-07 14:05:05 +0200 (Fri, 07 Jul 2017) $");
    script_tag(name: "creation_date", value: "2016-05-03 00:00:00 +0200 (Tue, 03 May 2016)");
    script_tag(name: "cvss_base", value: "10.0");
    script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3566.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "openssl on Debian Linux");
    script_tag(name: "insight",   value: "This package is part of the OpenSSL
project's implementation of the SSL and TLS cryptographic protocols for secure
communication over the Internet.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
these problems have been fixed in version 1.0.1k-3+deb8u5.

For the unstable distribution (sid), these problems have been fixed in
version 1.0.2h-1.

We recommend that you upgrade your openssl packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities were discovered
in OpenSSL, a Secure Socket Layer toolkit.

CVE-2016-2105 
Guido Vranken discovered that an overflow can occur in the function
EVP_EncodeUpdate(), used for Base64 encoding, if an attacker can
supply a large amount of data. This could lead to a heap corruption.

CVE-2016-2106 
Guido Vranken discovered that an overflow can occur in the function
EVP_EncryptUpdate() if an attacker can supply a large amount of data.
This could lead to a heap corruption.

CVE-2016-2107 
Juraj Somorovsky discovered a padding oracle in the AES CBC cipher
implementation based on the AES-NI instruction set. This could allow
an attacker to decrypt TLS traffic encrypted with one of the cipher
suites based on AES CBC.

CVE-2016-2108 
David Benjamin from Google discovered that two separate bugs in the
ASN.1 encoder, related to handling of negative zero integer values
and large universal tags, could lead to an out-of-bounds write.

CVE-2016-2109 
Brian Carpenter discovered that when ASN.1 data is read from a BIO
using functions such as d2i_CMS_bio(), a short invalid encoding can
cause allocation of large amounts of memory potentially consuming
excessive resources or exhausting memory.

Additional information about these issues can be found in the OpenSSL
security advisory at https://www.openssl.org/news/secadv/20160503.txt");
    script_tag(name: "vuldetect", value: "This check tests the installed
software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libcrypto1.0.0-udeb", ver:"1.0.1k-3+deb8u5", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libssl-dev:amd64", ver:"1.0.1k-3+deb8u5", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libssl-dev:i386", ver:"1.0.1k-3+deb8u5", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libssl-doc", ver:"1.0.1k-3+deb8u5", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libssl1.0.0:amd64", ver:"1.0.1k-3+deb8u5", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libssl1.0.0:i386", ver:"1.0.1k-3+deb8u5", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if ((res = isdpkgvuln(pkg:"libssl1.0.0-dbg:amd64", ver:"1.0.1k-3+deb8u5", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libssl1.0.0-dbg:i386", ver:"1.0.1k-3+deb8u5", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openssl", ver:"1.0.1k-3+deb8u5", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
