SELECT  f.*
FROM Ferienwohnung f, hat h1, hat h2
WHERE f.WohnungsID = h1.WohnungsID 
    AND f.WohnungsID = h2.WohnungsID
    AND h1.Name ='Schwimmbad' 
    AND h2.Name='Sauna';



