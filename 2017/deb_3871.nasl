# OpenVAS Vulnerability Test
# $Id: deb_3871.nasl 6607 2017-07-07 12:04:25Z cfischer $
# Auto-generated from advisory DSA 3871-1 using nvtgen 1.0
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
    script_id(703871);
    script_version("$Revision: 6607 $");
    script_cve_id("CVE-2017-5637");
    script_name("Debian Security Advisory DSA 3871-1 (zookeeper - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-07-07 14:04:25 +0200 (Fri, 07 Jul 2017) $");
    script_tag(name: "creation_date", value: "2017-06-01 00:00:00 +0200 (Thu, 01 Jun 2017)");
    script_tag(name: "cvss_base", value: "10.0");
    script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3871.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "zookeeper on Debian Linux");
        script_tag(name: "insight",   value: "ZooKeeper is a centralized, reliable, service for maintaining configuration
information, naming, providing distributed synchronization, and group
services. All of these kinds of services are used in some form or another by
distributed applications.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), this problem has been fixed in
version 3.4.5+dfsg-2+deb8u2.

For the unstable distribution (sid), this problem will be fixed soon.

We recommend that you upgrade your zookeeper packages.");
    script_tag(name: "summary",   value: "It was discovered that Zookeeper, a service for maintaining
configuration information, didn't restrict access to the computationally
expensive wchp/wchc commands which could result in denial of service by
elevated CPU consumption.

This update disables those two commands by default. The new
configuration option 4lw.commands.whitelist 
can be used to whitelist
commands selectively (and the full set of commands can be restored
with '*')");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libzookeeper-java", ver:"3.4.5+dfsg-2+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libzookeeper-java-doc", ver:"3.4.5+dfsg-2+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libzookeeper-mt-dev", ver:"3.4.5+dfsg-2+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libzookeeper-mt2", ver:"3.4.5+dfsg-2+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libzookeeper-st-dev", ver:"3.4.5+dfsg-2+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libzookeeper-st2", ver:"3.4.5+dfsg-2+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libzookeeper2", ver:"3.4.5+dfsg-2+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-zookeeper", ver:"3.4.5+dfsg-2+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"zookeeper", ver:"3.4.5+dfsg-2+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"zookeeper-bin", ver:"3.4.5+dfsg-2+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"zookeeperd", ver:"3.4.5+dfsg-2+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
