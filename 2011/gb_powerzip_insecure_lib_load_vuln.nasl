###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_powerzip_insecure_lib_load_vuln.nasl 7024 2017-08-30 11:51:43Z teissa $
#
# PowerZip Insecure Library Loading Vulnerability
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation could allow remote attackers to execute
arbitrary code or cause a denial of service condition.

Impact Level: Application";

tag_affected = "PowerZip Version 7.21 and prior.";

tag_insight = "This flaw is due to the application insecurely loading
certain external libraries from the current working directory, which
could allow attackers to execute arbitrary code by tricking a user into
opening a file from a  network share.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is installed with PowerZip and is prone to insecure
library loading vulnerability.";

if(description)
{
  script_id(802312);
  script_version("$Revision: 7024 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-30 13:51:43 +0200 (Wed, 30 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-08-04 10:01:53 +0200 (Thu, 04 Aug 2011)");
  script_tag(name:"cvss_base", value:"5.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:P");
  script_name("PowerZip Insecure Library Loading Vulnerability");
  script_xref(name : "URL" , value : "http://secpod.org/blog/?p=172");
  script_xref(name : "URL" , value : "http://secpod.org/advisories/SECPOD_PowerZip_ILL_Vuln.txt");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_powerzip_detect.nasl");
  script_require_keys("PowerZip/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

## Get version from KB
pzipver = get_kb_item("PowerZip/Ver");

if(!pzipver){
  exit(0);
}

## Check for PowerZip version less than or equal to 7.21
if(version_is_less_equal(version:pzipver, test_version:"7.21")){
  security_message(0);
}
