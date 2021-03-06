###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ftpshell_cli_buf_ovr.nasl 4519 2016-11-15 11:37:22Z teissa $
#
# FTPShell Client 5.24 Buffer Overflow
#
# Authors:
# Tameem Eissa <tameem.eissa@greenbone.net>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH
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

CPE = "cpe:/a:ftpshell:ftpshell";

tag_impact = "Successful exploitation will let the user execute local arbitrary code execution by overwriting several registers on the stack and controlling program execution flow.";

tag_affected = "FTPShell Client 5.24.";

tag_insight = "ftpshell.exe client has a buffer overflow entry point in the 'Address' input field used to connect to an FTP server.";

tag_solution = "See Vendor at www.ftpshell.com.";

tag_summary = "This host is running FTPShell Client and is prone to Buffer
Overflow vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107083");
  script_version("$Revision: 4519 $");
  script_tag(name:"last_modification", value:"$Date: 2016-11-15 12:37:22 +0100 (Tue, 15 Nov 2016) $");
  script_tag(name:"creation_date", value:"2016-11-14 16:34:55 +0700 (Mon, 14 Nov 2016)"); 
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:C");
  script_name("FTPShell Client 5.24 Buffer Overflow");
  script_xref(name : "URL" , value : "http://hyp3rlinx.altervista.org/advisories/FTPSHELL-v5.24-BUFFER-OVERFLOW.txt");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_ftpshell_client_detect.nasl");
  script_mandatory_keys("FTPShell/Client/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"NoneAvailable");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
shellVer = "";

## Get version
if(!shellVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_equal(version:shellVer, test_version:"5.24")){
  security_message(0);
}

