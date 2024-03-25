SELECT f.wohnungsid, f.textuelle_beschreibung, a.strasse, a.hausnummer, a.plz, o.name as ort, l.name as land
FROM Ferienwohnung f, Adresse a, ort o, land l
where f.adressid = a.adressid AND
      a.ortid = o.ortid AND
      o.isocode = l.isocode AND
      l.name = 'Frankreich';
      