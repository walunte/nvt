# OpenVAS Vulnerability Test
# $Id: deb_3101.nasl 6735 2017-07-17 09:56:49Z teissa $
# Auto-generated from advisory DSA 3101-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net
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
    script_id(703101);
    script_version("$Revision: 6735 $");
    script_cve_id("CVE-2013-7401", "CVE-2013-7402");
    script_name("Debian Security Advisory DSA 3101-1 (c-icap - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-07-17 11:56:49 +0200 (Mon, 17 Jul 2017) $");
    script_tag(name: "creation_date", value: "2014-12-13 00:00:00 +0100 (Sat, 13 Dec 2014)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
    script_tag(name: "solution_type", value: "VendorFix");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-3101.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "c-icap on Debian Linux");
    script_tag(name: "insight",   value: "C-ICAP is an implementation of an
ICAP server. It can be used with HTTP proxies that support the ICAP protocol to
implement content adaptation and filtering services.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
these problems have been fixed in version 1:0.1.6-1.1+deb7u1.

For the upcoming stable distribution (jessie), these problems have been
fixed in version 1:0.3.1-1.

For the unstable distribution (sid), these problems have been fixed in
version 1:0.3.1-1.

We recommend that you upgrade your c-icap packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities were found in
c-icap, an ICAP server implementation, which could allow a remote attacker to
cause c-icap to crash, or have other, unspecified impacts.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"c-icap", ver:"1:0.1.6-1.1+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libicapapi-dev", ver:"1:0.1.6-1.1+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libicapapi0", ver:"1:0.1.6-1.1+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libicapapi0-dbg", ver:"1:0.1.6-1.1+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
