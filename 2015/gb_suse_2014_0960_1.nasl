###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for Mozilla SUSE-SU-2014:0960-1 (Mozilla)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.850823");
  script_version("$Revision: 6675 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:54:28 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-10-13 18:35:01 +0530 (Tue, 13 Oct 2015)");
  script_cve_id("CVE-2014-1544", "CVE-2014-1547", "CVE-2014-1548", "CVE-2014-1555", "CVE-2014-1556", "CVE-2014-1557", "CVE-2014-1549", "CVE-2014-1550", "CVE-2014-1551", "CVE-2014-1552", "CVE-2014-1558", "CVE-2014-1559", "CVE-2014-1560", "CVE-2014-1561");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for Mozilla SUSE-SU-2014:0960-1 (Mozilla)");
  script_tag(name: "summary", value: "Check the version of Mozilla");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  Mozilla Firefox has been updated to the 24.7ESR security release.

  Security issues fixed in this release:

  * CVE-2014-1544 -
https://www.mozilla.org/security/announce/2014/mfsa2014-63.html
https://www.mozilla.org/security/announce/2014/mfsa2014-63.html 
  * CVE-2014-1548 -
https://www.mozilla.org/security/announce/2014/mfsa2014-56.html
https://www.mozilla.org/security/announce/2014/mfsa2014-56.html 
  * CVE-2014-1549 -
https://www.mozilla.org/security/announce/2014/mfsa2014-57.html
https://www.mozilla.org/security/announce/2014/mfsa2014-57.html 
  * CVE-2014-1550 -
https://www.mozilla.org/security/announce/2014/mfsa2014-58.html
https://www.mozilla.org/security/announce/2014/mfsa2014-58.html 
  * CVE-2014-1551 -
https://www.mozilla.org/security/announce/2014/mfsa2014-59.html
https://www.mozilla.org/security/announce/2014/mfsa2014-59.html 
  * CVE-2014-1552 -
https://www.mozilla.org/security/announce/2014/mfsa2014-66.html
https://www.mozilla.org/security/announce/2014/mfsa2014-66.html 
  * CVE-2014-1555 -
https://www.mozilla.org/security/announce/2014/mfsa2014-61.html
https://www.mozilla.org/security/announce/2014/mfsa2014-61.html 
  * CVE-2014-1556 -
https://www.mozilla.org/security/announce/2014/mfsa201 ... 

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "Mozilla on SUSE Linux Enterprise Server 11 SP3");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "SUSE-SU", value: "2014:0960_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2014-08/msg00001.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "SLES11.0SP3")
{

  if ((res = isrpmvuln(pkg:"MozillaFirefox", rpm:"MozillaFirefox~24.7.0esr~0.8.2", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-translations", rpm:"MozillaFirefox-translations~24.7.0esr~0.8.2", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libfreebl3", rpm:"libfreebl3~3.16.2~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libsoftokn3", rpm:"libsoftokn3~3.16.2~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nss", rpm:"mozilla-nss~3.16.2~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nss-tools", rpm:"mozilla-nss-tools~3.16.2~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libfreebl3-32bit", rpm:"libfreebl3-32bit~3.16.2~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libsoftokn3-32bit", rpm:"libsoftokn3-32bit~3.16.2~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nss-32bit", rpm:"mozilla-nss-32bit~3.16.2~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libfreebl3-x86", rpm:"libfreebl3-x86~3.16.2~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libsoftokn3-x86", rpm:"libsoftokn3-x86~3.16.2~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nss-x86", rpm:"mozilla-nss-x86~3.16.2~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
