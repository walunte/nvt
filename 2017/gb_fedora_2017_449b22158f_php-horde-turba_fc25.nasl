###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_449b22158f_php-horde-turba_fc25.nasl 6956 2017-08-18 06:02:43Z santu $
#
# Fedora Update for php-horde-turba FEDORA-2017-449b22158f
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
  script_oid("1.3.6.1.4.1.25623.1.0.873256");
  script_version("$Revision: 6956 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-18 08:02:43 +0200 (Fri, 18 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-08-12 07:50:56 +0200 (Sat, 12 Aug 2017)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for php-horde-turba FEDORA-2017-449b22158f");
  script_tag(name: "summary", value: "Check the version of php-horde-turba");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Turba is the Horde contact management 
application. Leveraging the Horde framework to provide seamless integration 
with IMP and other Horde applications, it supports storing contacts in SQL, 
LDAP, Kolab, and IMSP address books.");
  script_tag(name: "affected", value: "php-horde-turba on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-449b22158f");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/NMM4SNOQ5F6ZKAGE2SURXJZC3EJR5J7F");
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

  if ((res = isrpmvuln(pkg:"php-horde-turba", rpm:"php-horde-turba~4.2.20~1.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
