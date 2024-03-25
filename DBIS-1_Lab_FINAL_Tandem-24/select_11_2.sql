SELECT distinct f.*
FROM Ferienwohnung f, hat h, Belegung b, Adresse a, Ort o, Land l
WHERE f.WohnungsID = h.WohnungsID
  AND f.WohnungsID = b.WohnungsID
  AND f.AdressID = a.AdressID
  AND a.OrtID = o.OrtID
  AND h.Name = 'Schwimmbad'
  AND o.ISOcode = l.isocode
  and l.name = 'Frankreich'
  and b.status = 'Gebucht'