###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fsecure_prdts_int_overflow_vuln_lin.nasl 6516 2017-07-04 12:20:47Z cfischer $
#
# F-Secure Product(s) Integer Overflow Vulnerability (Linux)
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation could allow remote attackers to craft the archive
  files with arbitrary codes and can cause integer overflow in the context
  of an affected application.
  Impact Level: System/Application";
tag_affected = "F-Secure Linux Security 7.01 and prior
  F-Secure Anti-Virus Linux Client/Server Security 5.54 and prior
  F-Secure Internet Gatekeeper for Linux 2.16 and prior on Linux.";
tag_insight = "The vulnerability is due to an integer overflow error while scanning
  contents of specially crafted RPM files inside the archives.";
tag_solution = "Apply patch,
  http://www.f-secure.com/security/fsc-2008-3.shtml";
tag_summary = "This host is installed with F-Secure Product(s) and is prone to
  Integer Overflow vulnerability.";

if(description)
{
  script_id(800358);
  script_version("$Revision: 6516 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-04 14:20:47 +0200 (Tue, 04 Jul 2017) $");
  script_tag(name:"creation_date", value:"2009-03-13 14:39:10 +0100 (Fri, 13 Mar 2009)");
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2008-6085");
  script_bugtraq_id(31846);
  script_name("F-Secure Product(s) Integer Overflow Vulnerability (Linux)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/32352");
  script_xref(name : "URL" , value : "http://securitytracker.com/alerts/2008/Oct/1021073.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("gb_fsecure_prdts_detect_lin.nasl");
  script_mandatory_keys("F-Sec/Products/Lin/Installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

# Linux Security
fsavVer = get_kb_item("F-Sec/AV/LnxSec/Ver");
if(fsavVer != NULL)
{
  if(version_is_less(version:fsavVer, test_version:"7.02"))
  {
    security_message(0);
    exit(0);
  }
}

# Client Security
fsavVer = get_kb_item("F-Sec/AV/LnxClntSec/Ver");
if(fsavVer != NULL)
{
  if(version_is_less(version:fsavVer, test_version:"5.54.7410"))
  {
    security_message(0);
    exit(0);
  }
}

# Server Security
fsavVer = get_kb_item("F-Sec/AV/LnxSerSec/Ver");
if(fsavVer != NULL)
{
  if(version_is_less(version:fsavVer, test_version:"5.54.7410"))
  {
    security_message(0);
    exit(0);
  }
}

# Internet Gatekeeper
fsigkVer = get_kb_item("F-Sec/IntGatekeeper/Lnx/Ver");
if(fsigkVer != NULL)
{
  if(version_is_less(version:fsigkVer, test_version:"2.16.580")){
    security_message(0);
  }
}
