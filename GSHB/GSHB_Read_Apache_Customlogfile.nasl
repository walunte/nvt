###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_Read_Apache_Customlogfile.nasl 7293 2017-09-27 08:49:48Z cfischer $
#
# Reading Apache Logiles (win)
#
# Authors:
# Thomas Rotter <T.Rotter@dn-systems.de>
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

tag_summary = "Reading Apache CustomLogfiles";

if(description)
{
  script_id(96022);
  script_version("$Revision: 7293 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-27 10:49:48 +0200 (Wed, 27 Sep 2017) $");
  script_tag(name:"creation_date", value:"2010-04-27 10:02:59 +0200 (Tue, 27 Apr 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"qod_type", value:"registry");
  script_name("Reading Apache CustomLogfiles (win)");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2009 Greenbone Networks GmbH");
  script_family("IT-Grundschutz");
  script_mandatory_keys("Compliance/Launch/GSHB");
   
  script_dependencies("secpod_reg_enum.nasl", "GSHB_WMI_Apache.nasl", "GSHB_Read_Apache_Config.nasl");
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}

include("smb_nt.inc");
include("GSHB_read_file.inc");

#if( !get_kb_item("GSHB/Apache/CustomLog") ) {
#    security_message(data:"GSHB/Apache/CustomLog: No Entry");#
#    exit(0);
#}

kbpath = get_kb_item("WMI/Apache/RootPath");

if("None" >< kbpath){
  set_kb_item(name:"GSHB/Apache/404erError", value:"None");
  set_kb_item(name:"GSHB/Apache/403erError", value:"None");
  set_kb_item(name:"GSHB/Apache/404erError/log", value:"IT-Grundschutz: No Apache Installed");
  log_message(port:0, proto: "IT-Grundschutz", data:string("No Apache Installed") + string("\n"));
  exit(0);
}

customlogfile = get_kb_item("GSHB/Apache/CustomLog");
customlogfile = ereg_replace(pattern:'/',replace:'\\', string:customlogfile);
customlogfile = split(customlogfile, sep:"|", keep:0);

for (c=0; c<max_index(customlogfile); c++)
    {
    if (customlogfile[c] >!< '')
        {

        checkpath = eregmatch(pattern:'.*:.*', string:customlogfile[c]);
        if(isnull(checkpath)){
        path = split(kbpath, sep:":", keep:0);
        file = path[1] + customlogfile[c];
        share = path[0] + "$";
        }else{
        path = split(customlogfile[c], sep:":", keep:0);
        file = path[1];
        share = path[0] + "$";
        }


        customlog = GSHB_read_file(share: share, file: file, offset: 0);

        if (!customlog){
           #AspEnableParentPaths = "error";
           log_message(port:port, data:"Cannot access/open the Apache CustomLogfile: " + share + file);
        } else {
           Error404 = egrep(pattern:'.*GET .* 404 .*', string:customlog);
           Error403 = egrep(pattern:'.*GET .* 403 .*', string:customlog);

           if(Error404){
               httpError404 = httpError404 + string(share + file +": has 404 Errors!" ) + '\n';
           }else{
               httpError404 = httpError404 + string(share + file +": has no 404 Errors!" ) + '\n';
           }
           if(Error403){
               httpError403 = httpError403 + string(share + file +": has 403 Errors!" ) + '\n';
           }else{
               httpError403 = httpError403 + string(share + file +": has no 403 Errors!" ) + '\n';
           }

        }
    }
}

if(!httpError404) httpError404 = "None";
if(!httpError403) httpError403 = "None";

set_kb_item(name:"GSHB/Apache/404Error", value:httpError404);
set_kb_item(name:"GSHB/Apache/403Error", value:httpError403);

exit(0);
