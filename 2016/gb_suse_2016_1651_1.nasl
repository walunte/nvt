###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for vlc openSUSE-SU-2016:1651-1 (vlc)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851351");
  script_version("$Revision: 6676 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:56:06 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-06-23 05:24:29 +0200 (Thu, 23 Jun 2016)");
  script_cve_id("CVE-2016-3941", "CVE-2016-5108");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for vlc openSUSE-SU-2016:1651-1 (vlc)");
  script_tag(name: "summary", value: "Check the version of vlc");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  This update for vlc to version 2.1.6 fixes the following issues:

  These CVE were fixed:
  - CVE-2016-5108: Reject invalid QuickTime IMA files (boo#984382).
  - CVE-2016-3941: Heap overflow in processing wav files (boo#973354).

  These security issues without were fixed:
  - Fix heap overflow in decomp stream filter.
  - Fix buffer overflow in updater.
  - Fix potential buffer overflow in schroedinger encoder.
  - Fix null-pointer dereference in DMO decoder.
  - Fix buffer overflow in parsing of string boxes in mp4 demuxer.
  - Fix SRTP integer overflow.
  - Fix potential crash in zip access.
  - Fix read overflow in Ogg demuxer.");
  script_tag(name: "affected", value: "vlc on openSUSE 13.2");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "openSUSE-SU", value: "2016:1651_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2016-06/msg00045.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "openSUSE13.2")
{

  if ((res = isrpmvuln(pkg:"libvlc5", rpm:"libvlc5~2.1.6~2.10.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvlc5-debuginfo", rpm:"libvlc5-debuginfo~2.1.6~2.10.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvlccore7", rpm:"libvlccore7~2.1.6~2.10.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvlccore7-debuginfo", rpm:"libvlccore7-debuginfo~2.1.6~2.10.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vlc", rpm:"vlc~2.1.6~2.10.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vlc-debuginfo", rpm:"vlc-debuginfo~2.1.6~2.10.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vlc-debugsource", rpm:"vlc-debugsource~2.1.6~2.10.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vlc-devel", rpm:"vlc-devel~2.1.6~2.10.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vlc-gnome", rpm:"vlc-gnome~2.1.6~2.10.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vlc-gnome-debuginfo", rpm:"vlc-gnome-debuginfo~2.1.6~2.10.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vlc-noX", rpm:"vlc-noX~2.1.6~2.10.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vlc-noX-debuginfo", rpm:"vlc-noX-debuginfo~2.1.6~2.10.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vlc-qt", rpm:"vlc-qt~2.1.6~2.10.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vlc-qt-debuginfo", rpm:"vlc-qt-debuginfo~2.1.6~2.10.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vlc-noX-lang", rpm:"vlc-noX-lang~2.1.6~2.10.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
