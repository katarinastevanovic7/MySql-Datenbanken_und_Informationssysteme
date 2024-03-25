SELECT k.Kundennummer, COUNT(*) AS AnzahlBuchungen
FROM Kunde k, Belegung b
WHERE k.Kundennummer = b.Kundennummer
     AND k.Name = '&name'
GROUP BY k.Kundennummer;

SELECT k.Name, COUNT(*) AS AnzahlBuchungen
FROM Kunde k, Belegung b
WHERE k.Kundennummer = b.Kundennummer
     AND k.Name = '&name'
GROUP BY k.Name;

SELECT *
FROM Kunde k, Belegung b
WHERE k.Kundennummer = b.Kundennummer
     AND k.Name = '&name'
     order by k.Name