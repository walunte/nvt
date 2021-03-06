###################################################################
# OpenVAS Network Vulnerability Test
# $Id: smb_nativelanman.nasl 7281 2017-09-26 14:10:31Z cfischer $
#
# SMB NativeLanMan
#
# LSS-NVT-2009-011
#
# Developed by LSS Security Team <http://security.lss.hr>
#
# Copyright (C) 2009 LSS <http://www.lss.hr>
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
# You should have received a copy of the GNU General Public
# License along with this program. If not, see
# <http://www.gnu.org/licenses/>.
###################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.102011");
  script_version("$Revision: 7281 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-09-26 16:10:31 +0200 (Tue, 26 Sep 2017) $");
  script_tag(name:"creation_date", value:"2009-09-18 16:06:42 +0200 (Fri, 18 Sep 2009)");
  script_name("SMB NativeLanMan");
  script_category(ACT_GATHER_INFO);
  script_family("Service detection");
  script_copyright("Copyright (C) 2009 LSS");
  script_dependencies("cifs445.nasl", "netbios_name_get.nasl");
  script_require_ports(139, 445);

  script_tag(name:"summary", value:"It is possible to extract OS, domain and SMB server information
  from the Session Setup AndX Response packet which is generated during NTLM authentication.");

  script_tag(name:"qod_type", value:"remote_active");

  exit(0);
}

include("misc_func.inc");
include("smb_nt.inc");
include("global_settings.inc");
include("host_details.inc");
include("cpe.inc");

SCRIPT_DESC = "SMB NativeLanMan";

port = kb_smb_transport();
name = kb_smb_name(); # This is only used when talking to port 139

soc = open_sock_tcp( port );
if( ! soc ) exit( 0 );

r = smb_session_request( soc:soc, remote:name );
if( ! r ) {
  close( soc );
  exit( 0 );
}

# TODO: Implement "usesmbv1" in smb_neg_prot() and use this here (This NVT needs SMBv1)
# Then we could also pass the credentials as NTLMSSP/NTLMv2 from the KB
prot = smb_neg_prot_NTLMv1( soc:soc );
if( ! prot ) {
  close( soc );
  exit( 0 );
}

cs = smb_neg_prot_cs( prot:prot );

ret = smb_session_setup_NTLMvN( soc:soc, login:"", password:"", domain:"", cs:cs, version:1 );
if( ! ret ) {
  close( soc );
  exit( 0 );
}

close( soc );

s = hexstr( ret ); # convert response packet to a "string" hex
l = strlen( s );
c = 0; # counter
out = NULL;

# according to www.snia.org/tech_activities/CIFS/CIFS-TR-1p00_FINAL.pdf
# domain, server & os info are the last 3 strings in the packet
# so there is no point in going through the whole packet

for( x = l-3; x > 0 && c < 3; x = x - 2 ) {

  if( ( s[x] + s[x-1] ) == "00" ) {
    c++;
    if( c == 1 ) {

      wg_str = hex2raw( s:out );

      if( wg_str && ! isnull( wg_str ) ) {
        set_kb_item( name:"SMB/workgroup", value:wg_str );
        set_kb_item( name:"SMB/DOMAIN", value:wg_str );
        info = "Detected SMB workgroup: " + wg_str + '\n';
        result += info;
        report = TRUE;
      }
    }

    if( c == 2 ) {

      smb_str = hex2raw( s:out );

      if( smb_str && ! isnull( smb_str ) ) {
        set_kb_item( name:"SMB/NativeLanManager", value:smb_str );
        set_kb_item( name:"SMB/SERVER", value:smb_str );
        info = "Detected SMB server: " + smb_str + '\n';
        result += info;
        report = TRUE;
      }

      if( "samba" >< tolower( smb_str ) ) {

        version = "unknown";
        install = port + '/tcp';
        vers = eregmatch( string:smb_str, pattern:"Samba ([0-9.]+)" );
        if( vers[1] ) version = vers[1];

        samba = TRUE;
        replace_kb_item( name:"SMB/samba", value:TRUE ); # TODO: Decide which one to use and update all other NVTs
        replace_kb_item( name:"samba/detected", value:TRUE );

        cpe = build_cpe( value:version, exp:"([0-9.]+)", base:"cpe:/a:samba:samba:" );
        if( ! cpe )
          cpe = "cpe:/a:samba:samba";

        register_product( cpe:cpe, location:install, port:port );

        log_message( data:build_detection_report( app:"Samba",
                                                  version:version,
                                                  install:install,
                                                  cpe:cpe,
                                                  concluded:smb_str,
                                                  extra:result ),
                                                  port:port );
      }
    }

    if( c == 3 ) {

      os_str = hex2raw( s:out );

      if( os_str && ! isnull( os_str ) ) {

        banner_type = "SMB/Samba banner";

        # At least Samba 4.2.10, 4.2.14 and 4.5.8 on Debian jessie and stretch has a os_str of "Windows 6.1"
        # but we can identify it from the smb_str: Samba 4.2.10-Debian, Samba 4.5.8-Debian
        # Older Debian versions have "Unix" as os_str and smb_str: like Samba 3.0.20-Debian
        # The same above is also valid for SLES:
        # SLES11: os_str: Unix, smb_str: Samba 3.6.3-0.58.1-3399-SUSE-CODE11-x86_64
        # SLES12: os_str: Windows 6.1, smb_str: Samba 4.4.2-29.4-3709-SUSE-SLE_12-x86_64
        if( samba && ( "windows" >< tolower( os_str ) || ( "unix" >< tolower( os_str ) && ( "debian" >< tolower( smb_str ) || "SUSE" >< smb_str ) ) ) ) {
          if( "debian" >< tolower( smb_str ) ) {
            # 4.2.10 was up to 8.6 and 4.2.14 was 8.7 or later
            # nb: Starting with Wheezy (7.x) we have minor releases within the version so we don't use an exact version like 7.0 as we can't differ between the OS in the banner here
            if( "Samba 4.2.10-Debian" >< smb_str || "Samba 4.2.14-Debian" >< smb_str ) {
              os_str = "Debian GNU/Linux 8";
            } else if( "Samba 4.5.8-Debian" >< smb_str ) {
              os_str = "Debian GNU/Linux 9";
            } else {
              os_str = "Debian GNU/Linux";
            }
          } else if ( "SUSE" >< smb_str ) {
            if( "CODE11" >< smb_str ) {
              os_str = "SUSE Linux Enterprise Server 11";
            } else if( "SLE_12" >< smb_str ) {
              os_str = "SUSE Linux Enterprise Server 12";
            } else {
              os_str = "Unknown SUSE";
            }
          # On other reporting the same "Windows 6.1" or simlar exit here for now with a generic OS registered
          # TODO: Recheck with other OS
          } else {
            register_and_report_os( os:"Linux/Unix", cpe:"cpe:/o:linux:kernel", banner_type:banner_type, port:port, banner:smb_str, desc:SCRIPT_DESC, runs_key:"unixoide" );
            exit( 0 );
          }
        }

        set_kb_item( name:"Host/OS/smb", value:os_str );
        set_kb_item( name:"SMB/OS", value:os_str );
        info = "Detected OS: "+ os_str + '\n';
        result += info;
        report = TRUE;
        banner = "OS String: " + os_str + "; SMB String: " + smb_str;

        if( "windows" >< tolower( os_str ) ) {
          #Example strings:
          #smb_str: Windows 10 Pro 6.3, os_str: Windows 10 Pro 10586
          #smb_str: Windows 10 Home 6.3, os_str: Windows 10 Home 10586
          #smb_str: Windows 2000 LAN Manager, os_str: Windows 5.1 -> Windows XP SP3, 32bit, German
          #smb_str: Windows 7 Enterprise 6.1, os_str: Windows 7 Enterprise 7601 Service Pack 1
          #smb_str: Windows 7 Enterprise 6.1, os_str: Windows 7 Enterprise 7600 -> No Service Pack
          #smb_str: Windows Server 2008 R2 Datacenter 6.1, os_str: Windows Server 2008 R2 Datacenter 7601 Service Pack 1
          #smb_str: Windows XP 5.2, os_str: Windows XP 3790 Service Pack 2 -> Windows XP SP2, 64bit
          #smb_str: Windows Server 2016 Standard 6.3, os_str: Windows Server 2016 Standard 14393
          if( "windows 10 " >< tolower( os_str ) ) {
            cpe = "cpe:/o:microsoft:windows_10";
            if( ver = get_version_from_build( string:os_str, win_name:"win10" ) ) cpe += ":" + ver;
            register_and_report_os( os:os_str, cpe:cpe, banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows 5.1" >< tolower( os_str ) && "windows 2000 lan manager" >< tolower( smb_str ) ) {
            register_and_report_os( os:"Windows XP", cpe:"cpe:/o:microsoft:windows_xp", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows 5.0" >< tolower( os_str ) && "windows 2000 lan manager" >< tolower( smb_str ) ) {
            register_and_report_os( os:"Windows 2000", cpe:"cpe:/o:microsoft:windows_2000", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows xp 5.2" >< tolower( smb_str ) && "service pack 2" >< tolower( os_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_xp:-:sp2:x64", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows xp 5.2" >< tolower( smb_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_xp:-:-:x64", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows embedded" >< tolower( os_str ) ) {
            if( "embedded 8.1" >< tolower( os_str ) ) {
              register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_embedded_8.1", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
            } else {
              register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_embedded", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
            }
          } else if( "windows vista" >< tolower( os_str ) && "service pack 1" >< tolower( os_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_vista:-:sp1", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows vista" >< tolower( os_str ) && "service pack 2" >< tolower( os_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_vista:-:sp2", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows vista " >< tolower( os_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_vista", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows 7 " >< tolower( os_str ) && ( "service pack 1" >< tolower( os_str ) || "7601" >< os_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_7:-:sp1", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows 7 " >< tolower( os_str ) && "7600" >< os_str ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_7:-:-:", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows 7 " >< tolower( os_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_7", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows 8.1 " >< tolower( os_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_8.1", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows 8 " >< tolower( os_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_8", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows server 2003 " >< tolower( os_str ) && "service pack 1" >< tolower( os_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_server_2003:-:sp1", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows server 2003 " >< tolower( os_str ) && "service pack 2" >< tolower( os_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_server_2003:-:sp2", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows server 2003 " >< tolower( os_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_server_2003", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows server 2008 " >< tolower( os_str ) && "service pack 1" >< tolower( os_str ) && "r2" >< tolower( os_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_server_2008:r2:sp1", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows server 2008 " >< tolower( os_str ) && "r2" >< tolower( os_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_server_2008:r2", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows server (r) 2008 " >< tolower( os_str ) && "service pack 2" >< tolower( os_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_server_2008::sp2", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows server (r) 2008 " >< tolower( os_str ) && "service pack 1" >< tolower( os_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_server_2008::sp1", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows server (r) 2008 " >< tolower( os_str ) || "windows server 2008 " >< tolower( os_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_server_2008", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else if( "windows server 2016 " >< tolower( os_str ) ) {
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows_server_2016", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          } else {
            register_unknown_os_banner( banner:banner, banner_type_name:SCRIPT_DESC, port:port, banner_type_short:"smb_nativelanman_banner" );
            register_and_report_os( os:os_str, cpe:"cpe:/o:microsoft:windows", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"windows" );
          }
        } else if( "vxworks" >< tolower( os_str ) ) {
          register_and_report_os( os:"Wind River VxWorks", cpe:"cpe:/o:windriver:vxworks", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"unixoide" );
        } else if( "debian" >< tolower( os_str ) ) {
          if( "8" >< os_str ) {
            # nb: Starting with Wheezy (7.x) we have minor releases within the version so we don't use an exact version like 7.0 as we can't differ between the OS in the banner here
            register_and_report_os( os:"Debian GNU/Linux", version:"8", cpe:"cpe:/o:debian:debian_linux", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"unixoide" );
          } else if( "9" >< os_str ) {
            register_and_report_os( os:"Debian GNU/Linux", version:"9", cpe:"cpe:/o:debian:debian_linux", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"unixoide" );
          } else {
            register_and_report_os( os:"Debian GNU/Linux", cpe:"cpe:/o:debian:debian_linux", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"unixoide" );
          }
        } else if( "SUSE" >< os_str ) {
          if( "SUSE Linux Enterprise Server 11" >< os_str ) {
            register_and_report_os( os:"SUSE Linux Enterprise Server", version:"11", cpe:"cpe:/o:suse:linux_enterprise_server", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"unixoide" );
          } else if( "SUSE Linux Enterprise Server 12" >< os_str ) {
            register_and_report_os( os:"SUSE Linux Enterprise Server", version:"12", cpe:"cpe:/o:suse:linux_enterprise_server", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"unixoide" );
          } else {
            register_and_report_os( os:"Unknown SUSE Linux release", cpe:"cpe:/o:suse:unknown_linux", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"unixoide" );
            # nb: We want to report an unknown banner here as well to catch reports with more detailed info
            register_unknown_os_banner( banner:banner, banner_type_name:banner_type, banner_type_short:"smb_samba_banner", port:port );
          }
        } else if( "unix" >< tolower( os_str ) ) {
          register_and_report_os( os:"Linux/Unix", cpe:"cpe:/o:linux:kernel", banner_type:banner_type, port:port, banner:banner, desc:SCRIPT_DESC, runs_key:"unixoide" );
          # nb: We want to report an unknown banner here as well to catch reports with more detailed info
          register_unknown_os_banner( banner:banner, banner_type_name:banner_type, banner_type_short:"smb_samba_banner", port:port );
        } else {
          register_unknown_os_banner( banner:banner, banner_type_name:banner_type, banner_type_short:"smb_samba_banner", port:port );
        }
      }

      if( report_verbosity && report ) {
        log_message( port:port, data:result );
      }
    }
    out = NULL;
  } else {
    out = s[x-1] + s[x] + out;
  }
}

exit( 0 );
