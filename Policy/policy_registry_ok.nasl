###############################################################################
# OpenVAS Vulnerability Test
# $Id: policy_registry_ok.nasl 4928 2017-01-03 09:00:28Z cfi $
#
# Windows Registry Check: OK 
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
#
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
  script_oid("1.3.6.1.4.1.25623.1.0.105989");
  script_version("$Revision: 4928 $");
  script_tag(name:"last_modification", value:"$Date: 2017-01-03 10:00:28 +0100 (Tue, 03 Jan 2017) $");
  script_tag(name:"creation_date", value:"2015-05-22 12:45:19 +0700 (Fri, 22 May 2015)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("Windows Registry Check: OK");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2015 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("policy_registry.nasl");
  script_mandatory_keys("policy/registry_ok");

  script_tag(name:"summary", value:"List registry entries which pass the registry
  policy check.");

  script_tag(name:"qod_type", value:"registry");

  exit(0);
}

passes = get_kb_item("policy/registry_ok");

if (passes) {
  report = 'The following registry entries are correct:\n\n';
  report += 'Registry entry | Present | Value checked | Value set\n' + passes;
  log_message(data:report, port:0);
}

exit(0);
