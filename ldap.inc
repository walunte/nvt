###############################################################################
# OpenVAS Include File
# $Id: ldap.inc 5773 2017-03-29 16:57:00Z mime $
#
# Functions for LDAP
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software
# Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301
# USA.
#
# $Revision: 5773 $
#
###############################################################################

function ldap_alive( port ) {

  local_var port, req, buf, response, soc;

  if( ! port ) {
    set_kb_item( name:"nvt_debug_empty/" + get_script_oid(), value:get_script_oid() + "#-#port#-#ldap_alive" );
    return;
  }

  req = raw_string( 0x30,0x84,0x00,0x00,0x00,0x59,0x02,0x01,0x05,0x63,0x84,0x00,
                    0x00,0x00,0x50,0x04,0x13,0x64,0x63,0x3d,0x6f,0x70,0x65,0x6e,
                    0x76,0x61,0x73,0x64,0x63,0x2c,0x64,0x63,0x3d,0x6e,0x65,0x74,
                    0x0a,0x01,0x02,0x0a,0x01,0x00,0x02,0x01,0x00,0x02,0x01,0x00,
                    0x01,0x01,0x00,0xa3,0x84,0x00,0x00,0x00,0x13,0x04,0x0b,0x6f,
                    0x62,0x6a,0x65,0x63,0x74,0x43,0x6c,0x61,0x73,0x73,0x04,0x04,
                    0x75,0x73,0x65,0x72,0x30,0x84,0x00,0x00,0x00,0x0d,0x04,0x0b,
                    0x64,0x69,0x73,0x70,0x6c,0x61,0x79,0x4e,0x61,0x6d,0x65 );

  soc = open_sock_tcp( port );
  if( ! soc ) return FALSE;

  send( socket:soc, data:req );
  buf = recv( socket:soc, length:32 );
  close( soc );

  if( isnull( buf ) ) return FALSE;

  # TODO: This is still quite fragile...
  # We shouldn't do a service detection just on the base of one single response char
  if( strlen( buf ) > 5 ) {
    response = hexstr( buf[0] );
    if( response =~ "^30$" ) return TRUE;
  }
  return FALSE;
}

function ldap_starttls_supported( port ) {

  local_var port, soc, req, recv, er_length, extended_response;

  if( ! port ) {
    set_kb_item( name:"nvt_debug_empty/" + get_script_oid(), value:get_script_oid() + "#-#port#-#ldap_starttls_supported" );
    return;
  }

  soc = open_sock_tcp( port );
  if( ! soc ) return FALSE;

  req = raw_string( 0x30,0x1d,0x02,0x01,0x01,0x77,0x18,0x80,
                    0x16,0x31,0x2e,0x33,0x2e,0x36,0x2e,0x31,
                    0x2e,0x34,0x2e,0x31,0x2e,0x31,0x34,0x36,
                    0x36,0x2e,0x32,0x30,0x30,0x33,0x37 );

  send( socket:soc, data:req );
  recv = recv( socket:soc, length:1024 );
  close( soc );

  if( ! recv || isnull( recv ) || strlen( recv ) < 6 ) return FALSE;

  if( ord( recv[0] ) == 48 ) {
    er_length = get_ber_size( buf:recv, offset:6 );
    extended_response = substr( recv, strlen( recv ) - er_length, strlen( recv ) );

    if( extended_response && strlen( extended_response ) > 2 && ord( extended_response[2] ) == 0 ) {
      return TRUE;
    }
  }
}

# extract the message length
# WARNING offset is updated by the function call (reference) !
function get_ber_size( buf, offset ) {

  local_var lm_length, length_length, i;

  lm_length = ord( buf[offset] );
  offset++;

  if( lm_length > 128 ) {
    # undetermined length message
    length_length = lm_length - 128;
    lm_length = 0;
    for( i = 0; i < length_length; i++ ) {
      lm_length = ( lm_length << 8 ) | ord( buf[offset++] );
    }
  }
  return lm_length;
}

function is_ldapv3( port ) {

  local_var port, offset, lm_length, messageId_length, bindResponse_length, resultCode_length, resultCode, i, soc, buf;

  if( ! port ) {
    set_kb_item( name:"nvt_debug_empty/" + get_script_oid(), value:get_script_oid() + "#-#port#-#is_ldapv3" );
    return;
  }

  soc = open_sock_tcp( port );
  if( ! soc ) return FALSE;

  req = raw_string( 0x30,0x0c,0x02,0x01,0x01,0x60,0x07,
                    0x02,0x01,0x03,0x04,0x00,0x80,0x00 ); # v3 bind
  send( socket:soc, data:req );

  buf = recv( socket:soc, length:128 );
  close( soc );

  if( ! buf ) return FALSE;

  # decode ldapMessage length (encoded as BER)
  offset = 0;
  if( ord( buf[offset++] ) != 48 ) return FALSE; # (0x30)
  lm_length = get_ber_size( buf, offset );
  if( strlen( buf ) < lm_length + offset ) return FALSE; # whoops, we have not enough data (should never happen since bindResponse is a short message)

  # we are not at offset = message id, we skip it
  if( ord( buf[offset++] ) != 2 ) return FALSE; # messageId is an INT
  messageId_length = get_ber_size( buf, offset );
  offset += messageId_length;

  # now enter the bindResponse
  if( ord( buf[offset++] ) != 97 ) return FALSE; # (0x61)
  bindResponse_length = get_ber_size( buf, offset );

  # now dig into response code
  if( ord( buf[offset++] ) != 10 ) return FALSE; # (0x0A)
  resultCode_length = get_ber_size( buf, offset );
  resultCode = 0;
  for( i = 0; i < resultCode_length; i++ ) {
    resultCode = ( resultCode << 8 ) | ord( buf[offset++] );
  }
  if( resultCode == 0 ) return TRUE; # server has accepted the v3 bind

  return FALSE;
}

function get_ldap_port( default ) {

  local_var default, port;

  if( ! default ) set_kb_item( name: "nvt_debug_empty/" + get_script_oid(), value:get_script_oid() + "#-#default#-#get_ldap_port" );

  port = get_kb_item( "Services/ldap" );
  if( port ) default = port;

  # PJL ports printing everything sent to them
  # so exit for such a port here
  if( ldap_is_pjl_port( port:default ) ) exit( 0 );

  if( ! get_port_state( default ) ) exit( 0 );

  return default;
}

# Duplicated from misc_func.inc
function ldap_is_pjl_port( port ) {

  local_var port, pjl_ports, pjl_port;

  if( ! port ) {
    set_kb_item( name:"nvt_debug_empty/" + get_script_oid(), value:get_script_oid() + "#-#port#-#ldap_is_pjl_port" );
    return;
  }

  pjl_ports = get_kb_list( 'Services/PJL' );
  if( ! pjl_ports ) return;

  foreach pjl_port( pjl_ports ) {
    if( port == pjl_port ) return TRUE;
  }

  return;
}

function ldap_int( number )
{
  local_var number, x, len;

  len = FALSE;
  while( x < strlen( number ) )
  {
    len = len * 256 + ord( number[ x ] );
    x++;
  }

  return len;

}

function ldap_send_recv( req, sock )
{
  local_var req, sock, res, len;

  if( ! req || ! sock )
    return;

  send( socket:sock, data:req );

  res = recv( socket:sock, length:2 );

  if( strlen( res ) < 2 )
    return;

  if( res[0] != '\x30' )
    return;

  len = ord( res[1] );

  if( len >= 128 )
  {
    len -= 128;
    next_len = recv( socket:sock, length:len );

    if( strlen( next_len ) < len )
      return;

    len = ldap_int( number:next_len );

    if( ! len || len < 1 )
      return;
  }

  return( recv( socket:sock, length:len ) );
}
