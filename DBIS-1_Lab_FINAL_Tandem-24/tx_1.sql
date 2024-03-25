/* SQL DML Statements Aufgabe 2.1 -- Einfügen von Daten --
. Hinzufügen einer Ferienwohnung "SeaView" mit Ferienwohnungsnummer 999, 4 Zimmern und 100qm
Größe, Preis 100 EUR/Tag sowie Sonderausstattungen Whirlpool und Garten in 2349 Öludeniz (Türkei), Highway 6. 

**/


insert into Zusatzausstattung
values('Whirlpool');
insert into Zusatzausstattung
values('Garten');


insert into Adresse 
values ((SELECT count(AdressID)+1 FROM Adresse), 'Highway', 6, 2349, (SELECT OrtID FROM Ort,Land WHERE Ort.Name = 'Oeludeniz' AND Ort.ISOCODE = Land.ISOCode AND Land.Name = 'Tuerkei')
);


insert into Ferienwohnung 
values (999, 4, 100, 100,'SeaView',(SELECT AdressID FROM Adresse,Ort WHERE Adresse.OrtID = Ort.OrtID AND Ort.Name = 'Oeludeniz' AND Adresse.Strasse = 'Highway' AND Adresse.Hausnummer = '6'));




insert into hat 
values (999, 'Whirlpool');


insert into hat 
values (999, 'Garten');


commit;