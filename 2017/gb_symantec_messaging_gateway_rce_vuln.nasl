##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_symantec_messaging_gateway_rce_vuln.nasl 6308 2017-06-12 04:12:59Z ckuersteiner $
#
# Symantec Messaging Gateway Remote Command Execution Vulnerability
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

CPE = "cpe:/a:symantec:messaging_gateway";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106862");
  script_version("$Revision: 6308 $");
  script_tag(name: "last_modification", value: "$Date: 2017-06-12 06:12:59 +0200 (Mon, 12 Jun 2017) $");
  script_tag(name: "creation_date", value: "2017-06-12 10:11:59 +0700 (Mon, 12 Jun 2017)");
  script_tag(name: "cvss_base", value: "9.0");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:S/C:C/I:C/A:C");

  script_tag(name: "qod_type", value: "remote_banner");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("Symantec Messaging Gateway Remote Command Execution Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_symantec_messaging_gateway_detect.nasl");
  script_mandatory_keys("/Symantec/Messaging/Gateway/installed");

  script_tag(name: "summary", value: "Symantec Messaging Gateway is prone to a remote command execution
vulnerability.");

  script_tag(name: "insight", value: "backupNow.do endpoint takes several user inputs and then pass them to the
internal service which is responsible for executing operating system command. One of the user input is being
passed to the service without proper validation. That cause an command injection vulnerability.");

  script_tag(name: "impact", value: "An authenticated attacker may execute a terminal command under the context
of the web server user which is root.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "affected", value: "Symantec Messaging Gateway prior to version 10.6.3.");

  script_tag(name: "solution", value: "Update to version 10.6.3 or later.");

  script_xref(name: "URL", value: "https://pentest.blog/unexpected-journey-5-from-weak-password-to-rce-on-symantec-messaging-gateway/");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!version = get_app_version(cpe: CPE))
  exit(0);

if (version_is_less(version: version, test_version: "10.6.3")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "10.6.3");
  security_message(port: 0, data: report);
  exit(0);
}

exit(0);