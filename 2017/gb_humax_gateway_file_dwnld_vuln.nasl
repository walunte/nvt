##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_humax_gateway_file_dwnld_vuln.nasl 7340 2017-10-04 12:29:09Z cfischer $
#
# HUMAX Gateway Backup File Download Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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

CPE = "cpe:/a:humaxdigital";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106917");
  script_version("$Revision: 7340 $");
  script_cve_id("CVE-2017-7316", "CVE-2017-7317", "CVE-2017-7315");
  script_tag(name: "last_modification", value: "$Date: 2017-10-04 14:29:09 +0200 (Wed, 04 Oct 2017) $");
  script_tag(name: "creation_date", value: "2017-07-03 11:22:04 +0700 (Mon, 03 Jul 2017)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_tag(name: "qod_type", value: "remote_vul");

  script_tag(name: "solution_type", value: "NoneAvailable");

  script_name("HUMAX Gateway Backup File Download Vulnerability");

  script_category(ACT_ATTACK);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_humax_gateway_detect.nasl");
  script_mandatory_keys("humax_gateway/detected");

  script_tag(name: "summary", value: "Humax HG100R devices are prone to a backup file download vulnerability.
This file contains sensitive information which may lead to further attacks.");

  script_tag(name: "vuldetect", value: "Sends a crafted HTTP GET request and checks the response.");

  script_tag(name: "solution", value: "No solution or patch is available as of
  4th October, 2017. Information regarding this issue will be updated once the
  solution details are available.");

  script_xref(name: "URL", value: "https://www.exploit-db.com/exploits/42284/");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

if (!port = get_app_port_from_cpe_prefix(cpe: CPE))
  exit(0);

url = '/view/basic/GatewaySettings.bin';

if (http_vuln_check(port: port, url: url, pattern: "Content-Type: application/x-download", check_header: TRUE,
                    extra_check: "Content-disposition: attachment; filename=GatewaySettings.bin")) {
  report = report_vuln_url(port: port, url: url);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
