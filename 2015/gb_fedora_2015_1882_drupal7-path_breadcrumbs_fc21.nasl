###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for drupal7-path_breadcrumbs FEDORA-2015-1882
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
  script_oid("1.3.6.1.4.1.25623.1.0.869022");
  script_version("$Revision: 6630 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:34:32 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-02-19 05:41:58 +0100 (Thu, 19 Feb 2015)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for drupal7-path_breadcrumbs FEDORA-2015-1882");
  script_tag(name: "summary", value: "Check the version of drupal7-path_breadcrumbs");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Path breadcrumbs module helps you to create
breadcrumbs for any page with any selection rules and load any entity from the URL.

Features
* Breadcrumbs navigation may be added to any kind of page: static
  (example: node/1) or dynamic (example: node/NID).
* You can load contexts from URL and use it like tokens for breadcrumb path or
  title.
* You can use selection rules for every breadcrumbs navigation.
* Supports ALL tokens from Entity tokens module (part of Entity module).
* You can import/export breadcrumbs (supports single operations, Features and
  Ctools bulk export).
* Breadcrumbs can be cloned to save you time while building navigation.
* Module provides rich snippets support for breadcrumbs (RDFa and Microdata).
* Module provides first/last/odd/even classes to every breadcrumb link.
* You can change breadcrumbs delimiter.
* Breadcrumbs could be hidden if they contain only one element.
* You can disable breadcrumbs and enable them later.
* All breadcrumb titles are translatable.
* Usable interface.

This package provides the following Drupal modules:
* path_breadcrumbs
* path_breadcrumbs_i18n (requires drupal7-i18n)
* path_breadcrumbs_ui
");
  script_tag(name: "affected", value: "drupal7-path_breadcrumbs on Fedora 21");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "FEDORA", value: "2015-1882");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2015-February/150134.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

if(release == "FC21")
{

  if ((res = isrpmvuln(pkg:"drupal7-path_breadcrumbs", rpm:"drupal7-path_breadcrumbs~3.2~1.fc21", rls:"FC21")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
