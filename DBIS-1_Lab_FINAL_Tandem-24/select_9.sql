SELECT  Ferienwohnung.*
FROM Ferienwohnung, Adresse, Ort StartOrt, Distanz, Ort EndeOrt
WHERE Ferienwohnung.AdressID = Adresse.AdressID
  AND Adresse.OrtID = StartOrt.OrtID
  AND ((StartOrt.OrtID = Distanz.EndeOrt AND Distanz.StartOrt = EndeOrt.OrtID) OR (StartOrt.OrtID = Distanz.StartOrt AND Distanz.EndeOrt = EndeOrt.OrtID))
  AND EndeOrt.Name = 'Disneyland'
  AND Distanz.km <= 50
  
  UNION ALL
  
  --Ferienwohnung in Disneyland
SELECT  Ferienwohnung.*
FROM Ferienwohnung, Adresse, Ort, Land
WHERE Ferienwohnung.AdressID = Adresse.AdressID
  AND Adresse.OrtID = Ort.OrtID
  AND Ort.Name ='Disneyland'
  AND Land.Name ='Frankreich';