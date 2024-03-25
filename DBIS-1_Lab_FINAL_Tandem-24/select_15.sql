SELECT Land.Name AS Land, COUNT(Belegung.Belegungsnummer) AS AnzahlBelegungen
FROM Land
LEFT JOIN Ort ON Land.ISOcode = Ort.ISOcode
LEFT JOIN Adresse ON Ort.OrtID = Adresse.OrtID
LEFT JOIN Ferienwohnung ON Adresse.AdressID = Ferienwohnung.AdressID
LEFT JOIN Belegung ON Ferienwohnung.WohnungsID = Belegung.WohnungsID
GROUP BY Land.Name
ORDER BY AnzahlBelegungen DESC;
