#
#VID 9da3834b-6a50-11e1-91af-003067b2972c
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID 9da3834b-6a50-11e1-91af-003067b2972c
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
tag_insight = "The following package is affected: linux-f10-flashplugin

CVE-2012-0768
The Matrix3D component in Adobe Flash Player before 10.3.183.16 and
11.x before 11.1.102.63 on Windows, Mac OS X, Linux, and Solaris;
before 11.1.111.7 on Android 2.x and 3.x; and before 11.1.115.7 on
Android 4.x allows attackers to execute arbitrary code or cause a
denial of service (memory corruption) via unspecified vectors.

CVE-2012-0769
Adobe Flash Player before 10.3.183.16 and 11.x before 11.1.102.63 on
Windows, Mac OS X, Linux, and Solaris; before 11.1.111.7 on Android
2.x and 3.x; and before 11.1.115.7 on Android 4.x does not properly
handle integers, which allows attackers to obtain sensitive
information via unspecified vectors.";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

https://www.adobe.com/support/security/bulletins/apsb12-05.html
http://www.vuxml.org/freebsd/9da3834b-6a50-11e1-91af-003067b2972c.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";



if(description)
{
 script_id(71158);
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2012-0768", "CVE-2012-0769");
 script_version("$Revision: 5963 $");
 script_tag(name:"last_modification", value:"$Date: 2017-04-18 11:02:14 +0200 (Tue, 18 Apr 2017) $");
 script_tag(name:"creation_date", value:"2012-03-12 11:35:07 -0400 (Mon, 12 Mar 2012)");
 script_name("FreeBSD Ports: linux-f10-flashplugin");


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
bver = portver(pkg:"linux-f10-flashplugin");
if(!isnull(bver) && revcomp(a:bver, b:"11.1r102.63")<0) {
    txt += "Package linux-f10-flashplugin version " + bver + " is installed which is known to be vulnerable.\n";
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt ));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
