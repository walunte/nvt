###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for guacamole-common FEDORA-2012-14179
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "Guacamole is an HTML5 web application that provides access to desktop
  environments using remote desktop protocols such as VNC or RDP. A centralized
  server acts as a tunnel and proxy, allowing access to multiple desktops through
  a web browser. No plugins are needed: the client requires nothing more than a
  web browser supporting HTML5 and AJAX.

  guacamole-common is the core Java library used by the Guacamole web application.
  guacamole-common provides abstract means of connecting to guacd, interfacing
  with the JavaScript client and tunnel provided by guacamole-common-js, and
  reading configuration from a standard location (guacamole.properties).";

tag_affected = "guacamole-common on Fedora 17";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2012-September/088216.html");
  script_id(864738);
  script_version("$Revision: 6627 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:31:14 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-09-27 09:04:36 +0530 (Thu, 27 Sep 2012)");
  script_cve_id("CVE-2012-4415");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name: "FEDORA", value: "2012-14179");
  script_name("Fedora Update for guacamole-common FEDORA-2012-14179");

  script_summary("Check for the Version of guacamole-common");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
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

if(release == "FC17")
{

  if ((res = isrpmvuln(pkg:"guacamole-common", rpm:"guacamole-common~0.6.1~2.fc17", rls:"FC17")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
