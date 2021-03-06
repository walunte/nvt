##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_flock_detect_lin.nasl 7510 2017-10-20 05:12:02Z cfischer $
#
# Flock Version Detection (Linux)
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_summary = "This script detects the installed version of Flock Browser and
  sets the result in KB.";

if(description)
{
  script_id(800878);
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 7510 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-20 07:12:02 +0200 (Fri, 20 Oct 2017) $");
  script_tag(name:"creation_date", value:"2009-09-02 11:50:45 +0200 (Wed, 02 Sep 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Flock Version Detection (Linux)");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
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
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.800878";
SCRIPT_DESC = "Flock Version Detection (Linux)";

f_soc = ssh_login_or_reuse_connection();
if(!f_soc){
  exit(0);
}

foreach item (make_list("flock-browser", "flock"))
{
  flock_paths = find_file(file_name:item, file_path:"/", useregex:TRUE,
                          regexpar:"$", sock:f_soc);
  if(!isnull(flock_paths))
  {
    foreach binaryName (flock_paths)
    {
      flockVer = get_bin_version(full_prog_name:chomp(binaryName), sock:f_soc,
                                 version_argv:"--version", ver_pattern:"Flock "+
                                 "Browser ([0-9]\.[0-9.]+((b|rc)[0-9])?)");
      if(!isnull(flockVer[1]))
      {
        set_kb_item(name:"Flock/Linux/Ver", value:flockVer[1]);
        log_message(data:"Flock Browser version " + flockVer[1] + " was detected on the host");
    
        ## build cpe and store it as host_detail
        cpe = build_cpe(value:fockVer[1], exp:"^([0-9.]+)", base:"cpe:/a:flock:flock:");
        if(!isnull(cpe))
           register_host_detail(name:"App", value:cpe, nvt:SCRIPT_OID, desc:SCRIPT_DESC);

      }
    }
  }
}
ssh_close_connection();
