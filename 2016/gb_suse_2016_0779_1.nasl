###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for graphite2 SUSE-SU-2016:0779-1 (graphite2)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851237");
  script_version("$Revision: 6665 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:01:58 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-03-16 06:09:48 +0100 (Wed, 16 Mar 2016)");
  script_cve_id("CVE-2016-1521", "CVE-2016-1523", "CVE-2016-1526");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for graphite2 SUSE-SU-2016:0779-1 (graphite2)");
  script_tag(name: "summary", value: "Check the version of graphite2");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  This update for graphite2 fixes the following issues:

  - CVE-2016-1521: The directrun function in directmachine.cpp in
  Libgraphite did not validate a certain skip operation, which allowed
  remote attackers to execute arbitrary code, obtain sensitive information,
  or cause a denial of service (out-of-bounds read and application crash)
  via a crafted Graphite smart font.

  - CVE-2016-1523: The SillMap::readFace function in FeatureMap.cpp in
  Libgraphite mishandled a return value, which allowed remote attackers to
  cause a denial of service (missing initialization, NULL pointer
  dereference, and application crash) via a crafted Graphite smart font.

  - CVE-2016-1526: The TtfUtil:LocaLookup function in TtfUtil.cpp in
  Libgraphite incorrectly validated a size value, which allowed remote
  attackers to obtain sensitive information or cause a denial of service
  (out-of-bounds read and application crash) via a crafted Graphite smart
  font.");
  script_tag(name: "affected", value: "graphite2 on SUSE Linux Enterprise Server 12, SUSE Linux Enterprise Desktop 12");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "SUSE-SU", value: "2016:0779_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2016-03/msg00052.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

if(release == "SLED12.0SP0")
{

  if ((res = isrpmvuln(pkg:"graphite2-debuginfo", rpm:"graphite2-debuginfo~1.3.1~6.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"graphite2-debugsource", rpm:"graphite2-debugsource~1.3.1~6.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgraphite2-3", rpm:"libgraphite2-3~1.3.1~6.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgraphite2-3-32bit", rpm:"libgraphite2-3-32bit~1.3.1~6.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgraphite2-3-debuginfo", rpm:"libgraphite2-3-debuginfo~1.3.1~6.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgraphite2-3-debuginfo-32bit", rpm:"libgraphite2-3-debuginfo-32bit~1.3.1~6.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "SLES12.0SP0")
{

  if ((res = isrpmvuln(pkg:"graphite2-debuginfo", rpm:"graphite2-debuginfo~1.3.1~6.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"graphite2-debugsource", rpm:"graphite2-debugsource~1.3.1~6.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgraphite2-3", rpm:"libgraphite2-3~1.3.1~6.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgraphite2-3-debuginfo", rpm:"libgraphite2-3-debuginfo~1.3.1~6.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgraphite2-3-32bit", rpm:"libgraphite2-3-32bit~1.3.1~6.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgraphite2-3-debuginfo-32bit", rpm:"libgraphite2-3-debuginfo-32bit~1.3.1~6.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
