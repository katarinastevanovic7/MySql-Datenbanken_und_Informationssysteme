/* SQL DML Statements Aufgabe 2.3 -- L�schen von Daten --
L�schen der Ferienwohnung mit Ferienwohnungsnummer 4 inklusive aller abh�ngigen Informationen
**/

DELETE FROM Adresse
WHERE AdressID = (SELECT AdressID FROM Adresse WHERE AdressID IN (SELECT AdressID FROM Ferienwohnung WHERE WohnungsID= 4));
COMMIT;

