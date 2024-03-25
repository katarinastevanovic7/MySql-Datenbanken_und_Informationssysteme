SELECT f.*
FROM Ferienwohnung f, Adresse a, Ort o, Land l
WHERE f.AdressID = a.AdressID
  AND a.OrtID = o.OrtID
  AND o.ISOCode = l.ISOCode
  AND l.Name='Frankreich'
  AND f.WohnungsID IN (
    SELECT WohnungsID
    FROM Belegung b
    GROUP BY WohnungsID
    HAVING COUNT(*) > (
        SELECT COUNT(*)
        FROM Ferienwohnung f, Adresse a, Ort o, Land l
        WHERE f.AdressID = a.AdressID
          AND a.OrtID = o.OrtID
          AND o.ISOcode = l.ISOCode
          AND l.Name ='Deutschland' 
    )
);





    








