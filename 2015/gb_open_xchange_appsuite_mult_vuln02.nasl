###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_open_xchange_appsuite_mult_vuln02.nasl 6141 2017-05-17 09:03:37Z teissa $
#
# Open-Xchange (OX) AppSuite Multiple Vulnerabilities -02 Oct15
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

CPE = "cpe:/a:open-xchange:open-xchange_appsuite";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806070");
  script_version("$Revision: 6141 $");
  script_cve_id("CVE-2014-5236", "CVE-2014-5237");
  script_bugtraq_id(69794, 69793);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-05-17 11:03:37 +0200 (Wed, 17 May 2017) $");
  script_tag(name:"creation_date", value:"2015-10-05 16:02:56 +0530 (Mon, 05 Oct 2015)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Open-Xchange (OX) AppSuite Multiple Vulnerabilities -02 Oct15");

  script_tag(name: "summary" , value:"The host is installed with
  Open-Xchange (OX) AppSuite and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exist due to:
  - Crafted OLE Objects within OpenDocument Text files can be used to reference
    objects with absolute or relative paths.
  - Server-side request forgery (SSRF) vulnerability in the documentconverter
    component in Open-Xchange (OX) AppSuite");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to access or read arbitrary files that contain sensitive information, to
  perform certain unauthorized actions and gain access to the affected
  application. Other attacks are also possible

  Impact Level: Application");

  script_tag(name:"affected", value:"Open-Xchange (OX) AppSuite versions before
  7.4.2-rev10 and 7.6.x before 7.6.0-rev10.");

  script_tag(name:"solution", value:"Upgrade to Open-Xchange (OX) AppSuite
  version 7.4.2-rev10 or 7.6.0-rev10 or later.
  For updates refer to https://www.open-xchange.com");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://packetstormsecurity.com/files/128257");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/archive/1/533443/100/0/threaded");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_ox_app_suite_detect.nasl");
  script_mandatory_keys("open_xchange_appsuite/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}

##
### Code Starts Here
##

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
oxPort = "";
oxVer = "";


## Get HTTP Port
if(!oxPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get the version
oxVer = get_app_version(cpe:CPE, port:oxPort);
if(!oxVer || "unknown" >< oxVer){
  exit(0);
}

## Get the revision
oxRev = get_kb_item("open_xchange_appsuite/" + oxPort + "/revision");

if(oxRev){

  ## Updating version with revision number
  oxVer = oxVer + "." + oxRev;

  ##Check for vulnerable version
  if(version_is_less( version:oxVer, test_version:"7.4.2.10" ))
  {
    fix = "7.4.2.10";
    VULN = TRUE;
  }

  else if(oxVer =~ "^(7\.6)")
  {
    if(version_is_less( version:oxVer, test_version:"7.6.0.10"))
    {
      fix = "7.6.0.10";
      VULN = TRUE;
    }
  }

  if(VULN)
  {
    report = 'Installed Version: ' + oxVer + '\nFixed Version:     ' + fix + '\n';
    security_message(data:report);
    exit(0);
  }
}
