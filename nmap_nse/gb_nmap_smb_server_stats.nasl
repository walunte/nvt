###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_smb_server_stats.nasl 7006 2017-08-25 11:51:20Z teissa $
#
# Wrapper for Nmap SMB Server Statistics NSE script.
#
# Authors:
# NSE-Script: Ron Bowes
# NASL-Wrapper: Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# NASL-Wrapper: Copyright (c) 2010 Greenbone Networks GmbH (http://www.greenbone.net)
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

tag_summary = "This script attempts to get the server's statistics over the SMB protocol.

  This is a wrapper on the Nmap Security Scanner's (http://nmap.org) smb-server-stats.nse.";


if(description)
{
  script_id(801294);
  script_version("$Revision: 7006 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-25 13:51:20 +0200 (Fri, 25 Aug 2017) $");
  script_tag(name:"creation_date", value:"2010-09-23 08:22:30 +0200 (Thu, 23 Sep 2010)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
  script_name("Nmap NSE: SMB Server Statistics");
  script_category(ACT_GATHER_INFO);
    script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_add_preference(name: "smbusername :", value: "",type: "entry");
  script_add_preference(name: "smbpassword :", value: "",type: "entry");
  script_add_preference(name: "smbdomain :", value: "",type: "entry");
  script_add_preference(name: "smbport :", value: "",type: "entry");
  script_add_preference(name: "smbtype :", value: "",type: "entry");
  script_add_preference(name: "smbnoguest :", value: "",type: "entry");
  script_add_preference(name: "smbhash :", value: "",type: "entry");
  script_add_preference(name: "smbbasic :", value: "",type: "entry");
  script_add_preference(name: "smbsign :", value: "",type: "entry");
  script_add_preference(name: "randomseed :", value: "",type: "entry");

  script_mandatory_keys("Tools/Present/nmap");
  script_mandatory_keys("Tools/Launch/nmap_nse");
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


## Check for Required Keys
if((! get_kb_item("Tools/Present/nmap5.21") &&
   ! get_kb_item("Tools/Present/nmap5.51")) ||
   ! get_kb_item("Tools/Launch/nmap_nse")) {
 exit(0);
}

## Get SMB Port
port = script_get_preference("smbport :");
if (port !~ '^[0-9]+$')
{
  port = 445;
}

argv = make_list("nmap", "--script=smb-server-stats.nse", "-p", port,
                  get_host_ip());

## Get the preferences
i = 0;
if( pref = script_get_preference("smbusername :")){
  args[i++] = "smbusername="+pref;
}

if( pref = script_get_preference("smbpassword :")){
  args[i++] = "smbpassword="+pref;
}

if( pref = script_get_preference("smbdomain :")){
  args[i++] = "smbdomain="+pref;
}

if( pref = script_get_preference("smbtype :")){
  args[i++] = "smbtype="+pref;
}

if( pref = script_get_preference("smbnoguest :")){
  args[i++] = "smbnoguest="+pref;
}

if( pref = script_get_preference("smbhash :")){
  args[i++] = "smbhash="+pref;
}

if( pref = script_get_preference("smbbasic :")){
  args[i++] = "smbbasic="+pref;
}

if( pref = script_get_preference("smbsign :")){
  args[i++] = "smbsign="+pref;
}

if( pref = script_get_preference("randomseed :")){
  args[i++] = "randomseed="+pref;
}

if(i > 0)
{
  scriptArgs= "--script-args=";
  foreach arg(args) {
    scriptArgs += arg + ",";
  }
  argv = make_list(argv,scriptArgs);
}

## Run nmap and Get the result
res = pread(cmd: "nmap", argv: argv);
if(res)
{
  foreach line (split(res))
  {
    if(ereg(pattern:"^\|",string:line)) {
      result +=  substr(chomp(line),2) + '\n';
    }

    error = eregmatch(string:line, pattern:"^nmap: (.*)$");
    if (error) {
      msg = string('Nmap command failed with following error message:\n', line);
      log_message(data : msg, port:port);
    }
  }

  if("smb-server-stats" >< result) {
    msg = string('Result found by Nmap Security Scanner (smb-server-stats.nse) ',
                'http://nmap.org:\n\n', result);
    security_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n');
  log_message(data : msg, port:port);
}
