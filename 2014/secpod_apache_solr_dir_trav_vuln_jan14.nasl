###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_apache_solr_dir_trav_vuln_jan14.nasl 6750 2017-07-18 09:56:47Z teissa $
#
# Apache Solr Directory Traversal Vulnerability Jan-14
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:apache:solr";
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.903508";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6750 $");
  script_cve_id("CVE-2013-6397");
  script_bugtraq_id(63935);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-07-18 11:56:47 +0200 (Tue, 18 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-01-29 16:29:04 +0530 (Wed, 29 Jan 2014)");
  script_name("Apache Solr Directory Traversal Vulnerability Jan-14");

  tag_summary =
"This host is installed with Apache Solr and is prone to directory traversal
 vulnerability.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

 tag_insight =
"The flaw is due to improper verification of resource paths passed to certain
Solr REST services within the 'SolrResourceLoader' class.";

  tag_impact =
"Successful exploitation will allow remote attackers to gain potentially
sensitive information.

Impact Level: Application";

  tag_affected =
"Apache Solr before version 4.6";

  tag_solution =
"Upgrade to Apache Solr version 4.6 or later,
For updates refer to http://lucene.apache.org/solr";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);

  script_xref(name : "URL" , value : "http://secunia.com/advisories/55730");
  script_xref(name : "URL" , value : "http://www.openwall.com/lists/oss-security/2013/11/27/1");
  script_xref(name : "URL" , value : "http://lucene.apache.org/solr/4_6_0/changes/Changes.html");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_copyright("Copyright (C) 2014 SecPod");
  script_family("Web application abuses");
  script_dependencies("secpod_apache_solr_detect.nasl");
  script_mandatory_keys("Apache/Solr/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
solrVer = "";
solrPort = "";

# get the port
if(!solrPort = get_app_port(cpe:CPE, nvt:SCRIPT_OID)){
  exit(0);
}

# get the version
if(!solrVer = get_app_version(cpe:CPE, nvt:SCRIPT_OID, port:solrPort)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:solrVer, test_version:"4.6"))
{
  security_message(solrPort);
  exit(0);
}
