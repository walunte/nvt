###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_tcptrack_detect.nasl 7512 2017-10-20 05:21:19Z cfischer $
#
# Tcptrack Version Detection
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_summary = "This script finds the Tcptrack installed version and saves
  the version in KB.";

if(description)
{
  script_id(801972);
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 7512 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-20 07:21:19 +0200 (Fri, 20 Oct 2017) $");
  script_tag(name:"creation_date", value:"2011-09-13 07:51:43 +0200 (Tue, 13 Sep 2011)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Tcptrack Version Detection");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("login/SSH/success");
  script_exclude_keys("no_linux_shell");

  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("ssh_func.inc");
include("version_func.inc");
include("cpe.inc");
include("host_details.inc");

## Constant values
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.801972";
SCRIPT_DESC = "Tcptrack Version Detection";

sock = ssh_login_or_reuse_connection();
if(!sock){
  exit(0);
}

## Get the file location
tcptName = find_file(file_name:"tcptrack", file_path:"/", useregex:TRUE,
                          regexpar:"$", sock:sock);

## Check for the each path
if(tcptName)
{
  foreach binaryName (tcptName)
  {
     ## Get the version
    tcptVer = get_bin_version(full_prog_name:chomp(binaryName),
              version_argv:"-v", ver_pattern:"tcptrack v([0-9.]+)",sock:sock);
    if(tcptVer)
    {
      ## Set the version in kb
      set_kb_item(name:"Tcptrack/Ver", value:tcptVer[1]);
      log_message(data:"Tcptrack version " + tcptVer[1] +
          " installed at location " + binaryName + " was detected on the host");

      ## build cpe and store it as host_detail
      cpe = build_cpe(value:tcptVer[1], exp:"^([0-9.]+)", base:"cpe:/a:rhythm:tcptrack:");
      if(!isnull(cpe))
        register_host_detail(name:"App", value:cpe, nvt:SCRIPT_OID, desc:SCRIPT_DESC);
      ssh_close_connection();
    }
  }
  ssh_close_connection();
}

close(sock);
