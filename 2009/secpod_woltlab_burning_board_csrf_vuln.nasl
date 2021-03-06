###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_woltlab_burning_board_csrf_vuln.nasl 5148 2017-01-31 13:16:55Z teissa $
#
# WoltLab Burning Board Cross-Site Request Forgery Vulnerability
#
# Authors:
# Nikita MR <rnikita@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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

tag_impact = "Attackers can exploit this issue to delete private messages by
sending malicious input in the 'pmID' parameter in a delete action in a PM
page.

Impact Level: Application";

tag_affected = "WoltLab Burning Board version 3.x";

tag_insight = "An error arises in index.php due to improper sanitization of
user-supplied input which may allows remote attackers to hijack the users
authentication.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is running WoltLab Burning Board and is prone to
Cross-Site Request Forgery vulnerability.";

if(description)
{
  script_id(900937);
  script_version("$Revision: 5148 $");
  script_tag(name:"last_modification", value:"$Date: 2017-01-31 14:16:55 +0100 (Tue, 31 Jan 2017) $");
  script_tag(name:"creation_date", value:"2009-09-16 15:34:19 +0200 (Wed, 16 Sep 2009)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2008-7192");
  script_name("WoltLab Burning Board Cross-Site Request Forgery Vulnerability");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/39990");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/archive/1/487139/100/200/threaded");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Web application abuses");
  script_dependencies("secpod_woltlab_burning_board_detect.nasl");
  script_require_ports("Services/www", 80);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("http_func.inc");
include("version_func.inc");

wbbPort = get_http_port(default:80);
if(!wbbPort)
{
  exit(0);
}

wbbVer = get_kb_item("www/" + wbbPort + "/BurningBoard");
wbbVer = eregmatch(pattern:"^(.+) under (/.*)$", string:wbbVer);

if(wbbVer[1] =~ "^3\..*"){
  security_message(wbbPort);
}
