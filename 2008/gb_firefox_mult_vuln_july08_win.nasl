###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_firefox_mult_vuln_july08_win.nasl 6519 2017-07-04 14:08:14Z cfischer $
#
# Mozilla Firefox Multiple Vulnerability July-08 (Windows)
#
# Authors:
# Chandan S <schandan@secpod.com>
#
# Copyright:
# Copyright (c) 2008 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation could result in remote arbitrary code execution,
  spoofing attacks, sensitive information disclosure, and JavaScript code can
  be executed with the privileges of JAR's signer.
  Impact Level: System";
tag_summary = "The host is installed with Mozilla Firefox browser, that is prone
  to multiple vulnerabilities.";

tag_affected = "Firefox version prior to 2.0.0.15 on Windows.";
tag_insight = "Issues in browser are due to,
  - multiple errors in the layout and JavaScript engines that can corrupt
    memory.
  - error while handling unprivileged XUL documents that can be exploited to
    load chrome scripts from a fastload file via <script> elements.
  - error in mozIJSSubScriptLoader.LoadScript function can bypass
    XPCNativeWrappers.
  - error in block re-flow process, which can potentially lead to crash.
  - error in processing file URLs contained within local directory listings.
  - errors in the implementation of the Javascript same origin policy
  - errors in the verification of signed JAR files.
  - improper implementation of file upload forms result in uploading specially
    crafted DOM Range and originalTarget elements.
  - error in Java LiveConnect implementation.
  - error in processing of Alt Names provided by peer.
  - error in processing of windows URL shortcuts.";
tag_solution = "Upgrade to Firefox version 2.0.0.15
  http://www.mozilla.com/en-US/firefox/all-older.html";

if(description)
{
  script_id(800011);
  script_version("$Revision: 6519 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-04 16:08:14 +0200 (Tue, 04 Jul 2017) $");
  script_tag(name:"creation_date", value:"2008-10-06 13:07:14 +0200 (Mon, 06 Oct 2008)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2008-2798", "CVE-2008-2799", "CVE-2008-2800", "CVE-2008-2801",
                "CVE-2008-2802", "CVE-2008-2803", "CVE-2008-2805", "CVE-2008-2806",
                "CVE-2008-2807", "CVE-2008-2808", "CVE-2008-2809", "CVE-2008-2810",
                "CVE-2008-2811");
  script_bugtraq_id(30038);
  script_xref(name:"CB-A", value:"08-0109");
  script_name("Mozilla Firefox Multiple Vulnerability July-08 (Windows)");


  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2008 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_win.nasl");
  script_mandatory_keys("Firefox/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-21.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-22.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-23.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-24.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-25.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-27.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-28.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-29.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-30.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-31.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-32.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-33.html");
  exit(0);
}

ffVer = get_kb_item("Firefox/Win/Ver");
if(!ffVer){
  exit(0);
}

# Grep for firefox version < 2.0.0.15
if(egrep(pattern:"^([01]\..*|2\.0(\.0\.(0?[0-9]|1[0-4]))?)$", string:ffVer)){
  security_message(0);
}
