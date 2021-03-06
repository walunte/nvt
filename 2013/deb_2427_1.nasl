# OpenVAS Vulnerability Test
# $Id: deb_2427_1.nasl 6611 2017-07-07 12:07:20Z cfischer $
# Auto-generated from advisory DSA 2427-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net
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

include("revisions-lib.inc");

tag_affected  = "imagemagick on Debian Linux";
tag_insight   = "ImageMagick is a software suite to create, edit, and compose bitmap images.
It can read, convert and write images in a variety of formats (over 100)
including DPX, EXR, GIF, JPEG, JPEG-2000, PDF, PhotoCD, PNG, Postscript,
SVG, and TIFF. Use ImageMagick to translate, flip, mirror, rotate, scale,
shear and transform images, adjust image colors, apply various special
effects, or draw text, lines, polygons, ellipses and Bzier curves.
All manipulations can be achieved through shell commands as well as through
an X11 graphical interface (display).";
tag_solution  = "For the stable distribution (squeeze), these problems have been fixed
in version 8:6.6.0.4-3+squeeze1.

For the testing distribution (wheezy) and the unstable distribution
(sid), these problems have been fixed in version 8:6.6.9.7-6.

We recommend that you upgrade your imagemagick packages.";
tag_summary   = "Two security vulnerabilities related to EXIF processing were
discovered in ImageMagick, a suite of programs to manipulate images.

CVE-2012-0247When parsing a maliciously crafted image with incorrect offset
and count in the ResolutionUnit tag in EXIF IFD0, ImageMagick
writes two bytes to an invalid address.

CVE-2012-0248Parsing a maliciously crafted image with an IFD whose all IOP
tags value offsets point to the beginning of the IFD itself
results in an endless loop and a denial of service.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_id(892427);
    script_version("$Revision: 6611 $");
    script_cve_id("CVE-2012-0248", "CVE-2012-0247");
    script_name("Debian Security Advisory DSA 2427-1 (imagemagick - several vulnerabilities)");
    script_tag(name: "last_modification", value:"$Date: 2017-07-07 14:07:20 +0200 (Fri, 07 Jul 2017) $");
    script_tag(name:"creation_date", value:"2013-09-18 11:53:02 +0200 (Wed, 18 Sep 2013)");
    script_tag(name: "cvss_base", value:"9.3");
    script_tag(name: "cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");

    script_xref(name: "URL", value: "http://www.debian.org/security/2012/dsa-2427.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: tag_affected);
    script_tag(name: "insight",   value: tag_insight);
#    script_tag(name: "impact",    value: tag_impact);
    script_tag(name: "solution",  value: tag_solution);
    script_tag(name: "summary",   value: tag_summary);
    script_tag(name: "vuldetect", value: tag_vuldetect);
    script_tag(name:"qod_type", value:"package");
    script_tag(name:"solution_type", value:"VendorFix");

    exit(0);
}

include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"imagemagick", ver:"8:6.6.0.4-3+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"imagemagick-dbg", ver:"8:6.6.0.4-3+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"imagemagick-doc", ver:"8:6.6.0.4-3+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagick++-dev", ver:"8:6.6.0.4-3+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagick++3", ver:"8:6.6.0.4-3+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickcore-dev", ver:"8:6.6.0.4-3+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickcore3", ver:"8:6.6.0.4-3+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickcore3-extra", ver:"8:6.6.0.4-3+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickwand-dev", ver:"8:6.6.0.4-3+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickwand3", ver:"8:6.6.0.4-3+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"perlmagick", ver:"8:6.6.0.4-3+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"imagemagick", ver:"8:6.6.9.7-6", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"imagemagick-common", ver:"8:6.6.9.7-6", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"imagemagick-dbg", ver:"8:6.6.9.7-6", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"imagemagick-doc", ver:"8:6.6.9.7-6", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagick++-dev", ver:"8:6.6.9.7-6", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagick++5", ver:"8:6.6.9.7-6", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickcore-dev", ver:"8:6.6.9.7-6", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickcore5", ver:"8:6.6.9.7-6", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickcore5-extra", ver:"8:6.6.9.7-6", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickwand-dev", ver:"8:6.6.9.7-6", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickwand5", ver:"8:6.6.9.7-6", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"perlmagick", ver:"8:6.6.9.7-6", rls:"DEB7.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
