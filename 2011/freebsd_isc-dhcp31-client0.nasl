#
#VID 7e69f00d-632a-11e0-9f3a-001d092480a4
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID 7e69f00d-632a-11e0-9f3a-001d092480a4
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
tag_insight = "The following packages are affected:
   isc-dhcp31-client
   isc-dhcp41-client

CVE-2011-0997
dhclient in ISC DHCP 3.0.x through 4.2.x before 4.2.1-P1, 3.1-ESV
before 3.1-ESV-R1, and 4.1-ESV before 4.1-ESV-R2 allows remote
attackers to execute arbitrary commands via shell metacharacters in a
hostname obtained from a DHCP message, as demonstrated by a hostname
that is provided to dhclient-script.";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";

tag_solution = "Update your system with the appropriate patches or
software upgrades.";

if(description)
{
 script_id(69601);
 script_version("$Revision: 5424 $");
 script_tag(name:"last_modification", value:"$Date: 2017-02-25 17:52:36 +0100 (Sat, 25 Feb 2017) $");
 script_tag(name:"creation_date", value:"2011-05-12 19:21:50 +0200 (Thu, 12 May 2011)");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2011-0997");
 script_name("FreeBSD Ports: isc-dhcp31-client");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
 script_family("FreeBSD Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/freebsdrel", "login/SSH/success");
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

include("pkg-lib-bsd.inc");

txt = "";
vuln = 0;
bver = portver(pkg:"isc-dhcp31-client");
if(!isnull(bver) && revcomp(a:bver, b:"3.1.ESV_1,1")<0) {
    txt += 'Package isc-dhcp31-client version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"isc-dhcp41-client");
if(!isnull(bver) && revcomp(a:bver, b:"4.1.e,2")<0) {
    txt += 'Package isc-dhcp41-client version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
