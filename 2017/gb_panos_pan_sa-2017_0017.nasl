###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_panos_pan_sa-2017_0017.nasl 6288 2017-06-07 04:07:08Z ckuersteiner $
#
# Palo Alto PAN-OS OpenSSL Vulnerability
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

CPE = 'cpe:/o:altaware:palo_alto_networks_panos';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106849");
  script_version("$Revision: 6288 $");
  script_tag(name: "last_modification", value: "$Date: 2017-06-07 06:07:08 +0200 (Wed, 07 Jun 2017) $");
  script_tag(name: "creation_date", value: "2017-06-07 09:16:47 +0700 (Wed, 07 Jun 2017)");
  script_tag(name: "cvss_base", value: "4.3");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:M/Au:N/C:N/I:N/A:P");

  script_cve_id("CVE-2016-8610");

  script_tag(name: "qod_type", value: "package");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("Palo Alto PAN-OS OpenSSL Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_palo_alto_panOS_version.nasl");
  script_mandatory_keys("palo_alto_pan_os/version");

  script_tag(name: "summary", value: "The OpenSSL library has been found to contain a vulnerability.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "insight", value: "Palo Alto Networks software makes use of the vulnerable library and may be
affected.");

  script_tag(name: "affected", value: "PAN-OS 6.1, PAN-OS 7.0.15 and earlier.");

  script_tag(name: "solution", value: "Update to PAN-OS 7.0.16 or later.");

  script_xref(name: "URL", value: "https://securityadvisories.paloaltonetworks.com/Home/Detail/87");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!version = get_app_version(cpe: CPE))
  exit(0);

model = get_kb_item("palo_alto_pan_os/model");

if (version_is_less(version: version, test_version: "7.0.16")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "7.0.16");
  if (model)
    report += '\nModel:             ' + model;

  security_message(port: 0, data: report);
  exit(0);
}

exit(99);