###############################################################################
# OpenVAS Vulnerability Test
# $Id: sw_tableau_server_detect.nasl 7000 2017-08-24 11:51:46Z teissa $
#
# Tableau Server Detection
#
# Authors:
# Christian Fischer <info@schutzwerk.com>
#
# Copyright:
# Copyright (c) 2015 SCHUTZWERK GmbH
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.111048");
  script_version("$Revision: 7000 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-24 13:51:46 +0200 (Thu, 24 Aug 2017) $");
  script_tag(name:"creation_date", value:"2015-11-09 12:00:00 +0100 (Mon, 09 Nov 2015)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_name("Tableau Server Detection");

  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2015 SCHUTZWERK GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name : "summary" , value : "The script sends a HTTP
  request to the server and attempts to identify a Tableau Server
  and its version from the reply.");

  script_tag(name:"qod_type", value:"remote_banner");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");
include("cpe.inc");

port = get_http_port( default:80 );
banner = get_http_banner( port:port );

if( concluded = eregmatch( string: banner, pattern: "Server: Tableau", icase:TRUE ) ) {
  installed = 1;
  concl = concluded[0];
  version = "unknown";
}

res = http_get_cache( item:"/", port:port );

if( concluded = eregmatch( string: res, pattern: "VizPortal.BuildId" ) ) {
  installed = 1;
  concl = concluded[0];
  version = "unknown";
}

req = http_get( item:"/auth", port:port );
res = http_keepalive_send_recv(port:port, data:req);

if( concluded = eregmatch( string: res, pattern: ">Version&nbsp;([0-9.]+)" ) ) {
  installed = 1;
  concl = concluded[0];
  version = concluded[1];
}

if( installed ) {

  set_kb_item( name:"www/" + port + "/tableau_server", value:version );
  set_kb_item( name:"tableau_server/installed", value:TRUE );

  cpe = build_cpe( value: version, exp:"^([0-9.]+)",base:"cpe:/a:tableausoftware:tableau_server:" );
  if( isnull( cpe ) )
    cpe = 'cpe:/a:tableausoftware:tableau_server';

  register_product( cpe:cpe, location:port + '/tcp', port:port );

  log_message( data: build_detection_report( app:"Tableau Server",
                                                 version:version,
                                                 install:port + '/tcp',
                                                 cpe:cpe,
                                                 concluded: concl),
                                                 port:port);
}

exit(0);
