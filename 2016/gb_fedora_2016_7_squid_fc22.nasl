###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for squid FEDORA-2016-7
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
  script_oid("1.3.6.1.4.1.25623.1.0.807978");
  script_version("$Revision: 6631 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:36:10 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-05-07 05:18:30 +0200 (Sat, 07 May 2016)");
  script_cve_id("CVE-2016-2571", "CVE-2016-2572", "CVE-2015-3455", "CVE-2015-5400");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for squid FEDORA-2016-7");
  script_tag(name: "summary", value: "Check the version of squid");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "Squid is a high-performance proxy caching
  server for Web clients, supporting FTP, gopher, and HTTP data objects. Unlike
  traditional caching software, Squid handles all requests in a single,
  non-blocking, I/O-driven process. Squid keeps meta data and especially
  hot objects cached in RAM, caches DNS lookups, supports non-blocking
  DNS lookups, and implements negative caching of failed requests.

  Squid consists of a main server program squid, a Domain Name System
  lookup program (dnsserver), a program for retrieving FTP data
  (ftpget), and some management and client tools.");

  script_tag(name: "affected", value: "squid on Fedora 22");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-7");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2016-May/183597.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

if(release == "FC22")
{

  if ((res = isrpmvuln(pkg:"squid", rpm:"squid~3.5.10~1.fc22", rls:"FC22")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
