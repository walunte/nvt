###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_safari_webcore_webkit_xss_vuln_macosx.nasl 6521 2017-07-04 14:51:10Z cfischer $
#
# Apple Safari Webcore Webkit 'XSSAuditor.cpp' XSS Vulnerability (Mac OS X)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

tag_impact = "Successful exploitation will allow attackers to bypass a
cross-site scripting (XSS) protection mechanism via a crafted string.

Impact Level: Application";

tag_affected = "Apple Safari version 5.1.7 on Mac OS X";

tag_insight = "The flaw is due to 'html/parser/XSSAuditor.cpp' in WebCore in
WebKit does not consider all possible output contexts of reflected data.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is installed with Apple Safari and is prone to cross
site scripting vulnerability.";

if(description)
{
  script_id(803108);
  script_version("$Revision: 6521 $");
  script_cve_id("CVE-2012-5851");
  script_bugtraq_id(56570);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-07-04 16:51:10 +0200 (Tue, 04 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-11-21 16:01:28 +0530 (Wed, 21 Nov 2012)");
  script_name("Apple Safari Webcore Webkit 'XSSAuditor.cpp' XSS Vulnerability (Mac OS X)");
  script_xref(name : "URL" , value : "https://bugs.webkit.org/show_bug.cgi?id=92692");
  script_xref(name : "URL" , value : "http://blog.opensecurityresearch.com/2012/09/simple-cross-site-scripting-vector-that.html");

  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("macosx_safari_detect.nasl");
  script_mandatory_keys("AppleSafari/MacOSX/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

# Variable Initialization
safVer = NULL;

safVer = get_kb_item("AppleSafari/MacOSX/Version");
if(!safVer){
  exit(0);
}

## Check for Apple Safari Versions 5.1.7
if(version_is_equal(version:safVer, test_version:"5.1.7")){
  security_message(0);
}
