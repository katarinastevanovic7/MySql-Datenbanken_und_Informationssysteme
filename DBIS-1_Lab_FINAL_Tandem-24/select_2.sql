-- SQL:99
SELECT DISTINCT Kunde.*
FROM Belegung
JOIN Kunde ON Belegung.Kundennummer = Kunde.Kundennummer
WHERE Belegung.WohnungsID = &ferienwohnung_nummer and belegung.status = 'Reserviert';
-- Distinct = Duplikate werden entfernt, nur eindeutige Datensätze im Ergebnis
-- JOIN = verbindet Tabellen Kunde und Belegung, Kundennummer wird verglichen 
--fehler bei kundennummer=4

--SQL-92
SELECT DISTINCT k.*
FROM   Belegung b, Kunde k
WHERE  b.Kundennummer = k.Kundennummer AND 
       b.WohnungsID = &ferienwohnung_nummer AND 
       b.status = 'Reserviert';