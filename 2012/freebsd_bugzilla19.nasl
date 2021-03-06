#
#VID 6ad18fe5-f469-11e1-920d-20cf30e32f6d
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID 6ad18fe5-f469-11e1-920d-20cf30e32f6d
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisories, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
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
tag_insight = "The following package is affected: bugzilla

CVE-2012-3981
Auth/Verify/LDAP.pm in Bugzilla 2.x and 3.x before 3.6.11, 3.7.x and
4.0.x before 4.0.8, 4.1.x and 4.2.x before 4.2.3, and 4.3.x before
4.3.3 does not restrict the characters in a username, which might
allow remote attackers to inject data into an LDAP directory via a
crafted login attempt.";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

https://bugzilla.mozilla.org/show_bug.cgi?id=785470
https://bugzilla.mozilla.org/show_bug.cgi?id=785522
https://bugzilla.mozilla.org/show_bug.cgi?id=785511
http://www.vuxml.org/freebsd/6ad18fe5-f469-11e1-920d-20cf30e32f6d.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";



if(description)
{
 script_id(71869);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
 script_cve_id("CVE-2012-3981");
 script_version("$Revision: 6022 $");
 script_tag(name:"last_modification", value:"$Date: 2017-04-25 14:51:04 +0200 (Tue, 25 Apr 2017) $");
 script_tag(name:"creation_date", value:"2012-09-07 11:47:17 -0400 (Fri, 07 Sep 2012)");
 script_name("FreeBSD Ports: bugzilla");


 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("FreeBSD Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/freebsdrel", "login/SSH/success");
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-bsd.inc");
vuln = 0;
txt = "";
bver = portver(pkg:"bugzilla");
if(!isnull(bver) && revcomp(a:bver, b:"3.6.0")>=0 && revcomp(a:bver, b:"3.6.11")<0) {
    txt += "Package bugzilla version " + bver + " is installed which is known to be vulnerable.\n";
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"4.0.0")>=0 && revcomp(a:bver, b:"4.0.8")<0) {
    txt += "Package bugzilla version " + bver + " is installed which is known to be vulnerable.\n";
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"4.2.0")>=0 && revcomp(a:bver, b:"4.2.3")<0) {
    txt += "Package bugzilla version " + bver + " is installed which is known to be vulnerable.\n";
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt ));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
