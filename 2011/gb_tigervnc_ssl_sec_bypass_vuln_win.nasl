###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_tigervnc_ssl_sec_bypass_vuln_win.nasl 7019 2017-08-29 11:51:27Z teissa $
#
# TigerVNC SSL Certificate Validation Security Bypass Vulnerability (Windows)
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
###############################################################################

tag_impact = "Successful exploitation allows attackers to perform
man-in-the-middle attacks or impersonate trusted servers, which will aid in
further attacks.

Impact Level: Application";

tag_affected = "TigerVNC version 1.1beta1";

tag_insight = "The flaw is caused by improper verification of server's X.509
certificate, which allows man-in-the-middle attackers to spoof a TLS VNC server
via an arbitrary certificate.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is installed with TigerVNC and is prone to security
bypass vulnerability.";

if(description)
{
  script_id(801898);
  script_version("$Revision: 7019 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-29 13:51:27 +0200 (Tue, 29 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-06-13 15:28:04 +0200 (Mon, 13 Jun 2011)");
  script_cve_id("CVE-2011-1775");
  script_bugtraq_id(47738);
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_name("TigerVNC SSL Certificate Validation Security Bypass Vulnerability (Windows)");
  script_xref(name : "URL" , value : "https://bugzilla.redhat.com/show_bug.cgi?id=702470");
  script_xref(name : "URL" , value : "http://www.mail-archive.com/tigervnc-devel@lists.sourceforge.net/msg01345.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_tigervnc_detect_win.nasl");
  script_require_keys("TigerVNC/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

## Get version from KB
ver = get_kb_item("TigerVNC/Win/Ver");
if(ver)
{
  ## Check for TigerVNC Version 1.1beta1 (1.0.90)
  if(version_is_equal(version:ver, test_version:"1.0.90")){
    security_message(0);
  }
}
