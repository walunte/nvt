###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_file_replica_pro_detect.nasl 6032 2017-04-26 09:02:50Z teissa $
#
# File Replication Pro Remote Version Detection
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.806688");
  script_version("$Revision: 6032 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-04-26 11:02:50 +0200 (Wed, 26 Apr 2017) $");
  script_tag(name:"creation_date", value:"2016-03-01 14:45:33 +0530 (Tue, 01 Mar 2016)");
  script_name("File Replication Pro Remote Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_require_ports("Services/www", 9100);

  script_tag(name:"summary", value:"Detection of installed version of
  File Replication Pro.

  This script sends HTTP GET request and try to get the version from the
  response, and sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

## Get HTTP Port
port = get_http_port( default:9100 );

rcvRes = http_get_cache( item: "/Login.jsp", port:port );

## Confirm the application
if( rcvRes && "FileReplicationPro Management Console<" >< rcvRes ) {

  version = "unknown";
  install = "/";

  set_kb_item( name:"FileReplicationPro/Installed", value:TRUE );
  set_kb_item( name:"www/" + port + "/FileReplicationPro", value:version );

  ##No CPE name found, assigning cpe:/a:file:replication:pro as CPE name
  cpe = "cpe:/a:file:replication:pro";

  register_product( cpe:cpe, location:install, port:port );

  log_message( data:build_detection_report( app:"File Replication Pro",
                                            version:version,
                                            install:install,
                                            cpe:cpe ),
                                            port:port );
}

exit( 0 );
