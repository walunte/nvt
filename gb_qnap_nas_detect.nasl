###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_qnap_nas_detect.nasl 7079 2017-09-08 05:40:51Z ckuersteiner $
#
# QNAP NAS Detection
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
 script_tag(name:"cvss_base", value:"0.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_oid("1.3.6.1.4.1.25623.1.0.103875");
 script_version ("$Revision: 7079 $");
 script_tag(name:"last_modification", value:"$Date: 2017-09-08 07:40:51 +0200 (Fri, 08 Sep 2017) $");
 script_tag(name:"creation_date", value:"2014-01-09 18:50:23 +0100 (Thu, 09 Jan 2014)");
 script_name("QNAP NAS Detection");

 script_tag(name : "summary" , value : "The script sends a connection request to the server and attempts to
 extract the version number from the reply.");

 script_category(ACT_GATHER_INFO);
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80, 8080);
 script_exclude_keys("Settings/disable_cgi_scanning");

 script_tag(name:"qod_type", value:"remote_banner");
 

 exit(0);
}

include("http_func.inc");
include("host_details.inc");

port = get_http_port( default:8080 );

host = get_host_name();
if( port != 80 && port != 443 )
  host += ':' + port;

urls = make_list( '/cgi-bin/login.html', '/cgi-bin/html/login.html' );

foreach url ( urls ) 
{
  req = http_get( item:url, port:port );
  buf = http_send_recv( port:port, data:req, bodyonly:FALSE );

  if ( "<title>Welcome to QNAP Turbo NAS" >!< buf ) continue;

  if ( "QTS_REMEMBER_ME" >< buf || "QTS_SSL_LOGIN" >< buf )
    set_kb_item( name:"qnap/qts", value:TRUE );

  req = 'POST /cgi-bin/authLogin.cgi HTTP/1.1\r\n' +
        'Host: ' + host + '\r\n' + 
        'User-Agent: ' + OPENVAS_HTTP_USER_AGENT + '\r\n' + 
        'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n' +
        'Accept-Language: de-de,de;q=0.8,en-us;q=0.5,en;q=0.3\r\n' + 
        'Accept-Encoding: deflate\r\n' + 
        'Content-Type: application/x-www-form-urlencoded; charset=UTF-8\r\n' + 
        'Referer: http://' + host + ':' + port + '/cgi-bin/login.html\r\n' + 
        'Content-Length: 4\r\n' + 
        'Connection: keep-alive\r\n' + 
        'Pragma: no-cache\r\n' + 
        'Cache-Control: no-cache\r\n' +
        '\r\n' + 
        '&r=0';

  buf = http_send_recv(port:port, data:req, bodyonly:FALSE);

  if ( "QDocRoot" >!< buf ) continue;
 
  vers = 'unknown';
  version = eregmatch( pattern:"<version><!\[CDATA\[([^]]+)\]\]></version>", string: buf);
  if ( ! isnull( version[1] ) )
    vers = version[1];

  build = eregmatch( pattern:"<build><!\[CDATA\[([^]]+)\]\]></build>", string: buf);
  if ( ! isnull( build[1] ) )
    build = build[1];

  model = eregmatch( pattern:"<modelName><!\[CDATA\[([^]]+)\]\]></modelName>", string: buf);
  if ( ! isnull( model[1] ) ) {
    model = model[1];
    cpe_model = tolower(str_replace(string:model, find:" ", replace:"_"));
  }

  ##model and ##displaymodel are two different values
  displaymodel =  eregmatch( pattern:"<displayModelName><!\[CDATA\[([^]]+)\]\]></displayModelName>", string: buf);
  if ( ! isnull( displaymodel[1] ) ) {
    displaymodel = displaymodel[1];
  }

  cpe = 'cpe:/h:qnap';
 
  if ( cpe_model )
    cpe += ':' + cpe_model;

  if ( vers != 'unknown')
    cpe += ':' + vers;

  if ( build ) 
    cpe += '_' + build;

  set_kb_item(name:"qnap/model", value:model);
  set_kb_item(name:"qnap/version", value:vers);
  set_kb_item(name:"qnap/build", value:build);
  set_kb_item(name:"qnap/port", value:port);
  set_kb_item(name:"qnap/dismodel", value:displaymodel);

  register_product(cpe:cpe, location:'/', port:port);

  log_message(data: build_detection_report(app:"'QNAP " + model + "'", version:vers, install:'/', cpe:cpe, concluded: version[0]),
              port:port);

  exit(0);

}

exit(0);
