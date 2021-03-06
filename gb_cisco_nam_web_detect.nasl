###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_nam_web_detect.nasl 7052 2017-09-04 11:50:51Z teissa $
#
# Cisco Network Analysis Module Web Interface Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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
 script_oid("1.3.6.1.4.1.25623.1.0.105458");
 script_tag(name:"cvss_base", value:"0.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version ("$Revision: 7052 $");
 script_tag(name:"last_modification", value:"$Date: 2017-09-04 13:50:51 +0200 (Mon, 04 Sep 2017) $");
 script_tag(name:"creation_date", value:"2015-11-18 13:39:52 +0100 (Wed, 18 Nov 2015)");
 script_name("Cisco Network Analysis Module Web Interface Detection");

 script_tag(name: "summary" , value: "This script performs HTTP based detection of the Cisco Network Analysis Module Web Interface");

 script_tag(name:"qod_type", value:"remote_banner");

 script_category(ACT_GATHER_INFO);
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

port = get_http_port( default:80 );

url = '/authenticate/login';
req = http_get( item:url, port:port );
buf = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );

if( "<title>NAM Login</title>" >!< buf || "Cisco Prime" >!< buf ) exit( 0 );

set_kb_item( name:"cisco_nam/webinterface/installed", value:TRUE );
set_kb_item( name:"cisco_nam/webinterface/port", value:port );

cpe = 'cpe:/o:cisco:network_analysis_module_firmware';

report = 'Cisco Network Analysis Module Web Interface is running at this port.\nCPE: '+ cpe;
log_message( port:port, data:report );

register_product( cpe:cpe );

exit(0);

