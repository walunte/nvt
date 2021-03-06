###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_gcm_kvm_webinterface_detect.nasl 6065 2017-05-04 09:03:08Z teissa $
#
# IBM GCM16 and GCM32 Global Console Managers Detection
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
 script_oid("1.3.6.1.4.1.25623.1.0.105176");
 script_tag(name:"cvss_base", value:"0.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_tag(name:"qod_type", value:"remote_banner");
 script_version ("$Revision: 6065 $");
 script_tag(name:"last_modification", value:"$Date: 2017-05-04 11:03:08 +0200 (Thu, 04 May 2017) $");
 script_tag(name:"creation_date", value:"2015-01-21 12:16:43 +0100 (Wed, 21 Jan 2015)");
 script_name("IBM GCM16 and GCM32 Global Console Managers iWebinterface Detection");

 script_tag(name: "summary" , value: "The script sends a connection request to the server and attempts to detect
the IBM GCM16 and GCM32 Global Console Managers Webinterface from the reply.");


 script_category(ACT_GATHER_INFO);
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 443);
 exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

http_port = get_http_port( default:443 );

if( http_port )
{
  url = '/login.php';
  req = http_get( item:url, port:http_port );
  buf = http_send_recv( port:http_port, data:req, bodyonly:FALSE );

  if( egrep( pattern:'<title>GCM(16|32) Explorer</title>', string:buf ) && ">User Login" >< buf )
  {
    set_kb_item( name:"GCM_16_32/web/installed", value:TRUE);
    if( "GCM16" >< buf )
      cpe = 'cpe:/o:ibm:global_console_manager_16_firmware';
    else
      cpe = 'cpe:/o:ibm:global_console_manager_32_firmware';

    if( cpe )
      register_product( cpe:cpe, location:url, port:http_port );

    set_kb_item(name:"GCM_16_32/web/port", value:http_port );

    log_message( port:http_port );
    exit( 0 );
  }
}

exit( 0 );

