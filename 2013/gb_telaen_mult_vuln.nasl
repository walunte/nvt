###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_telaen_mult_vuln.nasl 5791 2017-03-30 13:06:07Z cfi $
#
# Telaen Multiple Vulnerabilities
#
# Authors:
# Arun Kallavi <karun@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803646");
  script_version("$Revision: 5791 $");
  script_cve_id("CVE-2013-2621", "CVE-2013-2623", "CVE-2013-2624");
  script_bugtraq_id(60290,60288,60340);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-03-30 15:06:07 +0200 (Thu, 30 Mar 2017) $");
  script_tag(name:"creation_date", value:"2013-06-10 16:45:05 +0530 (Mon, 10 Jun 2013)");
  script_name("Telaen Multiple Vulnerabilities");

  script_xref(name : "URL" , value : "http://seclists.org/bugtraq/2013/Jun/12");
  script_xref(name : "URL" , value : "http://exploitsdownload.com/exploit/na/telaen-130-xss-open-redirection-disclosure");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name : "impact" , value : "Successful exploitation could allow attackers to perform open redirection,
  obtain sensitive information and execute arbitrary code in a user's browser
  session in context of an affected site.
  Impact Level: Application");
  script_tag(name : "affected" , value : "Telaen version 1.3.0 and prior");
  script_tag(name : "insight" , value : "The flaws are due to,
  - Improper validation of input passed to 'f_email' parameter upon submission
    to the '/telaen/index.php' script.
  - Improper validation of user-supplied input upon submission to the
    '/telaen/redir.php' script.
  - Issue when requested for the '/telaen/inc/init.php' script.");
  script_tag(name : "solution" , value : "Upgrade to Telaen version 1.3.1 or later
  For updates refer to http://www.telaen.com");
  script_tag(name : "summary" , value : "This host is running Telaen and is prone to multiple vulnerabilities.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_app");
  exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

## Variable Initialization
req = "";
res = "";
dir = "";
matched = "";
Port = 0;
url = "";

Port = get_http_port(default:80);

if(!can_host_php(port:Port)){
  exit(0);
}

host = http_host_name(port:Port);

foreach dir (make_list_unique("/", "/telaen", "/webmail", cgi_dirs(port:Port)))
{
  if(dir == "/") dir = "";

  res = http_get_cache(item:string(dir, "/index.php"),  port:Port);

  ## Confirm the application
  if('>Powered by Telaen' >< res && 'login' >< res)
  {
    ## Construct the attack request
    req = http_get(item:string(dir, "/redir.php?http://", host, "/telaen/index.php"),  port:Port);
    res = http_keepalive_send_recv(port:Port, data:req, bodyonly:TRUE);

    if(res && res =~ "HTTP/1.. 200 OK")
    {
      matched=  eregmatch(string:res, pattern:">http://[0-9.]+(.*)</a>");
      if(matched[1])
      {
        url = dir + matched[1];
        req = http_get(item:url, port:Port);
        res = http_keepalive_send_recv(port:Port, data:req);

        ## Check response to confirm the exploit
        if('>Powered by Telaen' >< res && 'login' >< res){
          security_message(port:Port);
          exit(0);
        }
      }
    }
  }
}

exit(99);