###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_safari_object_tag_dos_vuln.nasl 5263 2017-02-10 13:45:51Z teissa $
#
# Apple Safari Nested 'object' Tag Remote Denial Of Service vulnerability
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation allows remote attacker to crash the
affected browser.

Impact Level: Application";

tag_affected = "Apple Safari 4.0.5 on Windows";

tag_insight = "The flaw is due to an error in 'JavaScriptCore.dll' when
processing HTML document composed of many successive occurrences of the
'<object>' substring.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "The host is installed with Apple Safari and is prone to
Denial Of Service vulnerability";

if(description)
{
  script_id(800744);
  script_version("$Revision: 5263 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-10 14:45:51 +0100 (Fri, 10 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-04-01 11:04:35 +0200 (Thu, 01 Apr 2010)");
  script_cve_id("CVE-2010-1131");
  script_bugtraq_id(38884);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_name("Apple Safari Nested 'object' Tag Remote Denial Of Service vulnerability");
  script_xref(name : "URL" , value : "http://vul.hackerjournals.com/?p=7517");
  script_xref(name : "URL" , value : "http://en.securitylab.ru/nvd/392298.php");
  script_xref(name : "URL" , value : "http://downloads.securityfocus.com/vulnerabilities/exploits/38884.php");

  script_tag(name:"qod_type", value:"executable_version");
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_dependencies("secpod_apple_safari_detect_win_900003.nasl");
  script_require_keys("AppleSafari/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("smb_nt.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

# Get Apple Saferi version
appVer = get_kb_item("AppleSafari/Version");
if(!appVer){
  exit(0);
}

# Check Apple Saferi version 4.0.5 =>5.31.22.7
if(version_is_less_equal(version:appVer, test_version:"5.31.22.7"))
{
  dllPath = registry_get_sz(key:"SOFTWARE\Apple Inc.\Apple Application Support",
                           item:"InstallDir");
  if(!isnull(dllPath))
  {
    dllPath += "\JavaScriptCore.dll";
    share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:dllPath);
    file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1", string:dllPath);

    dllVer = GetVer(file:file, share:share);
    if(dllVer)
    {
      # Check JavaScriptCore.dll <= 5.31.22.5
      if(version_is_less_equal(version:dllVer, test_version:"5.31.22.5")){
        security_message(0);
      }
    }
  }
}
