###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_elasticsearch_kibana_detect.nasl 55217 2016-06-21 12:44:48 +0530 June$
#
# Elasticsearch Kibana Version Detection
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.808087");
  script_version("$Revision: 6306 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-06-11 21:08:57 +0200 (Sun, 11 Jun 2017) $");
  script_tag(name:"creation_date", value:"2016-06-21 12:44:48 +0530 (Tue, 21 Jun 2016)");
  script_name("Elasticsearch Kibana Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 9200, 5601);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"Detection of installed version
  of Elasticsearch Kibana.

  This script sends HTTP GET request and try to ensure the presence of
  Elasticsearch Kibana from the response.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:5601 );

foreach dir( make_list_unique( "/", "/kibana", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";

  url = dir + "/app/kibana";
  res = http_get_cache( item:url, port:port );

  if( res =~ "^HTTP/1\.[01] 200" && ( "kbn-name: kibana" >< res || "<title>Kibana</title>" >< res ) ) {

    version = "unknown";
    vers = eregmatch( pattern:"kbn-version: ([0-9.]+)", string:res );
    if( vers[1] ) {
      version = vers[1];
    } else {
      vers = eregmatch( pattern:"version&quot;:&quot;([0-9.]+)", string:res );
      if( vers[1] ) version = vers[1];
    }

    replace_kb_item( name:"Elasticsearch/Kibana/Installed", value:TRUE );

    cpe = build_cpe( value:version, exp:"^([0-9.]+)", base:"cpe:/a:elasticsearch:kibana:" );
    if( ! cpe )
      cpe = "cpe:/a:elasticsearch:kibana";

    register_product( cpe:cpe, location:url, port:port );

    log_message( data:build_detection_report( app:"Elasticsearch Kibana",
                                              version:version,
                                              install:url,
                                              cpe:cpe,
                                              concluded:vers[0] ),
                                              port:port );
  }
}

exit( 0 );
