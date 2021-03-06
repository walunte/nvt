###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_wordpress_wptouch_url_redirection_vuln.nasl 5690 2017-03-23 10:07:19Z antu123 $
#
# WordPress WPtouch URL redirection Vulnerability
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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

CPE = "cpe:/a:wordpress:wordpress";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902384");
  script_version("$Revision: 5690 $");
  script_tag(name:"last_modification", value:"$Date: 2017-03-23 11:07:19 +0100 (Thu, 23 Mar 2017) $");
  script_tag(name:"creation_date", value:"2011-06-24 16:31:03 +0200 (Fri, 24 Jun 2011)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("WordPress WPtouch URL redirection Vulnerability");

  script_tag(name : "summary" , value : "This host is installed with
  WordPress Wptouch plugin and is prone to URL redirection vulnerability."); 
 
  script_tag(name : "insight" , value : "The flaw is due to an improper
  validation of user supplied input data via 'wptouch_redirect' parameter.");

  script_tag(name : "impact" , value : "Successful exploitation will allow
  attackers to redirect to his choice of malicious site via the trusted
  vulnerable url.

  Impact Level: Application");

  script_tag(name : "affected" , value : "WordPress WPtouch Plugin Version 1.9.27 and 1.9.28");

  script_tag(name : "solution" , value : "No solution or patch was made available for at least
  one year since disclosure of this vulnerability. Likely none will be provided anymore.
  General solution options are to upgrade to a newer release, disable respective
  features, remove the product or replace the product by another one.");

  script_tag(name:"solution_type", value:"WillNotFix");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/17423");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/files/view/102451/wptouch-redirect.txt");
  script_tag(name:"qod_type", value:"remote_active");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("wordpress/installed");
  exit(0);
}


##
## The script code starts here
##

include("http_func.inc");
include("version_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

http_port = "";
dir = "";
sndReq = "";
rcvRes = "";

## Get HTTP Port
if(!http_port = get_app_port(cpe:CPE))exit(0);

## Check host supports PHP
if(!can_host_php(port:http_port)){
  exit(0);
}

## Get WordPress installed location
if(!dir = get_app_location(cpe:CPE, port:http_port))exit(0);


url = dir + '/wp-content/plugins/wptouch/admin-css/wptouch-admin.css';

## confirm the wptouch plugin installation
if(http_vuln_check(port:http_port, url:url, check_header:TRUE,
  pattern:'wptouch-head-title', extra_check: make_list('wptouch-pages', 'wptouch-head-links')))
{
  url = dir + "/?wptouch_view=normal&wptouch_redirect=" + dir + "/readme.html";

   ## Construct the request
  sndReq = http_get(item:url, port:http_port);
  rcvRes = http_send_recv(port:http_port, data:sndReq);

  ## Check the response to confirm vulnerability
  if(egrep(pattern:"^HTTP/.* 302 Found", string:rcvRes) &&
     egrep(pattern:'^Location:.*/readme.html', string:rcvRes) && 
     egrep(pattern:'^Set-Cookie: wptouch_switch_toggle=normal', string:rcvRes))
 {
   report = report_vuln_url( port:http_port, url:url);
   security_message(port:http_port, data:report);
   exit(0);
 }
}
