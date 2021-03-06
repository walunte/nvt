###############################################################################
# OpenVAS Vulnerability Test
# $Id: centreon_detect.nasl 7143 2017-09-15 11:37:02Z santu $
#
# Centreon Detection
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100427");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 7143 $");
 script_tag(name:"last_modification", value:"$Date: 2017-09-15 13:37:02 +0200 (Fri, 15 Sep 2017) $");
 script_tag(name:"creation_date", value:"2010-01-06 10:44:19 +0100 (Wed, 06 Jan 2010)");
 script_tag(name:"cvss_base", value:"0.0");
 script_name("Centreon Detection");
 script_category(ACT_GATHER_INFO);
 script_tag(name:"qod_type", value:"remote_banner");
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");

 script_tag(name: "summary" , value: "The script sends a connection request to the server and attempts to
 extract the version number from the reply.");

 script_xref(name : "URL" , value : "http://www.centreon.com/");
 exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("global_settings.inc");
include("host_details.inc");
include("cpe.inc");

port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

foreach dir( make_list_unique( "/centreon", cgi_dirs( port:port ) ) ) {

 install = dir;
 if( dir == "/" ) dir = "";
 url = dir + "/index.php";
 buf = http_get_cache( item:url, port:port );
 if( buf == NULL )continue;

 if(egrep(pattern: "<title>Centreon - IT & Network Monitoring</title>", string: buf, icase: TRUE) &&
    "LoginInvitVersion" >< buf)
 {

    vers = string("unknown");
    ### try to get version 
    version = eregmatch(string: buf, pattern: '<td class="LoginInvitVersion"><br />[^0-9.]+([0-9.]+)[^<]+</td>',icase:TRUE);
    if(!version){
      version = eregmatch(string: buf, pattern: '<span>.*v. ([0-9.]+)',icase:FALSE);
    }

    if( ! isnull( version[1] ) )
      vers = chomp( version[1] );

    set_kb_item(name: string("www/", port, "/centreon"), value: string(vers," under ",install));
    set_kb_item( name:"centreon/installed", value:TRUE );

    cpe = build_cpe(value:vers, exp:"^([0-9.]+)", base:"cpe:/a:centreon:centreon:");
    if( isnull( cpe ) )
      cpe = 'cpe:/a:centreon:centreon';

    register_product(cpe:cpe, location:install, port:port);

    log_message( data: build_detection_report( app:"Centreon",
                                               version:vers,
                                               install:install,
                                               cpe:cpe,
                                               concluded: vers),
                 port:port );
  }
}

exit(0);