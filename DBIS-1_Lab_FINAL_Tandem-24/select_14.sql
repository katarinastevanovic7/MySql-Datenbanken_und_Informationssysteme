SELECT *
FROM Ferienwohnung f LEFT OUTER JOIN Belegung b ON F.WohnungsID = b.WohnungsID
    LEFT OUTER JOIN  hat h ON f.WohnungsID = h.WohnungsID 
    LEFT OUTER JOIN  Adresse a ON f.AdressID = a.AdressID
    LEFT OUTER JOIN Ort o ON a.OrtID = o.OrtID
    LEFT OUTER JOIN Land l ON o.ISOCode = l.ISOCode
WHERE h.Name = 'Schwimmbad'
    AND L.Name = 'Tuerkei'
    AND (b.belegungsnummer IS NULL OR ((b.Von > TO_DATE('2016-05-21', 'YYYY-MM-DD') OR b.Bis < TO_DATE('2016-05-01', 'YYYY-MM-DD'))));
    
 SELECT *
FROM Ferienwohnung f LEFT OUTER JOIN Belegung b ON (F.WohnungsID = b.WohnungsID and b.Von <= TO_DATE('2016-05-21', 'YYYY-MM-DD') AND b.Bis >= TO_DATE('2016-05-01', 'YYYY-MM-DD'))
    LEFT OUTER JOIN  hat h ON f.WohnungsID = h.WohnungsID 
    LEFT OUTER JOIN  Adresse a ON f.AdressID = a.AdressID
    LEFT OUTER JOIN Ort o ON a.OrtID = o.OrtID
    LEFT OUTER JOIN Land l ON o.ISOCode = l.ISOCode
WHERE h.Name = 'Schwimmbad'
    AND L.Name = 'Tuerkei'
    AND b.belegungsnummer IS NULL;

    