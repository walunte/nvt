###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_symantec_messaging_gateway_sym16_010.nasl 6493 2017-06-30 07:00:59Z ckuersteiner $
#
# Symantec Messaging Gateway Decomposer Engine Multiple Parsing Vulnerabilities
# 
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:symantec:messaging_gateway";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105783");
  script_version("$Revision: 6493 $");
  script_cve_id("CVE-2016-2207","CVE-2016-2209","CVE-2016-2210","CVE-2016-2211","CVE-2016-3644","CVE-2016-3645","CVE-2016-3646");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-06-30 09:00:59 +0200 (Fri, 30 Jun 2017) $");
  script_tag(name:"creation_date", value:"2016-06-29 15:43:27 +0200 (Wed, 29 Jun 2016)");
  script_name("Symantec Messaging Gateway Decomposer Engine Multiple Parsing Vulnerabilities)");

  script_tag(name:"summary", value:' Parsing of maliciously-formatted container files may cause memory corruption, integer overflow or buffer overflow in Symantecs Decomposer engine. Successful exploitation of these vulnerabilities typically results in an application-level denial of service but could result in arbitrary code execution. An attacker could potentially run arbitrary code by sending a specially crafted file to a user.
In the TNEF unpacker, the overflow does not result in any detrimental actions due to underlying code. However this was an exposure due to improper implementation that could potentially be leveraged further, at some point, by a malicious individual. As such, it also was addressed in the engine update.');
  script_tag(name:"vuldetect", value:'Check the version');
  script_tag(name:"affected", value:' SMG 10.6.1-3 and prior');
  script_tag(name:"solution", value:'Update to SMG 10.6.1-4');

  script_xref(name:"URL", value:"https://www.symantec.com/security_response/securityupdates/detail.jsp?fid=security_advisory&pvid=security_advisory&year=&suid=20160628_00");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_family("Web application abuses");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_symantec_messaging_gateway_detect.nasl");
  script_mandatory_keys("/Symantec/Messaging/Gateway/installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE, nofork:TRUE ) ) exit( 0 );

if( version_is_less( version:version, test_version:"10.6.1" ) ) VULN = TRUE;

if( version == "10.6.1" )
{
  if( patch = get_kb_item( "smg/patch" ) )
    if( int( patch ) < 4 ) VULN = TRUE;
}

if( VULN )
{
  if( patch ) version = version + " Patch " + patch;
  report = report_fixed_ver( installed_version:version, fixed_version:'10.6.1 Patch 4' );
  security_message( port:0, data:report );
  exit(0);
}


exit( 99 );

