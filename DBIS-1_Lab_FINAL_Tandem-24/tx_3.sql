/* SQL DML Statements Aufgabe 2.3 -- Löschen von Daten --
Löschen der Ferienwohnung mit Ferienwohnungsnummer 4 inklusive aller abhängigen Informationen
**/

DELETE FROM Adresse
WHERE AdressID = (SELECT AdressID FROM Adresse WHERE AdressID IN (SELECT AdressID FROM Ferienwohnung WHERE WohnungsID= 4));
COMMIT;

