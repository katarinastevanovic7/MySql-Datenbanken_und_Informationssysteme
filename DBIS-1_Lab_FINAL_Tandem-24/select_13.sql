-- Welche Ferienwohnungen mit Schwimmbad sind in der Türkei in der Zeit vom 01.05.2016 - 21.05.2016  bereits belegt (d.h. gebucht oder reserviert)?
SELECT DISTINCT f.*
FROM Belegung b, Ferienwohnung f, Adresse a, Ort o, Land l, hat h
WHERE f.WohnungsID = h.WohnungsID
    AND h.Name = 'Schwimmbad'
    AND f.AdressID = a.AdressID
    AND a.OrtID = o.OrtID
    AND o.ISOCode = l.ISOCode
    AND l.Name = 'Tuerkei'
    AND b.Von <= TO_DATE('2016-05-21', 'YYYY-MM-DD')
    AND b.Bis >= TO_DATE('2016-05-01', 'YYYY-MM-DD')
    AND b.WohnungsID = f.WohnungsID;