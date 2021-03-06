###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_TFTP_s-option.nasl 7061 2017-09-05 11:50:40Z teissa $
#
# Check if an TFTP Server is running and was start with -s Option
#
# Authors:
# Thomas Rotter <T.Rotter@dn-systems.de>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
#
#
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

tag_summary = "Check if an TFTP Server is running and was start with -s Option";

if(description)
{
  script_id(96101);
  script_version("$Revision: 7061 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-05 13:50:40 +0200 (Tue, 05 Sep 2017) $");
  script_tag(name:"creation_date", value:"2010-05-05 15:06:40 +0200 (Wed, 05 May 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"qod_type", value:"remote_active");
  script_name("Check if an TFTP Server is running and was start with -s Option");


  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("IT-Grundschutz");
  script_mandatory_keys("Compliance/Launch/GSHB");
  script_dependencies("tftpd_detect.nasl");
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}

include("tftp.inc");

port = get_kb_item('Services/udp/tftp');
if (! port) port = 69;

if ( tftp_alive(port: port) ) {
  get = tftp_get(port:port, path:"//etc//passwd");
  if (!get) tftp = "ok";
  else tftp = "fail";
}
else tftp = "none";

set_kb_item(name: "GSHB/TFTP/s-option", value:tftp);

exit(0);
