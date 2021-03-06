# OpenVAS Vulnerability Test
# $Id: deb_2254_1.nasl 6613 2017-07-07 12:08:40Z cfischer $
# Description: Auto-generated from advisory DSA 2254-1 (oprofile)
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
tag_insight = "OProfile is a performance profiling tool which is configurable by opcontrol, its
control utility. Stephane Chauveau reported several ways to inject arbitrary
commands in the arguments of this utility. If a local unprivileged user is
authorized by sudoers file to run opcontrol as root, this user could use the
flaw to escalate his privileges.


For the oldstable distribution (lenny), this problem has been fixed in
version 0.9.3-2+lenny1.

For the stable distribution (squeeze), this problem has been fixed in
version 0.9.6-1.1+squeeze1.

For the testing distribution (wheezy), this problem has been fixed in
version 0.9.6-1.2.

For the unstable distribution (sid), this problem has been fixed in
version 0.9.6-1.2.

We recommend that you upgrade your oprofile packages.";
tag_summary = "The remote host is missing an update to oprofile
announced via advisory DSA 2254-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202254-1";


if(description)
{
 script_id(69961);
 script_version("$Revision: 6613 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 14:08:40 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2011-08-03 04:36:20 +0200 (Wed, 03 Aug 2011)");
 script_tag(name:"cvss_base", value:"7.2");
 script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2011-1760");
 script_name("Debian Security Advisory DSA 2254-1 (oprofile)");



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
if ((res = isdpkgvuln(pkg:"oprofile", ver:"0.9.3-2+lenny2", rls:"DEB5.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"oprofile-gui", ver:"0.9.3-2+lenny2", rls:"DEB5.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"oprofile", ver:"0.9.6-1.1+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"oprofile-gui", ver:"0.9.6-1.1+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"oprofile", ver:"0.9.6-1.2", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"oprofile-gui", ver:"0.9.6-1.2", rls:"DEB7.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
