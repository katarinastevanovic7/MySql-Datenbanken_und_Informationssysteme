SELECT f.*
FROM Ferienwohnung f, hat h
WHERE f.wohnungsID = h.wohnungsID
      AND h.Name = 'Schwimmbad';


