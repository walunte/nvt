###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for proftpd FEDORA-2011-15740
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");
tag_insight = "ProFTPD is an enhanced FTP server with a focus toward simplicity, security,
  and ease of configuration. It features a very Apache-like configuration
  syntax, and a highly customizable server infrastructure, including support for
  multiple 'virtual' FTP servers, anonymous FTP, and permission-based directory
  visibility.

  This package defaults to the standalone behavior of ProFTPD, but all the
  needed scripts to have it run by xinetd instead are included.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "proftpd on Fedora 15";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2011-November/069487.html");
  script_id(863630);
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
 script_version("$Revision: 6626 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:30:10 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2011-11-21 09:34:59 +0530 (Mon, 21 Nov 2011)");
  script_xref(name: "FEDORA", value: "2011-15740");
  script_cve_id("CVE-2011-4130");
  script_name("Fedora Update for proftpd FEDORA-2011-15740");

  script_summary("Check for the Version of proftpd");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");


res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC15")
{

  if ((res = isrpmvuln(pkg:"proftpd", rpm:"proftpd~1.3.4~1.fc15", rls:"FC15")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
