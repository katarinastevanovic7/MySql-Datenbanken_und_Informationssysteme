CREATE TABLE Land(
	ISOcode CHAR(2) constraint Land_PK PRIMARY KEY,
	Name VARCHAR(256) constraint Land_AK UNIQUE NOT NULL
);
--Erlaeuterung: zweistelliger ISOCode uir Identifizierung des Landes





CREATE TABLE Adresse(
	AdressID VARCHAR(256) constraint Adresse_PK PRIMARY KEY,
	Strasse VARCHAR(256) NOT NULL,
	Hausnummer  VARCHAR(256) NOT NULL,
	PLZ CHAR(10) NOT NULL,
	OrtID CHAR(10) NOT NULL
);
	--Erlaeuterung: PLZ muss eine gueltige PLZ des zugehoerigen Ortes sein
	-- Attributuebergreifende Integritaetsbedingung: Jede Adresse ist eindeutig 
	



CREATE TABLE Flughafen(
	FlughafenID CHAR(3) constraint Flughafen_PK PRIMARY KEY,
	Name VARCHAR(256) NOT NULL constraint Flughafen_AK1 UNIQUE,
	AdressID VARCHAR(256)
        NOT NULL
        CONSTRAINT Flughafen_Adresse_FK REFERENCES Adresse(AdressID) 
        CONSTRAINT Flughafen_AK2 UNIQUE
);
	--Erlaeuterung: beinhaltet 
    --Start und Zielflughafen
    -- Flughafen_C check 'entspricht IATA Code'
	
    



CREATE TABLE Ort(
	OrtID CHAR(10) constraint Ort_PK PRIMARY KEY,
	Name VARCHAR(256) NOT NULL,
	FlughafenID CHAR(3) NOT NULL CONSTRAINT Ort_Flughafen_FK1 REFERENCES Flughafen(FlughafenID),
	ISOcode CHAR(2) NOT NULL CONSTRAINT Ort_Land_FK2 REFERENCES Land(ISOcode)
);
--Erlaeuterung: beinhaltet Start und Ziel -> Entfernung ist somit ermittelbar
	




ALTER TABLE Adresse add (
	CONSTRAINT Adresse_Ort_FK FOREIGN KEY (OrtID) REFERENCES Ort(OrtID)
    DEFERRABLE INITIALLY DEFERRED
);
	




CREATE TABLE Fluggesellschaft(
	Kuerzel CHAR(2) constraint Fluggesellschaft_PK PRIMARY KEY,
	Name VARCHAR(256) NOT NULL,
	Servicequalitaet INT NOT NULL Constraint Fluggesellschaft_C CHECK (Servicequalitaet >= 0 AND Servicequalitaet <= 10)
);
	--nur ganzzahlige Bewertung
    --1=('schlecht') AND 10=('sehr gut')
    --constraint Fluggesellschaft_C CHECK('entspricht IATA Airline Codes')



CREATE TABLE Touristenattraktion (
	Name VARCHAR(256) constraint Touristenattraktion_PK PRIMARY KEY,
	Beschreibung VARCHAR(256) NOT NULL,
	AdressID VARCHAR(256) NOT NULL 
    CONSTRAINT Touristenattraktion_AK UNIQUE 
	CONSTRAINT Touristenattraktion_Adresse_FK  REFERENCES Adresse(AdressID)
);




	
CREATE TABLE Bankverbindung (
	IBAN CHAR(34) constraint Bankverbindung_PK PRIMARY KEY,
	BLZ CHAR(8) NOT NULL,
	BIC CHAR(11) NOT NULL,
	Kontonummer CHAR(10) NOT NULL,
	CONSTRAINT Bankverbindug_AK1 UNIQUE(Kontonummer, BLZ),
	CONSTRAINT Bankverbindug_AK2 UNIQUE(Kontonummer, BIC)
);




	
CREATE TABLE Kunde(
	Kundennummer INT constraint Kunde_PK PRIMARY KEY,
	Geburtsdatum DATE NOT NULL, 
	Name VARCHAR(256) NOT NULL,
	Vorname VARCHAR(256) NOT NULL,
	Telefonnummer VARCHAR(256) NOT NULL,
	Email_Adresse VARCHAR(256) NOT NULL,
	AdressID VARCHAR(256) NOT NULL constraint Kunde_AK1 UNIQUE CONSTRAINT Kunde_Adresse_FK1 REFERENCES Adresse(AdressID) DEFERRABLE INITIALLY IMMEDIATE,
	IBAN CHAR(34) NOT NULL constraint Kunde_AK2 UNIQUE CONSTRAINT Kunde_Bankverbindung_FK2 REFERENCES Bankverbindung(IBAN) DEFERRABLE INITIALLY IMMEDIATE
);
 -- Geburtsdatum <= aktuelles Datum
 
 
 
	
CREATE TABLE Ferienwohnung(
	WohnungsID INT constraint Ferienwohnung_PK PRIMARY KEY,
	Anzahl_Zimmer INT NOT NULL constraint Ferienwohnung_C1 CHECK(Anzahl_Zimmer > 0),
	Preis DECIMAL(8, 2) NOT NULL constraint Ferienwohnung_C2 CHECK(Preis > 0),
	Groesse INTEGER NOT NULL constraint Ferienwohnung_C3 CHECK(Groesse > 0),
	textuelle_Beschreibung VARCHAR(256) NOT NULl,
	AdressID VARCHAR(256) NOT NULL
    CONSTRAINT Ferienwohnung_Adresse_FK REFERENCES Adresse(AdressID) on delete cascade
    DEFERRABLE INITIALLY IMMEDIATE 
);

  
    

	
CREATE TABLE Bild(
    BildID INT constraint Bild_PK PRIMARY KEY,
    Dateipfad VARCHAR(256) NOT NULL,
    Beschreibung VARCHAR(256) NOT NULL,
    WohnungsID INT NOT NULL CONSTRAINT Bild_Ferienwohnung_FK REFERENCES Ferienwohnung(WohnungsID) ON DELETE CASCADE
);
--maximal 4 Bilder pro Ferienwohnung
		


CREATE TABLE Zusatzausstattung(
    Name VARCHAR(256) constraint Zusatzausstattung_PK PRIMARY KEY
);
		



CREATE TABLE Belegung(
    Belegungsnummer INT constraint Belegung_PK PRIMARY KEY,
    Von DATE NOT NULL,
    Bis DATE NOT NULL,
    Status VARCHAR(256) NOT NULL Constraint Belegung_C1 check (Status in ('Gebucht', 'Reserviert')),
    Datum DATE NOT NULL,
    WohnungsID INT NOT NULL CONSTRAINT Belegung_Ferienwohnung_FK1 REFERENCES Ferienwohnung(WohnungsID) ON DELETE CASCADE,
    Kundennummer INT NOT NULL CONSTRAINT Belegung_Kunde_FK2 REFERENCES Kunde(Kundennummer) ON DELETE CASCADE
);
--Attributuebergreifende Integritaetsbedingung: Von < Bis
--Zwei Belegungen der gleichen Ferienwohnung duerfen sich nicht ueberschneiden
--Datum <= Von
--Reservierung kann zu Buchung werden -> nicht umgekehrt



		
CREATE TABLE Rechnung(
	Rechnungsnummer VARCHAR(256) constraint Rechnung_PK PRIMARY KEY,
	Rechnungsdatum DATE,
	Betrag DECIMAL(16,2) NOT NULL,
	Zahlungseingangsdatum DATE,
	Belegungsnummer INT NOT NULL constraint Rechnung_AK UNIQUE CONSTRAINT Rechnung_Belegung_FK REFERENCES Belegung(Belegungsnummer) -- on delete cascade
);
    --Attributuebergreifende Integritaetsbedingung: Rechnungsdatum <= Zahlungseingangsdatum
	--Erlaeuterung: Rechnung kann nur fuer eine Buchung angelegt werden
	--Rechnungsdatum >= Belegungsdatum
	-- Wenn Zahlungseingangsdatum NOT NULL gilt es als bezahlt
    --in Euro
	
    
    

CREATE TABLE hat(
	WohnungsID INT NOT NULL,
	Name VARCHAR(256) NOT NULL,
    PRIMARY KEY(WohnungsID, Name),
	CONSTRAINT hat_Ferienwohnung_FK1 FOREIGN KEY (WohnungsID) REFERENCES Ferienwohnung(WohnungsID) ON DELETE CASCADE,
    CONSTRAINT hat_Zusatzausstattung_FK2 FOREIGN KEY (Name) REFERENCES Zusatzausstattung(Name)
);



		
CREATE TABLE Distanz(
	StartOrt CHAR(10) NOT NULL CONSTRAINT Distanz_StartOrt_Ort_FK  REFERENCES Ort(OrtID) ON DELETE CASCADE,
	EndeOrt CHAR(10) NOT NULL CONSTRAINT Distanz_EndeOrt_Ort_FK  REFERENCES Ort(OrtID) ON DELETE CASCADE,
	km INT NOT NULL constraint Distanz_C1 check (km > 0),
    Constraint Distanz_PK PRIMARY KEY(StartOrt,EndeOrt),
    constraint Distanz_C2 check (StartOrt <> EndeOrt)
);
	
	-- Entfernung zweier Orte soll nur einmal gespeichert werden
	--Erlaeuterung: Entfernung eines Ortes von sich selbst ist NULL
	-- gibt es keinen Eintrag zwischen zwei Orten ist die Distanz NULL
    


	
CREATE TABLE fliegen_zu(
	StartFlughafen CHAR(3) NOT NULL CONSTRAINT fliegen_zu_StartFlughafen_Flughafen_FK  REFERENCES Flughafen(FlughafenID),
	EndeFlughafen CHAR(3) NOT NULL CONSTRAINT fliegen_zu_EndeFlughafen_Flughafen_FK  REFERENCES Flughafen(FlughafenID),
	Kuerzel CHAR(2) NOT NULL CONSTRAINT fliegen_zu_Fluggesellschaft_FK  REFERENCES Fluggesellschaft(Kuerzel),
	constraint fliegen_zu_PK PRIMARY KEY (StartFlughafen, EndeFlughafen,Kuerzel),
	Constraint fliegen_zu_C CHECK( StartFlughafen <> EndeFlughafen)
);







---------------







CREATE or replace VIEW Buchung AS
SELECT Belegungsnummer, Von, Bis, Datum, WohnungsID, Kundennummer
FROM Belegung
WHERE Status = 'Gebucht';


CREATE or replace VIEW Reservierung AS
SELECT Belegungsnummer, Von, Bis, Datum, WohnungsID, Kundennummer
FROM Belegung
WHERE Status = 'Reserviert';


CREATE or replace VIEW Familienwohnung AS
SELECT *
FROM Ferienwohnung
WHERE Groesse > 100
with check option;


CREATE  or replace VIEW UebersichtKunden AS
SELECT K.Kundennummer, K.Name, K.Vorname, K.Telefonnummer, K.Email_Adresse,
A.Strasse, A.Hausnummer, A.PLZ, o.name as ort, l.name as Land,
B.Kontonummer, B.BIC, B.BLZ,
B.IBAN,BK.Belegungsnummer, BK.Von, BK.Bis, BK.Status,BK.Datum, BK.WohnungsID,fw.textuelle_beschreibung AS FerienwohnungName, FW.Anzahl_Zimmer, FW.Groesse, FW.Preis
FROM (Kunde K LEFT OUTER JOIN Belegung BK ON K.Kundennummer = BK.Kundennummer
 LEFT OUTER JOIN  Ferienwohnung FW ON BK.WohnungsID = FW.WohnungsID), Adresse A, Bankverbindung B, Ort o, Land l
WHERE K.AdressID = A.AdressID
 AND K.IBAN = B.IBAN
 AND a.ortid = o.ortid
 AND o.isocode = l.isocode;

-- select * from Zahlungstatus;


CREATE or replace VIEW Zahlungstatus AS
SELECT BK.Belegungsnummer, FW.WohnungsID, fw.textuelle_beschreibung AS FerienwohnungName,
K.Kundennummer, K.Name AS KundenName,
R.Rechnungsnummer, R.Rechnungsdatum, R.Betrag,
CASE WHEN R.Zahlungseingangsdatum IS NOT NULL THEN 'bezahlt' ELSE 'offen' END AS Zahlungsstatus,
R.Zahlungseingangsdatum
FROM Belegung BK LEFT JOIN Rechnung R ON BK.Belegungsnummer = R.Belegungsnummer, Ferienwohnung FW , Kunde K
WHERE BK.WohnungsID = FW.WohnungsID
  AND BK.Kundennummer = K.Kundennummer
  AND bk.status = 'Gebucht';


CREATE or replace VIEW MidAgeKunden AS
SELECT Kunde.*, TO_NUMBER(TO_CHAR(CURRENT_DATE, 'YYYY')) - TO_NUMBER(TO_CHAR(Kunde.Geburtsdatum, 'YYYY')) AS age
FROM Kunde
WHERE TO_NUMBER(TO_CHAR(CURRENT_DATE, 'YYYY')) - TO_NUMBER(TO_CHAR(Kunde.Geburtsdatum, 'YYYY')) BETWEEN 30 AND 40;








-----------------------------



CREATE TABLE StornierteBuchungen (
  StornierungsNr INTEGER PRIMARY KEY,
  Stornierungsdatum DATE NOT NULL ,
  BuchungsNr INTEGER NOT NULL unique,
  Buchungsdatum DATE NOT NULL,
  von DATE NOT NULL,
  bis DATE NOT NULL,
  Buchungswert INTEGER check (Buchungswert >= 0),
  Status varchar(256) NOT NULL check (Status IN ('offen','bezahlt')),
  Kundennummer INTEGER NOT NULL,
  Name varchar(256) NOT NULL,
  WohnungsID INTEGER NOT NULL,
  BeschreibungWohnung varchar(256) NOT NULL,
  check (von < bis), 
  check (Buchungsdatum <= von)
);


 

CREATE SEQUENCE StornierungsNrSequence
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
  

CREATE OR REPLACE FUNCTION BerechneBuchungswert(Tage integer, WID INTEGER)
  RETURN INTEGER
AS
  Buchungswert INTEGER;
  Preis INTEGER;
BEGIN
 
  SELECT Preis INTO Preis
  FROM Ferienwohnung
  WHERE WohnungsID = WID;
  
  Buchungswert := Tage * Preis;
  
  RETURN Buchungswert;
END;
/




CREATE OR REPLACE TRIGGER Storno 
BEFORE DELETE ON Belegung 
FOR EACH ROW 
WHEN (OLD.Status = 'Gebucht')
DECLARE 
    Status VARCHAR2(256);
    anzahlRechnung integer;

    
BEGIN 

    SELECT count(*) into anzahlRechnung
    FROM Rechnung
    WHERE BELEGUNGSNUMMER = :OLD.Belegungsnummer AND ZAHLUNGSEINGANGSDATUM IS NOT NULL;
    
    IF anzahlRechnung >=1 THEN 
      Status := 'bezahlt'; 
    ELSE 
      Status := 'offen'; 
      
    END IF;


    -- Insert-Anweisung f�r StornierteBuchungen
    INSERT INTO StornierteBuchungen (
        StornierungsNr, Stornierungsdatum, BuchungsNr, Buchungsdatum, 
        von, bis, Buchungswert, Status, Kundennummer, Name, WohnungsID, BeschreibungWohnung
    )
    VALUES (
        StornierungsNrSequence.NEXTVAL, 
        CURRENT_DATE, 
        :OLD.Belegungsnummer, 
        :OLD.Datum, 
        :OLD.Von,
        :OLD.Bis, 
        BerechneBuchungswert(:OLD.Bis - :OLD.Von, :OLD.WohnungsID), 
        Status, 
        :OLD.Kundennummer, 
        (SELECT Name FROM Kunde WHERE Kundennummer = :OLD.Kundennummer), 
        :OLD.WohnungsID,
        (SELECT Textuelle_Beschreibung FROM Ferienwohnung WHERE WohnungsID = :OLD.WohnungsID)
    );

    -- L�schen der entsprechenden Rechnung
    DELETE FROM RECHNUNG WHERE Belegungsnummer = :OLD.Belegungsnummer; 
END; 
/




commit;




	
			
	
		