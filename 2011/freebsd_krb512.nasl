#
#VID 4ab413ea-66ce-11e0-bf05-d445f3aa24f0
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID 4ab413ea-66ce-11e0-bf05-d445f3aa24f0
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com
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
tag_insight = "The following package is affected: krb5

CVE-2011-0281
The unparse implementation in the Key Distribution Center (KDC) in MIT
Kerberos 5 (aka krb5) 1.6.x through 1.9, when an LDAP backend is used,
allows remote attackers to cause a denial of service (file descriptor
exhaustion and daemon hang) via a principal name that triggers use of
a backslash escape sequence, as demonstrated by a \n sequence.

CVE-2011-0282
The Key Distribution Center (KDC) in MIT Kerberos 5 (aka krb5) 1.6.x
through 1.9, when an LDAP backend is used, allows remote attackers to
cause a denial of service (NULL pointer dereference or buffer
over-read, and daemon crash) via a crafted principal name.

CVE-2011-0283
The Key Distribution Center (KDC) in MIT Kerberos 5 (aka krb5) 1.9
allows remote attackers to cause a denial of service (NULL pointer
dereference and daemon crash) via a malformed request packet that does
not trigger a response packet.";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

http://web.mit.edu/kerberos/advisories/MITKRB5-SA-2011-002.txt
http://www.vuxml.org/freebsd/4ab413ea-66ce-11e0-bf05-d445f3aa24f0.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";



if(description)
{
 script_id(69597);
 script_version("$Revision: 5424 $");
 script_tag(name:"last_modification", value:"$Date: 2017-02-25 17:52:36 +0100 (Sat, 25 Feb 2017) $");
 script_tag(name:"creation_date", value:"2011-05-12 19:21:50 +0200 (Thu, 12 May 2011)");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
 script_cve_id("CVE-2011-0281", "CVE-2011-0282", "CVE-2011-0283");
 script_name("FreeBSD Ports: krb5");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
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
bver = portver(pkg:"krb5");
if(!isnull(bver) && revcomp(a:bver, b:"1.6")>=0 && revcomp(a:bver, b:"1.9")<=0) {
    txt += 'Package krb5 version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
