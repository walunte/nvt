###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3455_1.nasl 7507 2017-10-19 12:10:58Z santu $
#
# Ubuntu Update for wpa USN-3455-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843342");
  script_version("$Revision: 7507 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-19 14:10:58 +0200 (Thu, 19 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-10-18 16:53:52 +0200 (Wed, 18 Oct 2017)");
  script_cve_id("CVE-2017-13077", "CVE-2017-13078", "CVE-2017-13079", "CVE-2017-13080",
                "CVE-2017-13081", "CVE-2017-13082", "CVE-2017-13086", "CVE-2017-13087",
                "CVE-2017-13088", "CVE-2016-4476", "CVE-2016-4477"); 
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for wpa USN-3455-1");
  script_tag(name: "summary", value: "Check the version of wpa");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of 
  detect NVT and check if the version is vulnerable or not."); 
  script_tag(name: "insight", value: "Mathy Vanhoef discovered that wpa_supplicant 
  and hostapd incorrectly handled WPA2. A remote attacker could use this issue 
  with using key reinstallation attacks to obtain sensitive information. 
  (CVE-2017-13077, CVE-2017-13078, CVE-2017-13079, CVE-2017-13080, CVE-2017-13081, 
  CVE-2017-13082, CVE-2017-13086, CVE-2017-13087, CVE-2017-13088) Imre Rad 
  discovered that wpa_supplicant and hostapd incorrectly handled invalid 
  characters in passphrase parameters. A remote attacker could use this issue to 
  cause a denial of service. (CVE-2016-4476) Imre Rad discovered that 
  wpa_supplicant and hostapd incorrectly handled invalid characters in passphrase 
  parameters. A local attacker could use this issue to cause a denial of service, 
  or possibly execute arbitrary code. (CVE-2016-4477)"); 
  script_tag(name: "affected", value: "wpa on Ubuntu 17.04 ,
  Ubuntu 16.04 LTS ,
  Ubuntu 14.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "3455-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-3455-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"hostapd", ver:"2.1-0ubuntu1.5", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"wpasupplicant", ver:"2.1-0ubuntu1.5", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU17.04")
{

  if ((res = isdpkgvuln(pkg:"hostapd", ver:"2.4-0ubuntu9.1", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"wpasupplicant", ver:"2.4-0ubuntu9.1", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"hostapd", ver:"2.4-0ubuntu6.2", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"wpasupplicant", ver:"2.4-0ubuntu6.2", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
