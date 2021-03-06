# OpenVAS Vulnerability Test
# $Id: smb_nt_ms03-042.nasl 6056 2017-05-02 09:02:50Z teissa $
# Description: Buffer Overflow in Windows Troubleshooter ActiveX Control (826232)
#
# Authors:
# Jeff Adams <jeffrey.adams@hqda.army.mil>
#
# Copyright:
# Copyright (C) 2003 Jeff Adams
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

tag_summary = "A security vulnerability exists in the Microsoft Local Troubleshooter ActiveX control in 
Windows 2000. The vulnerability exists because the ActiveX control (Tshoot.ocx) contains
a buffer overflow that could allow an attacker to run code of their choice on a user's system. 
To exploit this vulnerability, the attacker would have to create a specially formed HTML based 
e-mail and send it to the user. 
Alternatively an attacker would have to host a malicious Web site that contained a Web page 
designed to exploit this vulnerability.";

tag_solution = "see http://www.microsoft.com/technet/security/bulletin/ms03-042.mspx";

if(description)
{
 script_id(11887);
 script_version("$Revision: 6056 $");
 script_tag(name:"last_modification", value:"$Date: 2017-05-02 11:02:50 +0200 (Tue, 02 May 2017) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_xref(name:"IAVA", value:"2003-A-0029");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
 script_cve_id("CVE-2003-0661");
 
 name = "Buffer Overflow in Windows Troubleshooter ActiveX Control (826232)";
 
 script_name(name);
 

 summary = "Checks for hotfix Q826232";

 
 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
 
 script_copyright("This script is Copyright (C) 2003 Jeff Adams");
 family = "Windows : Microsoft Bulletins";
 script_family(family);
  script_dependencies("secpod_reg_enum.nasl");
 script_require_keys("SMB/Registry/Enumerated");
 script_mandatory_keys("SMB/WindowsVersion");
 script_require_ports(139, 445);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("secpod_reg.inc");

if ( hotfix_check_sp(win2k:5) <= 0 ) exit(0);
if ( hotfix_missing(name:"KB826232") > 0 )
	security_message(get_kb_item("SMB/transport"));
