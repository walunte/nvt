# OpenVAS Vulnerability Test
# $Id: deb_2245_1.nasl 6613 2017-07-07 12:08:40Z cfischer $
# Description: Auto-generated from advisory DSA 2245-1 (chromium-browser)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# or at your option, GNU General Public License version 3,
# as published by the Free Software Foundation
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
tag_insight = "Several vulnerabilities were discovered in the Chromium browser.
The Common Vulnerabilities and Exposures project identifies the
following problems:


CVE-2011-1292

Use-after-free vulnerability in the frame-loader implementation in Google
Chrome allows remote attackers to cause a denial of service or possibly
have unspecified other impact via unknown vectors.


CVE-2011-1293

Use-after-free vulnerability in the HTMLCollection implementation in Google
Chrome allows remote attackers to cause a denial of service or possibly have
unspecified other impact via unknown vectors.


CVE-2011-1440

Use-after-free vulnerability in Google Chrome allows remote attackers to cause
a denial of service or possibly have unspecified other impact via vectors
related to the ruby element and Cascading Style Sheets (CSS) token sequences.


CVE-2011-1444

Race condition in the sandbox launcher implementation in Google Chrome on
Linux allows remote attackers to cause a denial of service or possibly have
unspecified other impact via unknown vectors.


CVE-2011-1797

Google Chrome does not properly render tables, which allows remote attackers
to cause a denial of service or possibly have unspecified other impact via
unknown vectors that lead to a stale pointer.


CVE-2011-1799

Google Chrome does not properly perform casts of variables during interaction
with the WebKit engine, which allows remote attackers to cause a denial of
service or possibly have unspecified other impact via unknown vectors.



For the stable distribution (squeeze), these problems have been fixed in
version 6.0.472.63~r59945-5+squeeze5.

For the testing distribution (wheezy), these problems will be fixed soon.

For the unstable distribution (sid), these problems have been fixed in
version 11.0.696.68~r84545-1.

We recommend that you upgrade your chromium-browser packages.";
tag_summary = "The remote host is missing an update to chromium-browser
announced via advisory DSA 2245-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202245-1";


if(description)
{
 script_id(69744);
 script_version("$Revision: 6613 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 14:08:40 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2011-08-03 04:36:20 +0200 (Wed, 03 Aug 2011)");
 script_tag(name:"cvss_base", value:"9.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2011-1292", "CVE-2011-1293", "CVE-2011-1440", "CVE-2011-1444", "CVE-2011-1797", "CVE-2011-1799");
 script_name("Debian Security Advisory DSA 2245-1 (chromium-browser)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
 script_family("Debian Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"chromium-browser", ver:"6.0.472.63~r59945-5+squeeze5", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"chromium-browser-dbg", ver:"6.0.472.63~r59945-5+squeeze5", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"chromium-browser-inspector", ver:"6.0.472.63~r59945-5+squeeze5", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"chromium-browser-l10n", ver:"6.0.472.63~r59945-5+squeeze5", rls:"DEB6.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
