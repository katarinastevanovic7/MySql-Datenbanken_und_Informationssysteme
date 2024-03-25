SELECT COUNT(*) AS AnzahlBuchungen
FROM Belegung
WHERE Kundennummer = &kunden_nummer and belegung.status = 'Gebucht';