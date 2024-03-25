SELECT f.*, b.status
FROM (Ferienwohnung f LEFT OUTER JOIN Belegung b ON f.WohnungsID = b.WohnungsID), Adresse a, hat h, Ort o, Land l
WHERE b.belegungsnummer IS NULL AND
      f.adressid = a.adressid
      AND f.WohnungsID = h.WohnungsID
      AND h.Name = 'Schwimmbad'
      AND a.OrtID = o.OrtID
      AND o.ISOCode = l.ISOCode
      AND l.Name = 'Frankreich';