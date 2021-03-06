###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for openjdk-6 USN-1505-1
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
tag_insight = "It was discovered that multiple flaws existed in the CORBA (Common
  Object Request Broker Architecture) implementation in OpenJDK. An
  attacker could create a Java application or applet that used these
  flaws to bypass Java sandbox restrictions or modify immutable object
  data. (CVE-2012-1711, CVE-2012-1719)

  It was discovered that multiple flaws existed in the OpenJDK font
  manager's layout lookup implementation. A attacker could specially
  craft a font file that could cause a denial of service through
  crashing the JVM (Java Virtual Machine) or possibly execute arbitrary
  code. (CVE-2012-1713)

  It was discovered that the SynthLookAndFeel class from Swing in
  OpenJDK did not properly prevent access to certain UI elements
  from outside the current application context. An attacker could
  create a Java application or applet that used this flaw to cause a
  denial of service through crashing the JVM or bypass Java sandbox
  restrictions. (CVE-2012-1716)

  It was discovered that OpenJDK runtime library classes could create
  temporary files with insecure permissions. A local attacker could
  use this to gain access to sensitive information. (CVE-2012-1717)

  It was discovered that OpenJDK did not handle CRLs (Certificate
  Revocation Lists) properly. A remote attacker could use this to gain
  access to sensitive information. (CVE-2012-1718)

  It was discovered that the OpenJDK HotSpot Virtual Machine did not
  properly verify the bytecode of the class to be executed. A remote
  attacker could create a Java application or applet that used this
  to cause a denial of service through crashing the JVM or bypass Java
  sandbox restrictions. (CVE-2012-1723, CVE-2012-1725)

  It was discovered that the OpenJDK XML (Extensible Markup Language)
  parser did not properly handle some XML documents. An attacker could
  create an XML document that caused a denial of service in a Java
  application or applet parsing the document. (CVE-2012-1724)

  As part of this update, the IcedTea web browser applet plugin was
  updated for Ubuntu 10.04 LTS, Ubuntu 11.04, and Ubuntu 11.10.";

tag_summary = "Ubuntu Update for Linux kernel vulnerabilities USN-1505-1";
tag_affected = "openjdk-6 on Ubuntu 12.04 LTS ,
  Ubuntu 11.10 ,
  Ubuntu 11.04 ,
  Ubuntu 10.04 LTS";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://lists.ubuntu.com/archives/ubuntu-security-announce/2012-July/001759.html");
  script_id(841080);
  script_version("$Revision: 6643 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:00:30 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-07-16 11:53:18 +0530 (Mon, 16 Jul 2012)");
  script_cve_id("CVE-2012-1711", "CVE-2012-1719", "CVE-2012-1713", "CVE-2012-1716",
                "CVE-2012-1717", "CVE-2012-1718", "CVE-2012-1723", "CVE-2012-1725",
                "CVE-2012-1724");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "USN", value: "1505-1");
  script_name("Ubuntu Update for openjdk-6 USN-1505-1");

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

if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"icedtea-6-plugin", ver:"1.2-2ubuntu0.10.04.1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b24-1.11.3-1ubuntu0.10.04.1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b24-1.11.3-1ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"icedtea-6-plugin", ver:"1.2-2ubuntu0.11.10.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b24-1.11.3-1ubuntu0.11.10.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"icedtea-6-plugin", ver:"1.2-2ubuntu0.11.04.1", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b24-1.11.3-1ubuntu0.11.04.1", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
