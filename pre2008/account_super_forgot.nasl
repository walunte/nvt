###############################################################################
# OpenVAS Vulnerability Test
# $Id: account_super_forgot.nasl 6046 2017-04-28 09:02:54Z teissa $
#
# Default password 'forgot' for account 'super'
#
# Authors:
# Michel Arboi
#
# Copyright:
# Copyright (C) 2005 Michel Arboi
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
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

account = "super";
password = "forgot";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.17292");
  script_version("$Revision: 6046 $");
  script_tag(name:"last_modification", value:"$Date: 2017-04-28 11:02:54 +0200 (Fri, 28 Apr 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-1999-1420", "CVE-1999-1421");
  script_bugtraq_id(212);
  script_name("Default password 'forgot' for account 'super'");
  script_category(ACT_ATTACK);
  script_family("Default Accounts");
  script_copyright("This script is Copyright (C) 2005 Michel Arboi");
  script_dependencies("find_service.nasl", "ssh_detect.nasl");
  script_require_ports("Services/telnet", 23, "Services/ssh", 22);

  tag_summary = "The account 'super' has the password 'forgot'.";

  tag_solution = "Set a strong password for this account or disable it.";

  tag_impact = "An attacker may use it to gain further privileges on this system.";

  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"impact", value:tag_impact);

  script_tag(name:"solution_type", value:"Mitigation");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("default_account.inc");

port = check_account( login:account, password:password );
if( port ) {
  security_message( port:port );
  exit( 0 );
}

exit( 99 );
