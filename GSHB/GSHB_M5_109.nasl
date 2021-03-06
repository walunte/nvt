###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_M5_109.nasl 7067 2017-09-06 11:50:33Z teissa $
#
# IT-Grundschutz, 14. EL, Ma�nahme 5.109
#
# Authors:
# Thomas Rotter <thomas.rotter@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_id(95071);
  script_version("$Revision: 7067 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-06 13:50:33 +0200 (Wed, 06 Sep 2017) $");
  script_tag(name:"creation_date", value:"2015-03-25 10:14:11 +0100 (Wed, 25 Mar 2015)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"qod_type", value:"remote_app");
  script_name("IT-Grundschutz M5.109: Einsatz eines E-Mail-Scanners auf dem Mailserver");
  script_xref(name : "URL" , value : "http://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKataloge/Inhalt/_content/m/m05/m05109.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2015 Greenbone Networks GmbH");
  script_family("IT-Grundschutz");
  script_mandatory_keys("Compliance/Launch/GSHB");
  script_dependencies("GSHB/GSHB_smtp_eicar_test.nasl");
#  script_require_keys("GSHB/Eicar");
  script_tag(name : "summary" , value :
"IT-Grundschutz M5.109: Einsatz eines E-Mail-Scanners auf dem Mailserver.

Stand: 14. Erg�nzungslieferung (14. EL).
");

  exit(0);
}

include("itg.inc");

name = 'IT-Grundschutz M5.109: Einsatz eines E-Mail-Scanners auf dem Mailserver\n';

gshbm =  "IT-Grundschutz M5.109: ";

Eicar = get_kb_item("GSHB/Eicar");
log = get_kb_item("GSHB/Eicar/log");
portlist = get_kb_list("Services/smtp");
foreach p (portlist) if (p == "25") port=p;

if(Eicar >< "error" && port == "25"){
  result = string("Fehler");
  if (!log) desc = string("Beim Testen des Systems trat ein Fehler auf.");
  if (log) desc = string("Beim Testen des Systems trat ein Fehler auf:\n" + log);
}else if(!portlist){
  result = string("nicht zutreffend");
  desc = string("Das System wurde nicht als Mailserver erkannt.");
}else if(Eicar == "true"){
  result = string("unvollst�ndig");
  desc = string('Es wurde erfolgreich eine Mail mit Eicar-Testfiles verschickt.\nBitte pr�fen Sie das in der Scan Konfiguration konfigurierte\nEmpf�ngerpostfach sowie den konfigurierten MTA..');
}else if(Eicar == "fail"){
  result = string("unvollst�ndig");
  desc = string('Es konnte anscheinend keine Mail mit Eicar-Testfiles verschickt\nwerden. Bitte pr�fen Sie trotzdem das in der Scan Konfiguration\nkonfigurierte Empf�ngerpostfach sowie den konfigurierten MTA..');
} 

set_kb_item(name:"GSHB/M5_109/result", value:result);
set_kb_item(name:"GSHB/M5_109/desc", value:desc);
set_kb_item(name:"GSHB/M5_109/name", value:name);

silence = get_kb_item("GSHB/silence");
if (!silence) itg_send_details (itg_id: 'GSHB/M5_109');

exit(0);
