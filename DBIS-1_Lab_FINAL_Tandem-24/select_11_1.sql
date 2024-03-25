SELECT  f.*
FROM Ferienwohnung f, hat h, Adresse a, Ort o, Land l
WHERE f.WohnungsID = h.WohnungsID
  AND f.AdressID = a.AdressID
  AND a.OrtID = o.OrtID
  AND h.Name = 'Schwimmbad'
  AND o.ISOcode = l.isocode
  and l.name = 'Frankreich'  
  and f.WohnungsID in (select b.WohnungsID from belegung b);