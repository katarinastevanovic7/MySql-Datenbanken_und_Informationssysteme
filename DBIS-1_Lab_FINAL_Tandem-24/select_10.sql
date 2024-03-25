SELECT DISTINCT Ferienwohnung.*
FROM Ferienwohnung, Adresse a_start, Adresse a_ziel, Ort StartOrt, Distanz, Ort EndeOrt, Touristenattraktion, Land 
WHERE Ferienwohnung.AdressID = a_start.AdressID
  AND a_start.OrtID = StartOrt.OrtID
  AND StartOrt.ISOCode = Land.ISOCode
  AND Land.Name = 'Frankreich'
  AND StartOrt.OrtID = Distanz.StartOrt
  AND Distanz.EndeOrt = a_ziel.OrtID
  AND a_ziel.AdressID = Touristenattraktion.AdressID
  AND Touristenattraktion.Name = 'Disneyland'
  AND Distanz.km <= 100
  

UNION ALL

   --Ferienwohnung in Disneyland
SELECT Ferienwohnung.*
FROM Ferienwohnung, Adresse a_start, Adresse a_ziel, Ort StartOrt,Ort EndeOrt, Touristenattraktion, Land
WHERE Ferienwohnung.AdressID = a_start.AdressID
  AND a_start.OrtID = StartOrt.OrtID
  AND StartOrt.ISOCode = Land.ISOCode
  AND Land.name = 'Frankreich'
  AND Touristenattraktion.Name = 'Disneyland'
  AND Touristenattraktion.AdressID = a_ziel.AdressID
  AND a_ziel.OrtID = EndeOrt.OrtID
  AND StartOrt.OrtID = EndeOrt.OrtID;
  
  
  
 
 