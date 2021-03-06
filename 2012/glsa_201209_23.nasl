#
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from Gentoo's XML based advisory
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
tag_insight = "Multiple vulnerabilities have been found in GIMP, the worst of
    which allow execution of arbitrary code or Denial of Service.";
tag_solution = "All GIMP users should upgrade to the latest version:

      # emerge --sync
      # emerge --ask --oneshot --verbose '>=media-gfx/gimp-2.6.12-r2'
    

http://www.securityspace.com/smysecure/catid.html?in=GLSA%20201209-23
http://bugs.gentoo.org/show_bug.cgi?id=293127
http://bugs.gentoo.org/show_bug.cgi?id=350915
http://bugs.gentoo.org/show_bug.cgi?id=372975
http://bugs.gentoo.org/show_bug.cgi?id=379289
http://bugs.gentoo.org/show_bug.cgi?id=418425
http://bugs.gentoo.org/show_bug.cgi?id=432582";
tag_summary = "The remote host is missing updates announced in
advisory GLSA 201209-23.";

                                                                                
                                                                                
if(description)
{
 script_id(72457);
 script_tag(name:"cvss_base", value:"9.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2009-1570", "CVE-2009-3909", "CVE-2010-4540", "CVE-2010-4541", "CVE-2010-4542", "CVE-2010-4543", "CVE-2011-1178", "CVE-2011-2896", "CVE-2012-2763", "CVE-2012-3402");
 script_version("$Revision: 6593 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 11:18:14 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2012-10-03 11:11:28 -0400 (Wed, 03 Oct 2012)");
 script_name("Gentoo Security Advisory GLSA 201209-23 (gimp)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("Gentoo Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
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

include("pkg-lib-gentoo.inc");
res = "";
report = "";
if((res = ispkgvuln(pkg:"media-gfx/gimp", unaffected: make_list("ge 2.6.12-r2"), vulnerable: make_list("lt 2.6.12-r2"))) != NULL ) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
