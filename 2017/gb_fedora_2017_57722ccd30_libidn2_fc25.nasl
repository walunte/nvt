###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_57722ccd30_libidn2_fc25.nasl 7085 2017-09-08 15:01:13Z cfischer $
#
# Fedora Update for libidn2 FEDORA-2017-57722ccd30
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.873336");
  script_version("$Revision: 7085 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-08 17:01:13 +0200 (Fri, 08 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-09-04 07:27:21 +0200 (Mon, 04 Sep 2017)");
  script_cve_id("CVE-2017-14062", "CVE-2017-14061");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for libidn2 FEDORA-2017-57722ccd30");
  script_tag(name: "summary", value: "Check the version of libidn2");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Libidn2 is an implementation of the 
IDNA2008 specifications in RFC 5890, 5891, 5892, 5893 and TR46 for 
internationalized domain names (IDN). It is a standalone library, without any 
dependency on libidn.");
  script_tag(name: "affected", value: "libidn2 on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-57722ccd30");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/575ZT2UO4G43SFXJM432QQL3SAR7RPTI");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC25")
{

  if ((res = isrpmvuln(pkg:"libidn2", rpm:"libidn2~2.0.4~1.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
