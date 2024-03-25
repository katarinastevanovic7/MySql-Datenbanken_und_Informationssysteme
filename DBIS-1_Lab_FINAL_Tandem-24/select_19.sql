SELECT fg.name
FROM Ferienwohnung f, Adresse a, Ort o, Flughafen fh, Fluggesellschaft fg, fliegen_zu fz
WHERE WohnungsID = &ferienwohnung_nummer
  AND f.AdressID = a.AdressID
  AND a.OrtID = o.OrtID
  AND o.FlughafenID = fh.FlughafenID
  AND fh.FlughafenID = fz.Endeflughafen
  AND fz.Kuerzel = fg.Kuerzel
  AND o.ISOCode NOT IN 
     (SELECT o2.ISOCode
      FROM Fluggesellschaft fg, Flughafen fh, Adresse a2, Ort o2
      WHERE fz.Kuerzel = fg.Kuerzel 
      AND fh.FlughafenID = fz.StartFlughafen
      AND fh.AdressID = a2.AdressID
      AND a2.OrtID = o2.OrtID);
  





