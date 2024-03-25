SELECT Ferienwohnung.*
FROM Ferienwohnung, Bild
WHERE Ferienwohnung.WohnungsID = Bild.WohnungsID
GROUP BY Ferienwohnung.WohnungsID, Ferienwohnung.textuelle_Beschreibung, Ferienwohnung.Anzahl_Zimmer, Ferienwohnung.Groesse, Ferienwohnung.Preis, Ferienwohnung.AdressID
HAVING COUNT(*) > 1;
