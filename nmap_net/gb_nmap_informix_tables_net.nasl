###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_informix_tables_net.nasl 5505 2017-03-07 10:00:18Z teissa $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Patrik Karlsson
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_summary = "Retrieves a list of tables and column definitions for each database on an Informix server.


SYNTAX:

informix.instance:  specifies the Informix instance to connect to


informix-query.username:  The username used for authentication


informix-query.password:  The password used for authentication

Version 0.1
Created 27/07/2010 - v0.1 - created by Patrik Karlsson <patrik@cqure.net>";

if(description)
{
    script_id(104115);
    script_version("$Revision: 5505 $");
    script_tag(name:"last_modification", value:"$Date: 2017-03-07 11:00:18 +0100 (Tue, 07 Mar 2017) $");
    script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)"); 
    script_tag(name:"cvss_base", value:"4.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
    script_name("Nmap NSE net: informix-tables");


    script_category(ACT_INIT);
    script_tag(name:"qod_type", value:"remote_analysis");
    script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
    script_family("Nmap NSE net");
    script_dependencies("nmap_nse_net.nasl");
    script_mandatory_keys("Tools/Launch/nmap_nse_net");

    script_add_preference(name:"informix.instance", value:"", type:"entry");
    script_add_preference(name:"informix-query.username", value:"", type:"entry");
    script_add_preference(name:"informix-query.password", value:"", type:"entry");

    script_tag(name : "summary" , value : tag_summary);
    exit(0);
}


include("nmap.inc");

# The corresponding NSE script does't belong to the 'safe' category
if (safe_checks()) exit(0);

phase = 0;
if (defined_func("scan_phase")) {
    phase = scan_phase();
}

if (phase == 1) {
    # Get the preferences
    argv = make_array();

    pref = script_get_preference("informix.instance");
    if (!isnull(pref) && pref != "") {
        argv["informix.instance"] = string('"', pref, '"');
    }
    pref = script_get_preference("informix-query.username");
    if (!isnull(pref) && pref != "") {
        argv["informix-query.username"] = string('"', pref, '"');
    }
    pref = script_get_preference("informix-query.password");
    if (!isnull(pref) && pref != "") {
        argv["informix-query.password"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"informix-tables", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"informix-tables");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (informix-tables.nse) http://nmap.org:\n\n';
        if (portspec == "0") {
            security_message(data:output_banner + res[portspec], port:0);
        } else {
            v = split(portspec, sep:"/", keep:0);
            proto = v[0];
            port = v[1];
            security_message(data:output_banner + res[portspec], port:port, protocol:proto);
        }
    }
}
