###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nagios_pid_vuln.nasl 7064 2017-09-06 05:47:54Z asteins $
#
# Nagios Privilege Escalation Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

CPE = 'cpe:/a:nagios:nagios';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140321");
  script_version("$Revision: 7064 $");
  script_tag(name: "last_modification", value: "$Date: 2017-09-06 07:47:54 +0200 (Wed, 06 Sep 2017) $");
  script_tag(name: "creation_date", value: "2017-08-22 15:57:32 +0700 (Tue, 22 Aug 2017)");
  script_tag(name:"cvss_base", value:"6.3");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:N/I:C/A:C");

  script_cve_id("CVE-2017-12847");

  script_tag(name: "qod_type", value: "remote_banner");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("Nagios Privilege Escalation Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("nagios_detect.nasl");
  script_mandatory_keys("nagios/installed");

  script_tag(name: "summary", value: "Nagios is prone to a privilege escalation vulnerability.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "insight", value: "The PID file of Nagios is writeable by non-admin users. A non-root attacker
can replace its contents with the PID of a root process which may leed to a denial of service attack.");

  script_tag(name: "affected", value: "Nagios 4.3.2 and prior.");

  script_tag(name: "solution", value: "Update to version 4.3.3 or later.");

  script_xref(name: "URL", value: "https://github.com/NagiosEnterprises/nagioscore/issues/404");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "4.3.3")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "4.3.3");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
