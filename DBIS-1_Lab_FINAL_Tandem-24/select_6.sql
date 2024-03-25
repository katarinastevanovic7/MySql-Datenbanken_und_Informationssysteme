SELECT DISTINCT f.*
FROM Ferienwohnung f, hat h
WHERE f.WohnungsID = h.WohnungsID
    AND h.Name ='Schwimmbad' OR h.Name = 'Sauna';





