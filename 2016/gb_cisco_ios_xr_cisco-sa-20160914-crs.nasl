###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ios_xr_cisco-sa-20160914-crs.nasl 5534 2017-03-10 10:00:33Z teissa $
#
# Cisco Carrier Routing System IPv6 Denial of Service Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

CPE = "cpe:/o:cisco:ios_xr";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.106256");
 script_cve_id("CVE-2016-6401");
 script_tag(name:"cvss_base", value:"5.7");
 script_tag(name:"cvss_base_vector", value:"AV:A/AC:M/Au:N/C:N/I:N/A:C");
 script_version ("$Revision: 5534 $");

 script_name("Cisco Carrier Routing System IPv6 Denial of Service Vulnerability");

 script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160914-crs");
 
 script_tag(name: "vuldetect" , value:"Check the version.");

 script_tag(name: "solution" , value:"See the referenced vendor advisory for a solution.");

 script_tag(name: "summary" , value:"A vulnerability in IPv6 over MPLS packet processing of Cisco IOS XR for
Cisco Carrier Routing System (CRS) platforms could allow an unauthenticated, adjacent attacker to cause a
reload of the affected line card.");

 script_tag(name: "insight", value: "The vulnerability is due to insufficient logic in processing of crafted
IPv6 over MPLS packets. An attacker could exploit this vulnerability by sending a crafted IPv6 over MPLS packet
to be processed by an affected device.");

 script_tag(name: "impact", value: "An exploit could allow the attacker to cause a reload of the affected line
card.");

 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");

 script_tag(name:"last_modification", value:"$Date: 2017-03-10 11:00:33 +0100 (Fri, 10 Mar 2017) $");
 script_tag(name:"creation_date", value:"2016-09-16 11:53:36 +0700 (Fri, 16 Sep 2016)");
 script_category(ACT_GATHER_INFO);
 script_family("CISCO");
 script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
 script_dependencies("gb_cisco_ios_xr_version.nasl");
 script_mandatory_keys("cisco/ios_xr/version", "cisco/ios_xr/model");
 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!model = get_kb_item("cisco/ios_xr/model"))
  exit(0);

if (model !~ "^CRS-")
  exit(99);

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

if( version == '5.1.4' ) {
  report = report_fixed_ver(  installed_version:version, fixed_version: "See advisory" );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );

