# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2016-693.nasl 6574 2017-07-06 13:41:26Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@iki.fi> 
#
# OpenVAS and security consultance available from openvas@solinor.com
# see https://solinor.fi/openvas-en/ for more information
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://ping-viini.org 
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.120682");
script_version("$Revision: 6574 $");
script_tag(name:"creation_date", value:"2016-05-09 14:11:58 +0300 (Mon, 09 May 2016)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:41:26 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: alas-2016-693");
script_tag(name: "insight", value: "It was discovered that the ObjectInputStream class in the Serialization component of OpenJDK failed to properly ensure thread consistency when deserializing serialized input. An untrusted Java application or applet could use this flaw to bypass Java sandbox restrictions. (CVE-2016-0686 )It was discovered that the Hotspot component of OpenJDK did not properly handle byte types. An untrusted Java application or applet could use this flaw to corrupt Java virtual machine memory and possibly execute arbitrary code, bypassing Java sandbox restrictions. (CVE-2016-0687 )It was discovered that the RMI server implementation in the JMX component in OpenJDK did not restrict which classes can be deserialized when deserializing authentication credentials. A remote, unauthenticated attacker able to connect to a JMX port could possibly use this flaw to trigger deserialization flaws. (CVE-2016-3427 )It was discovered that the JAXP component in OpenJDK failed to properly handle Unicode surrogate pairs used as part of the XML attribute values. Specially crafted XML input could cause a Java application to use an excessive amount of memory when parsed. (CVE-2016-3425 )It was discovered that the Security component in OpenJDK failed to check the digest algorithm strength when generating DSA signatures. The use of a digest weaker than the key strength could lead to the generation of signatures that were weaker than expected. (CVE-2016-0695 )"); 
script_tag(name : "solution", value : "Run yum update java-1.7.0-openjdk to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2016-693.html");
script_cve_id("CVE-2016-0695","CVE-2016-3425","CVE-2016-0686","CVE-2016-3427","CVE-2016-0687");
script_tag(name:"cvss_base", value:"10.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
script_copyright("Eero Volotinen");
script_family("Amazon Linux Local Security Checks");
exit(0);
}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");
release = get_kb_item("ssh/login/release");
res = "";
if(release == NULL)
{
 exit(0);
}
if(release == "AMAZON")
{
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-demo", rpm:"java-1.7.0-openjdk-demo~1.7.0.101~2.6.6.1.67.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-debuginfo", rpm:"java-1.7.0-openjdk-debuginfo~1.7.0.101~2.6.6.1.67.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-devel", rpm:"java-1.7.0-openjdk-devel~1.7.0.101~2.6.6.1.67.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-src", rpm:"java-1.7.0-openjdk-src~1.7.0.101~2.6.6.1.67.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk", rpm:"java-1.7.0-openjdk~1.7.0.101~2.6.6.1.67.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-javadoc", rpm:"java-1.7.0-openjdk-javadoc~1.7.0.101~2.6.6.1.67.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
