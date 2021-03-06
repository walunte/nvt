###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for python2.7 USN-1592-1
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
tag_insight = "Niels Heinen discovered that the urllib and urllib2 modules would
  process Location headers that specify a redirection to file: URLs. A
  remote attacker could exploit this to obtain sensitive information or
  cause a denial of service. This issue only affected Ubuntu 11.04.
  (CVE-2011-1521)

  It was discovered that SimpleHTTPServer did not use a charset parameter
  in the Content-Type HTTP header. An attacker could potentially exploit
  this to conduct cross-site scripting (XSS) attacks against Internet
  Explorer 7 users. This issue only affected Ubuntu 11.04. (CVE-2011-4940)
  
  It was discovered that Python distutils contained a race condition when
  creating the ~/.pypirc file. A local attacker could exploit this to
  obtain sensitive information. (CVE-2011-4944)
  
  It was discovered that SimpleXMLRPCServer did not properly validate its
  input when handling HTTP POST requests. A remote attacker could exploit
  this to cause a denial of service via excessive CPU utilization.
  (CVE-2012-0845)
  
  It was discovered that Python was susceptible to hash algorithm attacks.
  An attacker could cause a denial of service under certain circumstances.
  This updates adds the '-R' command line option and honors setting the
  PYTHONHASHSEED environment variable to 'random' to salt str and datetime
  objects with an unpredictable value. (CVE-2012-1150)";

tag_summary = "Ubuntu Update for Linux kernel vulnerabilities USN-1592-1";
tag_affected = "python2.7 on Ubuntu 11.10 ,
  Ubuntu 11.04";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://lists.ubuntu.com/archives/ubuntu-security-announce/2012-October/001850.html");
  script_id(841173);
  script_version("$Revision: 6643 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:00:30 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-10-03 09:24:32 +0530 (Wed, 03 Oct 2012)");
  script_cve_id("CVE-2011-1521", "CVE-2011-4940", "CVE-2011-4944", "CVE-2012-0845", "CVE-2012-1150");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
  script_xref(name: "USN", value: "1592-1");
  script_name("Ubuntu Update for python2.7 USN-1592-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"python2.7", ver:"2.7.2-5ubuntu1.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"python2.7-minimal", ver:"2.7.2-5ubuntu1.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"python2.7", ver:"2.7.1-5ubuntu2.2", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"python2.7-minimal", ver:"2.7.1-5ubuntu2.2", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
