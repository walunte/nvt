###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_2317191f8a_taglib_fc25.nasl 7080 2017-09-08 05:49:48Z asteins $
#
# Fedora Update for taglib FEDORA-2017-2317191f8a
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
  script_oid("1.3.6.1.4.1.25623.1.0.873325");
  script_version("$Revision: 7080 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-08 07:49:48 +0200 (Fri, 08 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-09-01 07:11:02 +0200 (Fri, 01 Sep 2017)");
  script_cve_id("CVE-2017-12678");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for taglib FEDORA-2017-2317191f8a");
  script_tag(name: "summary", value: "Check the version of taglib");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "TagLib is a library for reading and editing 
the meta-data of several popular audio formats. Currently it supports both ID3v1 
and ID3v2 for MP3 files, Ogg Vorbis comments and ID3 tags and Vorbis comments in 
FLAC, MPC, Speex, WavPack, TrueAudio files, as well as APE Tags.");
  script_tag(name: "affected", value: "taglib on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-2317191f8a");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DG2ISESNNTXGJPPD3YAC7LP5VROD4QJ5");
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

  if ((res = isrpmvuln(pkg:"taglib", rpm:"taglib~1.11.1~5.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
