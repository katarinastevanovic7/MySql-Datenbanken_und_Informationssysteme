-- Fremdschlüssel-Constraints zuerst löschen
alter table Adresse drop constraint Adresse_Ort_FK;


drop table Storniertebuchungen;
drop sequence StornierungsNrSequence;
drop function BerechneBuchungswert;
drop trigger Storno;



--Views löschen
drop view MidAgeKunden;
drop view Zahlungstatus;
drop view UebersichtKunden;
drop view Familienwohnung;
drop view Reservierung;
drop view Buchung;

-- Dann die Tabellen löschen
drop table fliegen_zu ;
drop table Distanz ;
drop table hat;
drop table Rechnung;
drop table Belegung;
drop table Zusatzausstattung;
drop table Bild ;
drop table Ferienwohnung;
drop table Kunde ;
drop table Bankverbindung ;
drop table Touristenattraktion;
drop table Fluggesellschaft;
drop table Ort;
drop table Flughafen;
drop table Adresse ;
drop table Land;