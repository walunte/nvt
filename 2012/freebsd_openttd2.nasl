#
#VID 78c25ed7-f3f9-11e0-8b5c-b482fe3f522d
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID 78c25ed7-f3f9-11e0-8b5c-b482fe3f522d
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
tag_insight = "The following package is affected: openttd

CVE-2011-3342
Multiple buffer overflows in OpenTTD before 1.1.3 allow remote
attackers to cause a denial of service (daemon crash) or possibly
execute arbitrary code via vectors related to (1) NAME, (2) PLYR, (3)
CHTS, or (4) AIPL (aka AI config) chunk loading from a savegame.";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

http://security.openttd.org/en/CVE-2011-3342
http://www.vuxml.org/freebsd/78c25ed7-f3f9-11e0-8b5c-b482fe3f522d.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";



if(description)
{
 script_id(70621);
 script_tag(name:"creation_date", value:"2012-02-13 01:48:16 +0100 (Mon, 13 Feb 2012)");
 script_tag(name:"last_modification", value:"$Date: 2017-04-14 11:02:12 +0200 (Fri, 14 Apr 2017) $");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-2011-3342");
 script_version("$Revision: 5956 $");
 script_name("FreeBSD Ports: openttd");

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
bver = portver(pkg:"openttd");
if(!isnull(bver) && revcomp(a:bver, b:"0.1.0")>=0 && revcomp(a:bver, b:"1.1.3")<0) {
    txt += 'Package openttd version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
