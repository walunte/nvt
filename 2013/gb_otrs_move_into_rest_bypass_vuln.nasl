###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_otrs_move_into_rest_bypass_vuln.nasl 6755 2017-07-18 12:55:56Z cfischer $
#
# OTRS move_into Restriction Bypass Vulnerability
#
# Authors:
# Shashi Kiran N <nskiran@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
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

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.803920";
CPE = "cpe:/a:otrs:otrs";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6755 $");
  script_cve_id("CVE-2009-5056");
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:S/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-07-18 14:55:56 +0200 (Tue, 18 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-09-20 18:39:20 +0530 (Fri, 20 Sep 2013)");
  script_name("OTRS move_into Restriction Bypass Vulnerability");

tag_summary =
"This host is installed with OTRS (Open Ticket Request System) and is prone to
restriction bypass vulnerability.";

tag_vuldetect =
"Get the installed version of OTRS with the help of detect NVT and check the
version is vulnerable or not.";

tag_insight =
"A flaw exists in move_into permission setting which fails to enforce permission
setting for a queue";

tag_impact =
"Successful exploitation will allow remote authenticated users to bypass
intended access restrictions by selecting the ticket from the watched-tickets list.

Impact Level: Application";

tag_affected =
"OTRS (Open Ticket Request System) version before 2.4.0-beta2";

tag_solution =
"Upgrade to OTRS (Open Ticket Request System) version 2.4.0-beta2 or
later, For updates refer to http://www.otrs.com/en/";


  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "affected" , value : tag_affected);

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
  script_dependencies("secpod_otrs_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("OTRS/installed");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

## Variable initialisation
port = "";
vers = "";

## Get Application HTTP Port
if(!port = get_app_port(cpe:CPE, nvt:SCRIPT_OID)){
  exit(0);
}

## Get application version
if(vers = get_app_version(cpe:CPE, nvt:SCRIPT_OID, port:port))
{
  if(version_is_less(version: vers, test_version: "2.4.0.beta2"))
  {
      security_message(port:port);
      exit(0);
  }

}
