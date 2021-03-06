# OpenVAS Vulnerability Test
# $Id: deb_3435.nasl 6608 2017-07-07 12:05:05Z cfischer $
# Auto-generated from advisory DSA 3435-1 using nvtgen 1.0
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
    script_id(703435);
    script_version("$Revision: 6608 $");
    script_cve_id("CVE-2015-7545");
    script_name("Debian Security Advisory DSA 3435-1 (git - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-07-07 14:05:05 +0200 (Fri, 07 Jul 2017) $");
    script_tag(name: "creation_date", value: "2016-01-05 00:00:00 +0100 (Tue, 05 Jan 2016)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3435.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "git on Debian Linux");
    script_tag(name: "insight",   value: "Git is popular version control system
designed to handle very large projects with speed and efficiency; it is used for
many high profile open source projects, most notably the Linux kernel.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy),
this problem has been fixed in version 1:1.7.10.4-1+wheezy2.

For the stable distribution (jessie), this problem has been fixed in
version 1:2.1.4-2.1+deb8u1.

For the testing distribution (stretch), this problem has been fixed
in version 1:2.6.1-1.

For the unstable distribution (sid), this problem has been fixed in
version 1:2.6.1-1.

We recommend that you upgrade your git packages.");
    script_tag(name: "summary",   value: "Blake Burkhart discovered that
the Git git-remote-ext helper incorrectly handled recursive clones of git
repositories. A remote attacker could possibly use this issue to execute
arbitrary code by injecting commands via crafted URLs.");
    script_tag(name: "vuldetect", value: "This check tests the installed
software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"git", ver:"1:1.7.10.4-1+wheezy2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-all", ver:"1:1.7.10.4-1+wheezy2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-arch", ver:"1:1.7.10.4-1+wheezy2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-core", ver:"1:1.7.10.4-1+wheezy2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-cvs", ver:"1:1.7.10.4-1+wheezy2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-daemon-run", ver:"1:1.7.10.4-1+wheezy2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-daemon-sysvinit", ver:"1:1.7.10.4-1+wheezy2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-doc", ver:"1:1.7.10.4-1+wheezy2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-el", ver:"1:1.7.10.4-1+wheezy2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-email", ver:"1:1.7.10.4-1+wheezy2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-gui", ver:"1:1.7.10.4-1+wheezy2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-man", ver:"1:1.7.10.4-1+wheezy2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-svn", ver:"1:1.7.10.4-1+wheezy2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gitk", ver:"1:1.7.10.4-1+wheezy2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gitweb", ver:"1:1.7.10.4-1+wheezy2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git", ver:"1:2.6.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-all", ver:"1:2.6.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-arch", ver:"1:2.6.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-core", ver:"1:2.6.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-cvs", ver:"1:2.6.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-daemon-run", ver:"1:2.6.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-daemon-sysvinit", ver:"1:2.6.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-doc", ver:"1:2.6.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-el", ver:"1:2.6.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-email", ver:"1:2.6.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-gui", ver:"1:2.6.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-man", ver:"1:2.6.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-mediawiki", ver:"1:2.6.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-svn", ver:"1:2.6.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gitk", ver:"1:2.6.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gitweb", ver:"1:2.6.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git", ver:"1:2.1.4-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-all", ver:"1:2.1.4-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-arch", ver:"1:2.1.4-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-core", ver:"1:2.1.4-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-cvs", ver:"1:2.1.4-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-daemon-run", ver:"1:2.1.4-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-daemon-sysvinit", ver:"1:2.1.4-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-doc", ver:"1:2.1.4-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-el", ver:"1:2.1.4-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-email", ver:"1:2.1.4-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-gui", ver:"1:2.1.4-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-man", ver:"1:2.1.4-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-mediawiki", ver:"1:2.1.4-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"git-svn", ver:"1:2.1.4-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gitk", ver:"1:2.1.4-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gitweb", ver:"1:2.1.4-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
