###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_varnish_detect.nasl 6065 2017-05-04 09:03:08Z teissa $
#
# Varnish Version Detection
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_summary = "This script detects the installed version of Varnish and
  sets the result in KB.";

if(description)
{
  script_id(800446);
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 6065 $");
  script_tag(name:"last_modification", value:"$Date: 2017-05-04 11:03:08 +0200 (Thu, 04 May 2017) $");
  script_tag(name:"creation_date", value:"2010-01-28 16:24:05 +0100 (Thu, 28 Jan 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Varnish Version Detection");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Service detection");
  script_mandatory_keys("login/SSH/Linux");
  script_dependencies("gather-package-list.nasl");
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("ssh_func.inc");
include("version_func.inc");
include("cpe.inc");
include("host_details.inc");

## Constant values
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.800446";
SCRIPT_DESC = "Varnish Version Detection";

sock = ssh_login_or_reuse_connection();
if(!sock){
  exit(0);
}

#Set Version KB for Varnish
varPath = find_bin(prog_name:"varnishd", sock:sock);
foreach varFile (varPath)
{
  varVer = get_bin_version(full_prog_name:chomp(varFile), version_argv:"-V",
                   ver_pattern:"-(([0-9.]+)(-[a-zA-z0-9]+)?)", sock:sock);
  if(varVer[1] != NULL)
  {
    varVer = ereg_replace(pattern:"-", string:varVer[1], replace: ".");
    set_kb_item(name:"Varnish/Ver", value:varVer);
    log_message(data:"Varnish version " + varVer + " running at location " 
                     + varFile + " was detected on the host");
      
    ## build cpe and store it as host_detail
    cpe = build_cpe(value:varVer, exp:"^([0-9.]+)", base:"cpe:/a:varnish.projects.linpro:varnish:");
    if(!isnull(cpe))
       register_host_detail(name:"App", value:cpe, nvt:SCRIPT_OID, desc:SCRIPT_DESC);

  }
}
