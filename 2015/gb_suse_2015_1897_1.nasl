###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for krb5 SUSE-SU-2015:1897-1 (krb5)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851129");
  script_version("$Revision: 6665 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:01:58 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-11-05 06:20:18 +0100 (Thu, 05 Nov 2015)");
  script_cve_id("CVE-2015-2695", "CVE-2015-2696", "CVE-2015-2697");
  script_tag(name:"cvss_base", value:"7.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for krb5 SUSE-SU-2015:1897-1 (krb5)");
  script_tag(name: "summary", value: "Check the version of krb5");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  krb5 was updated to fix three security issues.

  These security issues were fixed:
  - CVE-2015-2695: Applications which call gss_inquire_context() on a
  partially-established SPNEGO context could have caused the GSS-API
  library to read from a pointer using the wrong type, generally causing a
  process crash. (bsc#952188).
  - CVE-2015-2696: Applications which call gss_inquire_context() on a
  partially-established IAKERB context could have caused the GSS-API
  library to read from a pointer using the wrong type, generally causing a
  process crash. (bsc#952189).
  - CVE-2015-2697: Incorrect string handling in build_principal_va can lead
  to DOS (bsc#952190).");
  script_tag(name: "affected", value: "krb5 on SUSE Linux Enterprise Server 12, SUSE Linux Enterprise Desktop 12");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "SUSE-SU", value: "2015:1897_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2015-11/msg00006.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

if(release == "SLED12.0SP0")
{

  if ((res = isrpmvuln(pkg:"krb5", rpm:"krb5~1.12.1~19.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-32bit", rpm:"krb5-32bit~1.12.1~19.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-client", rpm:"krb5-client~1.12.1~19.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-client-debuginfo", rpm:"krb5-client-debuginfo~1.12.1~19.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-debuginfo", rpm:"krb5-debuginfo~1.12.1~19.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-debuginfo-32bit", rpm:"krb5-debuginfo-32bit~1.12.1~19.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-debugsource", rpm:"krb5-debugsource~1.12.1~19.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "SLES12.0SP0")
{

  if ((res = isrpmvuln(pkg:"krb5", rpm:"krb5~1.12.1~19.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-client", rpm:"krb5-client~1.12.1~19.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-client-debuginfo", rpm:"krb5-client-debuginfo~1.12.1~19.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-debuginfo", rpm:"krb5-debuginfo~1.12.1~19.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-debugsource", rpm:"krb5-debugsource~1.12.1~19.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-doc", rpm:"krb5-doc~1.12.1~19.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-plugin-kdb-ldap", rpm:"krb5-plugin-kdb-ldap~1.12.1~19.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-plugin-kdb-ldap-debuginfo", rpm:"krb5-plugin-kdb-ldap-debuginfo~1.12.1~19.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-plugin-preauth-otp", rpm:"krb5-plugin-preauth-otp~1.12.1~19.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-plugin-preauth-otp-debuginfo", rpm:"krb5-plugin-preauth-otp-debuginfo~1.12.1~19.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-plugin-preauth-pkinit", rpm:"krb5-plugin-preauth-pkinit~1.12.1~19.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-plugin-preauth-pkinit-debuginfo", rpm:"krb5-plugin-preauth-pkinit-debuginfo~1.12.1~19.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-server", rpm:"krb5-server~1.12.1~19.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-server-debuginfo", rpm:"krb5-server-debuginfo~1.12.1~19.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-32bit", rpm:"krb5-32bit~1.12.1~19.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-debuginfo-32bit", rpm:"krb5-debuginfo-32bit~1.12.1~19.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
