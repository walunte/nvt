###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for pidgin openSUSE-SU-2017:0973-1 (pidgin)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851535");
  script_version("$Revision: 6677 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:58:27 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-04-12 06:32:55 +0200 (Wed, 12 Apr 2017)");
  script_cve_id("CVE-2017-2640");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for pidgin openSUSE-SU-2017:0973-1 (pidgin)");
  script_tag(name: "summary", value: "Check the version of pidgin");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  This update for pidgin to version 2.12.0 fixes the following issues:

  This security issue was fixed:
  - CVE-2017-2640: Out of bounds memory read in
  purple_markup_unescape_entity (boo#1028835).

  These non-security issues were fixed:
  + libpurple:
  - Fix the use of uninitialised memory if running non-debug-enabled
  versions of glib.
  - Update AIM dev and dist ID's to new ones that were assigned by AOL.
  - TLS certificate verification now uses SHA-256 checksums.
  - Fix the SASL external auth for Freenode (boo#1009974).
  - Remove the MSN protocol plugin. It has been unusable and dormant for
  some time.
  - Remove the Mxit protocol plugin. The service was closed at the end
  ofSeptember 2016.
  - Remove the MySpaceIM protocol plugin. The service has been defunct for
  a long time (pidgin.im#15356).
  - Remove the Yahoo! protocol plugin. Yahoo has completely reimplemented
  their protocol, so this version is no longer
  operable as of August 5th, 2016.
  - Remove the Facebook (XMPP) account option. According to
  'https://developers.facebook.com/docs/chat'
  ended April 30th, 2015.
  - Fix gnutls certificate validation errors that mainly affected Google.
  + General:
  - Replace instances of d.pidgin.im with developer.pidgin.im and update
  the urls to use https (pidgin.im#17036).
  + IRC:
  - Fix an issue of messages being silently cut off at 500 characters.
  Large messages are now split into parts and sent
  one by one (pidgin.im#4753).");
  script_tag(name: "affected", value: "pidgin on openSUSE Leap 42.2");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "openSUSE-SU", value: "2017:0973_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2017-04/msg00012.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

if(release == "openSUSELeap42.2")
{

  if ((res = isrpmvuln(pkg:"libpurple-branding-openSUSE", rpm:"libpurple-branding-openSUSE~42.2~3.3.2", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-branding-upstream", rpm:"libpurple-branding-upstream~2.12.0~8.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-lang", rpm:"libpurple-lang~2.12.0~8.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"finch", rpm:"finch~2.12.0~8.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"finch-debuginfo", rpm:"finch-debuginfo~2.12.0~8.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"finch-devel", rpm:"finch-devel~2.12.0~8.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple", rpm:"libpurple~2.12.0~8.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-debuginfo", rpm:"libpurple-debuginfo~2.12.0~8.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-devel", rpm:"libpurple-devel~2.12.0~8.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-plugin-sametime", rpm:"libpurple-plugin-sametime~2.12.0~8.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-plugin-sametime-debuginfo", rpm:"libpurple-plugin-sametime-debuginfo~2.12.0~8.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-tcl", rpm:"libpurple-tcl~2.12.0~8.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-tcl-debuginfo", rpm:"libpurple-tcl-debuginfo~2.12.0~8.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin", rpm:"pidgin~2.12.0~8.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin-debuginfo", rpm:"pidgin-debuginfo~2.12.0~8.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin-debugsource", rpm:"pidgin-debugsource~2.12.0~8.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin-devel", rpm:"pidgin-devel~2.12.0~8.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
