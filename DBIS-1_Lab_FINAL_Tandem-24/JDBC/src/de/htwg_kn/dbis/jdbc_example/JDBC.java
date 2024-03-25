package de.htwg_kn.dbis.jdbc_example;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

public class JDBC {
    //reference to the JDBC connection for the used DBS instance
    private static Connection theConnection = null;


    /*
     * Application's main method:
     * - connect to DBS instance
     * - start main loop: show application's top menu
     * - disconnect from DBS instance
     */
    public static void main(String[] args) throws SQLException {

        System.out.println();
        System.out.println(">>> Starting DBIS JDBC sample program ... <<<<<<<<<<<<");
        System.out.println();


        //enable debug output
        DBISUtils.setDebugFlag(true);


        //connect to DBS instance
        try {

            theConnection = DBISUtils.getConnection();

        } catch (SQLException se) {

            System.out.println();
            System.out.println("An error occurred while establishing connection to DBS:");

            DBISUtils.decodeAndPrintAllSQLExceptions(se);

            System.out.println();
            System.out.println("### Exiting DBIS JDBC sample program with failure! ###");
            System.out.println();

            System.exit(-1);

        }


        //invoke main loop: show application's top menu
        System.out.println();
        showTopMenu();


        //disconnect from DBS instance
        System.out.println();
        System.out.println("Closing connection to DBS instance ...");

        try {

            if ((theConnection != null) && (!theConnection.isClosed())) {
                theConnection.close();
            }

        } catch (SQLException se) {

            System.out.println();
            System.out.println("An error occurred while closing the connection to DBS instance:");

            DBISUtils.decodeAndPrintAllSQLExceptions(se);

            System.out.println();
            System.out.println("### Exiting DBIS JDBC sample program with failure! ###");
            System.out.println();

            System.exit(-1);

        }

        System.out.println("... connection to DBS instance closed!");
        System.out.println();

        System.out.println(">>> Exiting DBIS JDBC sample program with success! <<<");
        System.out.println();

        System.exit(0);

    }


    /*
     * main loop: show command-line application's top menu
     */
    private static void showTopMenu() throws SQLException {

        while (true) {

            System.out.println();
            System.out.println("Welche Operation wollen Sie durchführen ?");
            System.out.println("-----------------------------------------");
            System.out.println("1) Kunde hinzufügen");
            System.out.println("2) Kunde suchen");
            System.out.println("3) Reservieren oder Buchen einer Ferienwohnung");
            System.out.println("4) Loeschen einer Reservierung bzw. Buchung");
            System.out.println("5) Programm Beenden");

            int theChoice = DBISUtils.readIntFromStdIn("Option");

            System.out.println();

            switch (theChoice) {
                case 1 -> insertClient();
                case 2 -> searchClient();
                case 3 -> makeBooking();
                case 4 -> deleteBooking();
                case 5 -> {
                    System.out.println();
                    System.out.println();
                    System.out.println("Programm beenden ...");
                    return;
                }
                default -> System.out.println(theChoice + " ist keine gueltige Option!");
            }
            System.out.println();
            System.out.println();
        }
    }

    private static void insertClient() throws SQLException {
        System.out.println("Kunde hinzufuegen");
        System.out.println("-----------------------------------------");
        try {
            Statement stmt = theConnection.createStatement();
            System.out.println("Daten des Kunden:");
            String newName = DBISUtils.readFromStdIn("Nachname");
            String newVorname = DBISUtils.readFromStdIn("Vorname");
            String gebDatum = DBISUtils.readDateFromStdIn("Geburtsdatum (Format DD.MM.YYYY)");

            while (true) {
                LocalDate date = LocalDate.now();
                LocalDate newDate = LocalDate.of(Integer.parseInt(gebDatum.substring(6)), Integer.parseInt(gebDatum.substring(3, 5)), Integer.parseInt(gebDatum.substring(0, 2)));
                if (newDate.isAfter(date)) {
                    System.out.println("Datum muss vor dem aktuellen Datum liegen");
                    gebDatum = DBISUtils.readDateFromStdIn("Geburtsdatum (Format DD.MM.YYYY)");
                } else {
                    break;
                }

            }
            String email = DBISUtils.readFromStdIn("EMAIL_ADRESSE");
            String telefonnummer = DBISUtils.readFromStdIn("TELEFONNUMMER");
            String iBAN;

            while (true){
                iBAN = DBISUtils.readFromStdIn("IBAN");
                if (iBAN.length() != 22){
                    System.out.println("eingabe nicht gültig (genau 22 Ziffern benötigt)");
                } else {
                    break;
                }
            }
            String bic;
            while (true){
                bic = DBISUtils.readFromStdIn("BIC");
                if (bic.length() != 11){
                    System.out.println("eingabe nicht gültig (genau 11 Ziffern benötigt)");
                }else {
                    break;
                }
            }
            String blz;
            while (true){
                blz = DBISUtils.readFromStdIn("BLZ");
                if (blz.length() != 8){
                    System.out.println("eingabe nicht gültig (genau 8 Ziffern benötigt)");
                }else {
                    break;
                }
            }
            int kontonummer;
            while (true){
                kontonummer = DBISUtils.readIntFromStdIn("KONTONUMMER");
                if(kontonummer > 999999 && kontonummer < 10000000){
                    break;
                }else {
                    System.out.println("eingabe nicht gültig (genau 7 Ziffern benötigt)");
                }
            }
            String plz = DBISUtils.readFromStdIn("PLZ");
            String hausnummer = DBISUtils.readFromStdIn("Hausnummer");
            String strasse = DBISUtils.readFromStdIn("Strasse");

            String getAdressRset = "SELECT Count(AdressID) as id From ADRESSE";
            ResultSet getAdressID = stmt.executeQuery(getAdressRset);
            getAdressID.next();
            int adressID = getAdressID.getInt(1) + 1;

            String getKundennummerRset = "SELECT Count(Kundennummer) From Kunde";
            ResultSet getKundennummer = stmt.executeQuery(getKundennummerRset);
            getKundennummer.next();
            int kundennummer = getKundennummer.getInt(1) + 1;
            int ort = 0;
            while (true) {
                String getOrte = "SELECT OrtID, Name as Ort_name From Ort";
                DBISUtils.printResultSet((stmt.executeQuery(getOrte)));
                ort = DBISUtils.readIntFromStdIn("OrtID");
                String getOrteRset = "SELECT max(OrtID) as id From ORT";
                ResultSet getOrte2 = stmt.executeQuery(getOrteRset);
                getOrte2.next();
                int ortNr = getOrte2.getInt(1);
                if (ortNr < ort || ort < 0) {
                    System.out.println("Eingabe nicht vorhanden");
                } else {
                    break;
                }
            }

            String adresseHinzufuegen = "INSERT INTO Adresse (AdressID, Strasse, Hausnummer, PLZ, OrtID) VALUES ('" + adressID + "','" + strasse + "','" + hausnummer + "','" + plz + "'," + ort + ")";
            String bankverbindungHinzufuegen = "INSERT INTO Bankverbindung (IBAN, BIC, BLZ, Kontonummer) VALUES ('" + iBAN + "','" + bic + "','" + blz + "'," + kontonummer + ")";
            String kundenHinzufuegen = "INSERT INTO Kunde (Kundennummer, Name, Vorname, Telefonnummer, Email_Adresse, Geburtsdatum, AdressID, IBAN) VALUES (" + kundennummer + ",'" + newName + "','" + newVorname + "','" + telefonnummer + "','" + email + "','" + gebDatum + "'," + adressID + ",'" + iBAN + "')";

            stmt.executeUpdate(adresseHinzufuegen);
            stmt.executeUpdate(bankverbindungHinzufuegen);
            int affectedRows = stmt.executeUpdate(kundenHinzufuegen);

            if (affectedRows == 1) {
                System.out.println("Der Kunde mit Name " + newName + " wurde hinzugefuegt.");
            } else {
                System.out.println("Der Kunde mit Name " + newName + " konnte nicht hinzugefuegt werden.");
            }

            theConnection.commit();
            DBISUtils.printlnDebugInfo("Transaction committed!");

            getAdressID.close();
            getKundennummer.close();
            stmt.close();

        } catch (SQLException exception) {
            DBISUtils.decodeAndPrintAllSQLExceptions(exception);
            System.out.println("fehler :)");
            theConnection.rollback();
        }
    }

    private static void searchClient() {
        System.out.println("Kunde suchen:");
        System.out.println("-----------------------------------------");
        try {
            Statement stmt = theConnection.createStatement();
            String eingabe = DBISUtils.readFromStdIn("Name eingaben");
            assert eingabe != null;
            eingabe = eingabe.toLowerCase();
            String eingabe2 = eingabe.substring(0, 1);
            eingabe2 = eingabe2.toUpperCase();
            eingabe2 = eingabe2 + eingabe.substring(1);

            String getKunden = "SELECT * From Kunde Where Kunde.Name Like '%" + eingabe + "%' or Vorname Like '%" + eingabe + "%' or Name Like '%" + eingabe2 + "%' or Vorname Like '%" + eingabe2 + "%'";
            DBISUtils.printResultSet((stmt.executeQuery(getKunden)));

            stmt.close();
            theConnection.commit();
        } catch (SQLException exception) {
            DBISUtils.decodeAndPrintAllSQLExceptions(exception);
        }


    }

    private static void makeBooking() {

        try {
            Statement stmt = theConnection.createStatement();
            boolean var1 = false;

            while (true) {
                String getKunden = "SELECT * From Kunde";
                DBISUtils.printResultSet(stmt.executeQuery(getKunden));
                int kundennummer = DBISUtils.readIntFromStdIn("Kundennummer");
                String getFerienwohnung = "SELECT max(Kundennummer) as id From Kunde";
                ResultSet getkunden = stmt.executeQuery(getFerienwohnung);
                getkunden.next();
                int kundenNr = getkunden.getInt(1);
                if (kundenNr >= kundennummer && kundennummer >= 0) {
                    boolean var24 = false;

                    while (true) {
                        getFerienwohnung = "SELECT * From FERIENWOHNUNG";
                        DBISUtils.printResultSet(stmt.executeQuery(getFerienwohnung));
                        int ferienwohnungnr = DBISUtils.readIntFromStdIn("WohnungsID");
                        String von = "SELECT max(WohnungsID) as id From FERIENWOHNUNG";
                        ResultSet getferienwohnung = stmt.executeQuery(von);
                        getferienwohnung.next();
                        int ferienwohnungNr = getferienwohnung.getInt(1);
                        if (ferienwohnungNr >= ferienwohnungnr && ferienwohnungnr >= 0) {
                            boolean count = false;

                            while (true) {
                                label131:
                                while (!count) {
                                    von = DBISUtils.readDateFromStdIn("Von (Format DD.MM.YYYY)");
                                    String bis = DBISUtils.readDateFromStdIn("Bis (Format DD.MM.YYYY)");
                                    int count1 = 0;
                                    LocalDate newDateBis = LocalDate.of(Integer.parseInt(bis.substring(6)), Integer.parseInt(bis.substring(3, 5)), Integer.parseInt(bis.substring(0, 2)));
                                    LocalDate newDateVon = LocalDate.of(Integer.parseInt(von.substring(6)), Integer.parseInt(von.substring(3, 5)), Integer.parseInt(von.substring(0, 2)));

                                    while (count1 < 1) {
                                        if (newDateVon.isAfter(newDateBis)) {
                                            System.out.println("Von muss vor bis liegen");
                                            von = DBISUtils.readDateFromStdIn("Von (Format DD.MM.YYYY)");
                                            bis = DBISUtils.readDateFromStdIn("Bis (Format DD.MM.YYYY)");
                                            newDateBis = LocalDate.of(Integer.parseInt(bis.substring(6)), Integer.parseInt(bis.substring(3, 5)), Integer.parseInt(bis.substring(0, 2)));
                                            newDateVon = LocalDate.of(Integer.parseInt(von.substring(6)), Integer.parseInt(von.substring(3, 5)), Integer.parseInt(von.substring(0, 2)));
                                        } else {
                                            count1 = 1;
                                        }
                                    }

                                    String getDatum = "Select von, bis from Belegung Where WohnungsID = " + ferienwohnungnr;
                                    ResultSet Daten = stmt.executeQuery(getDatum);
                                    boolean vergebenOderNicht = true;

                                    label102:
                                    {
                                        LocalDate gebuchtesDatumVon;
                                        LocalDate gebuchtesDatumbis;
                                        do {
                                            do {
                                                if (!Daten.next()) {
                                                    break label102;
                                                }

                                                String datumVon = Daten.getNString(1);
                                                String datumBis = Daten.getNString(2);
                                                gebuchtesDatumVon = LocalDate.of(Integer.parseInt(datumVon.substring(0, 4)), Integer.parseInt(datumVon.substring(5, 7)), Integer.parseInt(datumVon.substring(8, 10)));
                                                gebuchtesDatumbis = LocalDate.of(Integer.parseInt(datumBis.substring(0, 4)), Integer.parseInt(datumBis.substring(5, 7)), Integer.parseInt(datumBis.substring(8, 10)));
                                            } while (newDateVon.isBefore(gebuchtesDatumVon) && newDateBis.isBefore(gebuchtesDatumVon));
                                        } while (newDateBis.isAfter(gebuchtesDatumbis) && newDateVon.isAfter(gebuchtesDatumbis));

                                        System.out.println("Buchungszeitraum ist vergeben");
                                        System.out.println();
                                        vergebenOderNicht = false;
                                    }

                                    byte count2 = 0;

                                    while (true) {
                                        while (true) {
                                            if (count2 >= 1) {
                                                continue label131;
                                            }

                                            int eingabe;
                                            if (!vergebenOderNicht) {
                                                System.out.println("1) Eingabe Wiederholen");
                                                System.out.println("2) Buchung Abbrechen");
                                                eingabe = DBISUtils.readIntFromStdIn("Option");
                                                if (eingabe != 2 && eingabe != 1) {
                                                    System.out.println("falsche eingabe");
                                                }

                                                if (eingabe == 2) {
                                                    count = true;
                                                    continue label131;
                                                }

                                                if (eingabe == 1) {
                                                    continue label131;
                                                }
                                            } else {
                                                System.out.println("Buchungszeitraum ist verfuegbar");
                                                count = true;
                                                System.out.println();
                                                System.out.println("1) Eingabe Reservieren");
                                                System.out.println("2) Eingabe Buchen");
                                                System.out.println("3) Abbrechen");
                                                eingabe = DBISUtils.readIntFromStdIn("Option");
                                                if (eingabe != 2 && eingabe != 1 && eingabe != 3) {
                                                    System.out.println("Falsche eingabe");
                                                }

                                                if (eingabe == 3) {
                                                    continue label131;
                                                }

                                                if (eingabe == 1 || eingabe == 2) {
                                                    String getBuchunsnummer = "SELECT max(Belegungsnummer) as id From BELEGUNG";
                                                    ResultSet getBuchungsnr = stmt.executeQuery(getBuchunsnummer);
                                                    getBuchungsnr.next();
                                                    int Buchungsnr = getBuchungsnr.getInt(1) + 1;
                                                    count2 = 1;
                                                    LocalDate nowDate = LocalDate.now();
                                                    String now = nowDate.toString();
                                                    String[] now2 = now.split("-");
                                                    now = "";

                                                    for (int i = now2.length - 1; i >= 0; --i) {
                                                        now = now + "." + now2[i];
                                                    }

                                                    now = now.substring(1);
                                                    int affectedRows;
                                                    String setReservierung;
                                                    if (eingabe == 1) {
                                                        setReservierung = "INSERT INTO Belegung (Belegungsnummer, Status, Von, Bis, Datum, Kundennummer, WohnungsID) VALUES (" + Buchungsnr + ",'Reserviert','" + von + "','" + bis + "','" + now + "'," + kundennummer + "," + ferienwohnungnr + ")";
                                                        affectedRows = stmt.executeUpdate(setReservierung);
                                                        if (affectedRows == 1) {
                                                            System.out.println("Die Reservierung wurde hinzugefuegt");
                                                        } else {
                                                            System.out.println("Die Reservierung konnte nicht hinzugefuegt werden");
                                                        }

                                                        theConnection.commit();
                                                    }

                                                    if (eingabe == 2) {
                                                        setReservierung = "INSERT INTO Belegung (Belegungsnummer, Status, Von, Bis, Datum, Kundennummer, WohnungsID) VALUES (" + Buchungsnr + ",'Gebucht','" + von + "','" + bis + "','" + now + "'," + kundennummer + "," + ferienwohnungnr + ")";
                                                        affectedRows = stmt.executeUpdate(setReservierung);
                                                        if (affectedRows == 1) {
                                                            System.out.println("Die Buchung wurde hinzugefuegt");
                                                        } else {
                                                            System.out.println("Die Buchung konnte nicht hinzugefuegt werden");
                                                        }

                                                        theConnection.commit();
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }

                                return;
                            }
                        }

                        System.out.println("Eingabe nicht vorhanden");
                    }
                }

                System.out.println("Eingabe nicht vorhanden");
            }
        } catch (SQLException var22) {
            DBISUtils.decodeAndPrintAllSQLExceptions(var22);
        }
    }

    private static void deleteBooking() throws SQLException {
        try {
        Statement stmt = theConnection.createStatement();
        int belegungsnr = 0;
        while (true) {
            String getBelegung = "SELECT * From Belegung";
            DBISUtils.printResultSet(stmt.executeQuery(getBelegung));
            belegungsnr = DBISUtils.readIntFromStdIn("Belegungsnummer");
            String getBelegungsRset = "SELECT Max(Belegungsnummer) as id From Belegung";
            ResultSet getBelegungnr = stmt.executeQuery(getBelegungsRset);
            getBelegungnr.next();
            int belegungsNrIst = getBelegungnr.getInt(1);
            if (belegungsNrIst < belegungsnr || belegungsnr < 0) {
                System.out.println("Eingabe nicht vorhanden");
            } else {
                break;
            }
        }
        String deleteBuchung = "Delete From Belegung Where Belegungsnummer = "+ belegungsnr;
        int affectedRows = stmt.executeUpdate(deleteBuchung);

        if (affectedRows == 1) {
            System.out.println("Die Belegung wurde gelöscht");
        } else {
            System.out.println("Die Belegung konnte nicht gelöscht werden");
        }

        theConnection.commit();
        stmt.close();
        } catch (SQLException var5) {
            DBISUtils.decodeAndPrintAllSQLExceptions(var5);
        }
    }
}

