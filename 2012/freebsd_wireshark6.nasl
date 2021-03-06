#
#VID 3ebb2dc8-4609-11e1-9f47-00e0815b8da8
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID 3ebb2dc8-4609-11e1-9f47-00e0815b8da8
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
tag_insight = "The following packages are affected:
   wireshark
   wireshark-lite
   tshark
   tshark-lite";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

http://www.wireshark.org/security/wnpa-sec-2012-01.html
http://www.wireshark.org/security/wnpa-sec-2012-02.html
http://www.wireshark.org/security/wnpa-sec-2012-03.html
https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6663
https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6666
https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6667
https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6668
https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6669
https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6670
https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6634
https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6391
http://www.vuxml.org/freebsd/3ebb2dc8-4609-11e1-9f47-00e0815b8da8.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";



if(description)
{
 script_id(70748);
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
 script_cve_id("CVE-2012-0041", "CVE-2012-0066", "CVE-2012-0067", "CVE-2012-0068");
 script_version("$Revision: 5999 $");
 script_tag(name:"last_modification", value:"$Date: 2017-04-21 11:02:32 +0200 (Fri, 21 Apr 2017) $");
 script_tag(name:"creation_date", value:"2012-02-12 07:27:20 -0500 (Sun, 12 Feb 2012)");
 script_name("FreeBSD Ports: wireshark");



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

txt = "";
vuln = 0;
txt = "";
bver = portver(pkg:"wireshark");
if(!isnull(bver) && revcomp(a:bver, b:"1.4")>=0 && revcomp(a:bver, b:"1.4.11")<0) {
    txt += 'Package wireshark version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"1.6.0")>=0 && revcomp(a:bver, b:"1.6.5")<0) {
    txt += 'Package wireshark version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"wireshark-lite");
if(!isnull(bver) && revcomp(a:bver, b:"1.4")>=0 && revcomp(a:bver, b:"1.4.11")<0) {
    txt += 'Package wireshark-lite version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"1.6.0")>=0 && revcomp(a:bver, b:"1.6.5")<0) {
    txt += 'Package wireshark-lite version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"tshark");
if(!isnull(bver) && revcomp(a:bver, b:"1.4")>=0 && revcomp(a:bver, b:"1.4.11")<0) {
    txt += 'Package tshark version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"1.6.0")>=0 && revcomp(a:bver, b:"1.6.5")<0) {
    txt += 'Package tshark version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"tshark-lite");
if(!isnull(bver) && revcomp(a:bver, b:"1.4")>=0 && revcomp(a:bver, b:"1.4.11")<0) {
    txt += 'Package tshark-lite version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"1.6.0")>=0 && revcomp(a:bver, b:"1.6.5")<0) {
    txt += 'Package tshark-lite version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
