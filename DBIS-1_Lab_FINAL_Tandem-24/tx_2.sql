/* SQL DML Statements Aufgabe 2.2 -- Aktualsierung von Daten --
Umzug des Kunden mit der Kundennummer 1 nach 69115 Heidelberg (Deutschland), Schloﬂstraﬂe 1
und Aktualisierung seiner Telefonnummer auf 06221-546372. 
**/

update Adresse
   set strasse = 'Schlossstrasse', Hausnummer = 1, PLZ = 69115, OrtID = (select ort.OrtID from Adresse, ort, Land where adresse.ortid = ort.ortid AND ort.Name = 'Heidelberg' and Ort.ISOCODE = Land.ISOCode AND Land.Name = 'Deutschland')
   Where AdressID = (select AdressID from Kunde where Kundennummer = 1);
   
update Kunde 
  set Telefonnummer = '06221-546372'
  where Kundennummer = 1;
  
commit;
