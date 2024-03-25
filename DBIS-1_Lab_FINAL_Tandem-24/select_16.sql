SELECT F.WohnungsID,
    COUNT(CASE WHEN b.Status = 'Reserviert' THEN b.Belegungsnummer END) AS Anzahl_Reservierungen,
    COUNT(CASE WHEN b.Status = 'Gebucht' THEN b.Belegungsnummer END) AS Anzahl_Buchungen
FROM Ferienwohnung F
LEFT JOIN Belegung b ON F.WohnungsID = b.WohnungsID
GROUP BY F.WohnungsID;
