###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for imagemagick USN-1435-1
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
tag_insight = "Joonas Kuorilehto and Aleksis Kauppinen discovered that ImageMagick
  incorrectly handled certain ResolutionUnit tags. If a user or automated
  system using ImageMagick were tricked into opening a specially crafted
  image, an attacker could exploit this to cause a denial of service or
  possibly execute code with the privileges of the user invoking the program.
  (CVE-2012-0247, CVE-2012-1185)

  Joonas Kuorilehto and Aleksis Kauppinen discovered that ImageMagick
  incorrectly handled certain IFD structures. If a user or automated
  system using ImageMagick were tricked into opening a specially crafted
  image, an attacker could exploit this to cause a denial of service.
  (CVE-2012-0248, CVE-2012-1186)

  Aleksis Kauppinen, Joonas Kuorilehto and Tuomas Parttimaa discovered that
  ImageMagick incorrectly handled certain JPEG EXIF tags. If a user or
  automated system using ImageMagick were tricked into opening a specially
  crafted image, an attacker could exploit this to cause a denial of service.
  (CVE-2012-0259)

  It was discovered that ImageMagick incorrectly handled certain JPEG EXIF
  tags. If a user or automated system using ImageMagick were tricked into
  opening a specially crafted image, an attacker could exploit this to cause
  a denial of service or possibly execute code with the privileges of the
  user invoking the program. (CVE-2012-1610)

  Aleksis Kauppinen, Joonas Kuorilehto and Tuomas Parttimaa discovered that
  ImageMagick incorrectly handled certain TIFF EXIF tags. If a user or
  automated system using ImageMagick were tricked into opening a specially
  crafted image, an attacker could exploit this to cause a denial of service
  or possibly execute code with the privileges of the user invoking the
  program. (CVE-2012-1798)";

tag_summary = "Ubuntu Update for Linux kernel vulnerabilities USN-1435-1";
tag_affected = "imagemagick on Ubuntu 12.04 LTS ,
  Ubuntu 11.10 ,
  Ubuntu 11.04 ,
  Ubuntu 10.04 LTS";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://lists.ubuntu.com/archives/ubuntu-security-announce/2012-May/001674.html");
  script_id(840996);
  script_tag(name:"cvss_base", value:"9.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
 script_version("$Revision: 6643 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:00:30 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-05-04 10:47:56 +0530 (Fri, 04 May 2012)");
  script_cve_id("CVE-2012-0247", "CVE-2012-1185", "CVE-2012-0248", "CVE-2012-1186", "CVE-2012-0259", "CVE-2012-1610", "CVE-2012-1798");
  script_xref(name: "USN", value: "1435-1");
  script_name("Ubuntu Update for imagemagick USN-1435-1");

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

  if ((res = isdpkgvuln(pkg:"imagemagick", ver:"6.5.7.8-1ubuntu1.2", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libmagick++2", ver:"6.5.7.8-1ubuntu1.2", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"imagemagick", ver:"6.6.9.7-5ubuntu3.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libmagick++4", ver:"6.6.9.7-5ubuntu3.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"imagemagick", ver:"6.6.0.4-3ubuntu1.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libmagick++3", ver:"6.6.0.4-3ubuntu1.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"imagemagick", ver:"6.6.2.6-1ubuntu4.1", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libmagick++3", ver:"6.6.2.6-1ubuntu4.1", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
