###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_opera_mult_vuln_lin02_jul11.nasl 5912 2017-04-10 09:01:51Z teissa $
#
# Opera Browser Multiple Vulnerabilities-02 July-11 (Linux)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow remote attackers to execute arbitrary code
  and cause a denial of service.
  Impact Level: System/Application";
tag_affected = "Opera Web Browser version prior 11.10 on Linux";
tag_insight = "The flaws are due to
  - An error in cascading Style Sheets (CSS) implementation, allows attackers
    to cause denial of service via vectors involving use of the hover pseudo
    class.
  - A Hijacking searches and other customisations in Opera.
  - An error Tomato Firmware v1.28.1816 Status Device List page in Opera.
  - Crashes on futura-sciences.com, seoptimise.com, mitosyfraudes.org.
  - Crash occurring with games on zylom.com.
  - A Hidden animated '.gif' causing high CPU load, because of constant repaints.
  - A crash when passing empty parameter to a Java applet.";
tag_solution = "Upgrade to Opera Web Browser version 11.10 or later,
  For updates refer to http://www.opera.com/download/";
tag_summary = "The host is installed with Opera browser and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_id(802741);
  script_version("$Revision: 5912 $");
  script_cve_id("CVE-2011-2635", "CVE-2011-2634", "CVE-2011-2636", "CVE-2011-2637",
                "CVE-2011-2638", "CVE-2011-2639", "CVE-2011-2640");
  script_bugtraq_id(48569);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-04-10 11:01:51 +0200 (Mon, 10 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-04-10 12:16:51 +0530 (Tue, 10 Apr 2012)");
  script_name("Opera Browser Multiple Vulnerabilities-02 July-11 (Linux)");
  script_xref(name : "URL" , value : "http://www.opera.com/docs/changelogs/unix/1110/");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_opera_detection_linux_900037.nasl");
  script_require_keys("Opera/Linux/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("version_func.inc");

## Variable Initialization
operaVer = "";

## Get Opera Version from KB
operaVer = get_kb_item("Opera/Linux/Version");
if(!operaVer){
  exit(0);
}

## Grep for Opera Versions prior to 11.10
if(version_is_less(version:operaVer, test_version:"11.10")){
  security_message(0);
}
