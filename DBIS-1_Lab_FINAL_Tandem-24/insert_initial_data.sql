

-- alter session 

insert into Land (ISOcode, Name) values ('DE', 'Deutschland');
insert into Land (ISOcode, Name) values ('CH', 'Schweiz');
insert into Land (ISOcode, Name) values ('TR', 'Tuerkei');
insert into Land (ISOcode, Name) values ('FR', 'Frankreich');
insert into Land (ISOcode, Name) values ('ES', 'Spanien');
insert into Land (ISOcode, Name) values ('GL', 'Groenland');



insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (1,'78467','ReuteStrasse','104',1);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (2,'69115','HauptStrasse','12',3);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (3,'70173','SchlossStrasse','54',2);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (4,'3001','AlpenStrasse','11',5);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (5,'8001','Seeweg','23',6);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (6,'78462','RheingutStrasse','14',1);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (7,'2349','Highway','5',9);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (8,'78461','MarkgrafenStrasse','33',1);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (9,'2234','Zur Piste','189',7);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (10,'8234','rue Monsieur','980',11);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (11,'8787','rue de gaulle','22',13);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (12,'8792','rue de la Maison Blanche','32',12);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (13,'8792','rue liberte','78',12);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (14,'2321','Strandweg','90',10);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (15,'2321','Strandweg','91',10);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (16,'5221','Calle del torro','821',14);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (17,'2321','Strandweg','45',10);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (18,'78231','Europapark','1',4);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (19,'78463','SeeStrasse','12',1);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (20,'2371','Bergweg','78',8);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (21,'1352','GreenOne','29',6);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (22,'8787','rue de gaulle','10',13);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (23,'60541','Am Flughafen','2',15);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (24,'1452','Sabiha Gökcen','1',16);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (25,'5098','Flughafen-Allee','100',6);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (26,'8792','Charles de Gaulle','1',12);
insert into Adresse (AdressID, PLZ, Strasse, Hausnummer, OrtID) values (27,'08820','Aeropuerto de Barcelona','10',14);

insert into Flughafen (FlughafenID, Name, AdressID) values (1,'Frankfurt',23);
insert into Flughafen (FlughafenID, Name, AdressID) values (2,'Istanbul',24);
insert into Flughafen (FlughafenID, Name, AdressID) values (3,'Zuerich',25);
insert into Flughafen (FlughafenID, Name, AdressID) values (4,'Paris',26);
insert into Flughafen (FlughafenID, Name, AdressID) values (5,'Barcelona',27);

insert into Ort (OrtID,Name,ISOcode,FlughafenID) values (1,'Konstanz','DE',1);
insert into Ort (OrtID,Name,ISOcode,FlughafenID) values (2,'Stuttgart','DE',1);
insert into Ort (OrtID,Name,ISOcode,FlughafenID) values (3,'Heidelberg','DE',1);
insert into Ort (OrtID,Name,ISOcode,FlughafenID) values (4,'Rust','DE',1);
insert into Ort (OrtID,Name,ISOcode,FlughafenID) values (5,'Bern','CH',3);
insert into Ort (OrtID,Name,ISOcode,FlughafenID) values (6,'Zuerich','CH',3);
insert into Ort (OrtID,Name,ISOcode,FlughafenID) values (7,'Chur','CH',3);
insert into Ort (OrtID,Name,ISOcode,FlughafenID) values (8,'Flims-Laax','CH',3);
insert into Ort (OrtID,Name,ISOcode,FlughafenID) values (9,'Oeludeniz','TR',2);
insert into Ort (OrtID,Name,ISOcode,FlughafenID) values (10,'Antalya','TR',2);
insert into Ort (OrtID,Name,ISOcode,FlughafenID) values (11,'Bordeaux','FR',4);
insert into Ort (OrtID,Name,ISOcode,FlughafenID) values (12,'Paris','FR',4);
insert into Ort (OrtID,Name,ISOcode,FlughafenID) values (13,'Disneyland','FR',4);
insert into Ort (OrtID,Name,ISOcode,FlughafenID) values (14,'Barcelona','ES',5);
insert into Ort (OrtID,Name,ISOcode,FlughafenID) values (15,'Frankfurt','DE',1);
insert into Ort (OrtID,Name,ISOcode,FlughafenID) values (16,'Istanbul','TR',2);



insert into Fluggesellschaft (Kuerzel, Name, Servicequalitaet) values (1,'Lufthansa',1);
insert into Fluggesellschaft (Kuerzel, Name, Servicequalitaet) values (2,'German Wings',4);
insert into Fluggesellschaft (Kuerzel, Name, Servicequalitaet) values (3,'Thomas Cook',8);
insert into Fluggesellschaft (Kuerzel, Name, Servicequalitaet) values (4,'Hapag Lloyd',9);
insert into Fluggesellschaft (Kuerzel, Name, Servicequalitaet) values (5,'Swiss',8);

insert into Touristenattraktion (Name, Beschreibung, AdressID) values ('Europapark','Deutschlands Nr. 1',18);
insert into Touristenattraktion (Name, Beschreibung, AdressID) values ('Hoernle','Bodensee-Strandbad',19);
insert into Touristenattraktion (Name, Beschreibung, AdressID) values ('Flims-Laax Arena','Skigebiet',20);
insert into Touristenattraktion (Name, Beschreibung, AdressID) values ('GreenOne','Golfplatz',21);
insert into Touristenattraktion (Name, Beschreibung, AdressID) values ('Disneyland','Freizeitpark',22);

insert into Bankverbindung (IBAN, BLZ, BIC, Kontonummer) values ('DE85692717230007823212','69271723','KARSDE66XXX','7823212');
insert into Bankverbindung (IBAN, BLZ, BIC, Kontonummer) values ('DE83692717230008929368','32793968','BARSDE77XXX','8929368');
insert into Bankverbindung (IBAN, BLZ, BIC, Kontonummer) values ('DE85692717230001347291','69271723','KARSDE66XXX','1347291');
insert into Bankverbindung (IBAN, BLZ, BIC, Kontonummer) values ('CH85692717230008792978','29788431','MEMECH88XXX','8792978');
insert into Bankverbindung (IBAN, BLZ, BIC, Kontonummer) values ('CH85692717230009082780','87890271','KONSCH12XXX','9082780');
insert into Bankverbindung (IBAN, BLZ, BIC, Kontonummer) values ('DE85692717230007322890','69271723','KARSDE66XXX','7322890');

insert into Kunde (Kundennummer, Name, Vorname, Email_Adresse, Telefonnummer, Geburtsdatum, IBAN, AdressID) values (1,'Napf','Karl','knapf@gmx.de','07531-123456',TO_DATE('1960-01-01', 'YYYY-MM-DD'),'DE85692717230007823212',1);
insert into Kunde (Kundennummer, Name, Vorname, Email_Adresse, Telefonnummer, Geburtsdatum, IBAN, AdressID) values (2,'Meier','Hans','meiers.hans@t-online.de','06221-999888',TO_DATE('1975-01-02', 'YYYY-MM-DD'),'DE83692717230008929368',2);
insert into Kunde (Kundennummer, Name, Vorname, Email_Adresse, Telefonnummer, Geburtsdatum, IBAN, AdressID) values (3,'Huber','Franz','huber@t-online.de','0711-554673',TO_DATE('1980-01-03', 'YYYY-MM-DD'),'DE85692717230001347291',3);
insert into Kunde (Kundennummer, Name, Vorname, Email_Adresse, Telefonnummer, Geburtsdatum, IBAN, AdressID) values (4,'Eber','Klaus','eber@bluewin.ch','+41-171-9864785',TO_DATE('1985-01-04', 'YYYY-MM-DD'),'CH85692717230008792978',4);
insert into Kunde (Kundennummer, Name, Vorname, Email_Adresse, Telefonnummer, Geburtsdatum, IBAN, AdressID) values (5,'Meier','Egon','meier@gmail. com','+41-171-9864786',TO_DATE('1990-01-05', 'YYYY-MM-DD'),'CH85692717230009082780',5);
insert into Kunde (Kundennummer, Name, Vorname, Email_Adresse, Telefonnummer, Geburtsdatum, IBAN, AdressID) values (6,'Knopf','Jim','jim.knopf@gmx.net','0171-9876543',TO_DATE('1995-01-06', 'YYYY-MM-DD'),'DE85692717230007322890',6);

insert into Ferienwohnung (WohnungsID, textuelle_Beschreibung, Anzahl_Zimmer, Groesse, Preis, AdressID) values (1,'Finka',6,200,349.00,7);
insert into Ferienwohnung (WohnungsID, textuelle_Beschreibung, Anzahl_Zimmer, Groesse, Preis, AdressID) values (2,'Ferienwohnung mit Seeblick',2,45,120.00,8);
insert into Ferienwohnung (WohnungsID, textuelle_Beschreibung, Anzahl_Zimmer, Groesse, Preis, AdressID) values (3,'im Schnee',3,150,249.00,9);
insert into Ferienwohnung (WohnungsID, textuelle_Beschreibung, Anzahl_Zimmer, Groesse, Preis, AdressID) values (4,'direkt am Meer',4,100,249.00,10);
insert into Ferienwohnung (WohnungsID, textuelle_Beschreibung, Anzahl_Zimmer, Groesse, Preis, AdressID) values (5,'direkt am Park',3,110,289.00,11);
insert into Ferienwohnung (WohnungsID, textuelle_Beschreibung, Anzahl_Zimmer, Groesse, Preis, AdressID) values (6,'mit Blick auf Eiffelturm',2,70,549.00,12);
insert into Ferienwohnung (WohnungsID, textuelle_Beschreibung, Anzahl_Zimmer, Groesse, Preis, AdressID) values (7,'Dachterrassewohnung zentral',6,110,158.00,13);
insert into Ferienwohnung (WohnungsID, textuelle_Beschreibung, Anzahl_Zimmer, Groesse, Preis, AdressID) values (8,'zweigeschoessiges Haus',12,200,240.00,14);
insert into Ferienwohnung (WohnungsID, textuelle_Beschreibung, Anzahl_Zimmer, Groesse, Preis, AdressID) values (9,'Topvilla am Strand',5,111,159.00,15);
insert into Ferienwohnung (WohnungsID, textuelle_Beschreibung, Anzahl_Zimmer, Groesse, Preis, AdressID) values (10,'Ferienhaus am Strand',4,100,299.00,16);
insert into Ferienwohnung (WohnungsID, textuelle_Beschreibung, Anzahl_Zimmer, Groesse, Preis, AdressID) values (11,'Strandbungalow',4,100,150.00,17);

insert into Bild (BildID, Beschreibung, Dateipfad, WohnungsID) values (1,'Aussenansicht','1_1.jpg',1);
insert into Bild (BildID, Beschreibung, Dateipfad, WohnungsID) values (2,'Innenansicht','1_2.jpg',1);
insert into Bild (BildID, Beschreibung, Dateipfad, WohnungsID) values (3,'Aussenansicht','2_1.jpg',2);
insert into Bild (BildID, Beschreibung, Dateipfad, WohnungsID) values (4,'Innenansicht','2_2.jpg',2);
insert into Bild (BildID, Beschreibung, Dateipfad, WohnungsID) values (5,'Garage','5_1.jpg',5);
insert into Bild (BildID, Beschreibung, Dateipfad, WohnungsID) values (6,'Dachterrasse','8.jpg',8);

insert into Zusatzausstattung (Name) values ('Schwimmbad');
insert into Zusatzausstattung (Name) values ('Sauna');
insert into Zusatzausstattung (Name) values ('Autoabstellplatz');
insert into Zusatzausstattung (Name) values ('Aufzug');
insert into Zusatzausstattung (Name) values ('Kinderbetreuung');
insert into Zusatzausstattung (Name) values ('Sat-TV');
insert into Zusatzausstattung (Name) values ('Dachterrasse');
insert into Zusatzausstattung (Name) values ('Garage');
insert into Zusatzausstattung (Name) values ('Reinigung');

insert into Belegung (Belegungsnummer, Datum, Von, Bis, Status, WohnungsID, Kundennummer) values (1,TO_DATE('2016-02-12', 'YYYY-MM-DD'),TO_DATE('2016-03-11', 'YYYY-MM-DD'),TO_DATE('2016-03-13', 'YYYY-MM-DD'),'Gebucht',4,2);
insert into Belegung (Belegungsnummer, Datum, Von, Bis, Status, WohnungsID, Kundennummer) values (2,TO_DATE('2016-03-13', 'YYYY-MM-DD'),TO_DATE('2016-05-11', 'YYYY-MM-DD'),TO_DATE('2016-05-17', 'YYYY-MM-DD'),'Reserviert',5,2);
insert into Belegung (Belegungsnummer, Datum, Von, Bis, Status, WohnungsID, Kundennummer) values (3,TO_DATE('2016-02-10', 'YYYY-MM-DD'),TO_DATE('2016-04-03', 'YYYY-MM-DD'),TO_DATE('2016-04-23', 'YYYY-MM-DD'),'Reserviert',5,3);
insert into Belegung (Belegungsnummer, Datum, Von, Bis, Status, WohnungsID, Kundennummer) values (4,TO_DATE('2016-02-09', 'YYYY-MM-DD'),TO_DATE('2016-07-04', 'YYYY-MM-DD'),TO_DATE('2016-07-05', 'YYYY-MM-DD'),'Gebucht',6,4);
insert into Belegung (Belegungsnummer, Datum, Von, Bis, Status, WohnungsID, Kundennummer) values (5,TO_DATE('2016-02-14', 'YYYY-MM-DD'),TO_DATE('2016-04-28', 'YYYY-MM-DD'),TO_DATE('2016-05-02', 'YYYY-MM-DD'),'Reserviert',10,2);
insert into Belegung (Belegungsnummer, Datum, Von, Bis, Status, WohnungsID, Kundennummer) values (6,TO_DATE('2016-02-18', 'YYYY-MM-DD'),TO_DATE('2016-05-04', 'YYYY-MM-DD'),TO_DATE('2016-05-22', 'YYYY-MM-DD'),'Gebucht',8,3);
insert into Belegung (Belegungsnummer, Datum, Von, Bis, Status, WohnungsID, Kundennummer) values (7,TO_DATE('2016-02-01', 'YYYY-MM-DD'),TO_DATE('2016-05-07', 'YYYY-MM-DD'),TO_DATE('2016-05-08', 'YYYY-MM-DD'),'Gebucht',2,1);
insert into Belegung (Belegungsnummer, Datum, Von, Bis, Status, WohnungsID, Kundennummer) values (8,TO_DATE('2016-02-11', 'YYYY-MM-DD'),TO_DATE('2016-05-22', 'YYYY-MM-DD'),TO_DATE('2016-05-28', 'YYYY-MM-DD'),'Gebucht',9,5);
insert into Belegung (Belegungsnummer, Datum, Von, Bis, Status, WohnungsID, Kundennummer) values (9,TO_DATE('2016-02-07', 'YYYY-MM-DD'),TO_DATE('2016-07-03', 'YYYY-MM-DD'),TO_DATE('2016-07-08', 'YYYY-MM-DD'),'Gebucht',10,5);
insert into Belegung (Belegungsnummer, Datum, Von, Bis, Status, WohnungsID, Kundennummer) values (10,TO_DATE('2016-02-10', 'YYYY-MM-DD'),TO_DATE('2016-05-01', 'YYYY-MM-DD'),TO_DATE('2016-05-24', 'YYYY-MM-DD'),'Reserviert',1,4);

insert into Rechnung (Rechnungsnummer, Zahlungseingangsdatum, Rechnungsdatum, Betrag, Belegungsnummer) values (1,TO_DATE('2016-03-18', 'YYYY-MM-DD'),TO_DATE('2016-03-15', 'YYYY-MM-DD'),489.00,1);
insert into Rechnung (Rechnungsnummer, Zahlungseingangsdatum, Rechnungsdatum, Betrag, Belegungsnummer) values (4, NULL, TO_DATE('2016-04-17', 'YYYY-MM-DD'),549.00,4);

insert into hat (Name, WohnungsID) values ('Sauna',1);
insert into hat (Name, WohnungsID) values ('Schwimmbad',1);
insert into hat (Name, WohnungsID) values ('Autoabstellplatz',2);
insert into hat (Name, WohnungsID) values ('Aufzug',2);
insert into hat (Name, WohnungsID) values ('Sauna',3);
insert into hat (Name, WohnungsID) values ('Kinderbetreuung',5);
insert into hat (Name, WohnungsID) values ('Schwimmbad',5);
insert into hat (Name, WohnungsID) values ('Schwimmbad',6);
insert into hat (Name, WohnungsID) values ('Schwimmbad',7);
insert into hat (Name, WohnungsID) values ('Dachterrasse',8);
insert into hat (Name, WohnungsID) values ('Reinigung',8);
insert into hat (Name, WohnungsID) values ('Sat-TV',8);
insert into hat (Name, WohnungsID) values ('Garage',9);
insert into hat (Name, WohnungsID) values ('Schwimmbad',9);
insert into hat (Name, WohnungsID) values ('Schwimmbad',11);

--insert into Distanz (StartOrt, EndeOrt, km) values (1,1,0);
insert into Distanz (StartOrt, EndeOrt, km) values (1,4,180);
insert into Distanz (StartOrt, EndeOrt, km) values (7,6,120);
insert into Distanz (StartOrt, EndeOrt, km) values (7,8,40);
insert into Distanz (StartOrt, EndeOrt, km) values (11,13,420);
insert into Distanz (StartOrt, EndeOrt, km) values (13,8,110);
insert into Distanz (StartOrt, EndeOrt, km) values (12,13,30);

insert into fliegen_zu (StartFlughafen, EndeFlughafen, Kuerzel) values (1,5,1);
insert into fliegen_zu (StartFlughafen, EndeFlughafen, Kuerzel) values (1,2,2);
insert into fliegen_zu (StartFlughafen, EndeFlughafen, Kuerzel) values (1,4,2);
insert into fliegen_zu (StartFlughafen, EndeFlughafen, Kuerzel) values (1,4,1);
insert into fliegen_zu (StartFlughafen, EndeFlughafen, Kuerzel) values (1,4,3);
insert into fliegen_zu (StartFlughafen, EndeFlughafen, Kuerzel) values (4,5,4);
insert into fliegen_zu (StartFlughafen, EndeFlughafen, Kuerzel) values (4,3,2);



commit;