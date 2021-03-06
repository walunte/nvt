# OpenVAS Vulnerability Test
# $Id: deb_3907.nasl 6906 2017-08-11 13:21:18Z cfischer $
# Auto-generated from advisory DSA 3907-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
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
    script_id(703907);
    script_version("$Revision: 6906 $");
    script_cve_id("CVE-2017-7506");
    script_name("Debian Security Advisory DSA 3907-1 (spice - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-08-11 15:21:18 +0200 (Fri, 11 Aug 2017) $");
    script_tag(name: "creation_date", value: "2017-07-11 00:00:00 +0200 (Tue, 11 Jul 2017)");
    script_tag(name:"cvss_base", value:"6.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3907.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "spice on Debian Linux");
    script_tag(name: "solution",  value: "For the oldstable distribution (jessie), this problem has been fixed
in version 0.12.5-1+deb8u5.

For the stable distribution (stretch), this problem has been fixed in
version 0.12.8-2.1+deb9u1.

For the unstable distribution (sid), this problem will be fixed soon.

We recommend that you upgrade your spice packages.");
    script_tag(name: "summary",   value: "Frediano Ziglio discovered a buffer overflow in spice, a SPICE protocol
client and server library which may result in memory disclosure, denial
of service and potentially the execution of arbitrary code.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libspice-server-dev", ver:"0.12.8-2.1+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libspice-server1", ver:"0.12.8-2.1+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libspice-server-dev", ver:"0.12.5-1+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libspice-server1", ver:"0.12.5-1+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libspice-server1-dbg", ver:"0.12.5-1+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"spice-client", ver:"0.12.5-1+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
