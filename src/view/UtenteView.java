package view;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class UtenteView {
    public static int showMenu() throws IOException {
        System.out.println("*********************************");
        System.out.println("*    CINEMA DASHBOARD    *");
        System.out.println("*********************************\n");
        System.out.println("*** Cosa possiamo fare per te? ***\n");
        System.out.println("1) Prenota un posto ");
        System.out.println("2) Annulla Prenotazione");
        System.out.println("3) Visualizza lista film");
        System.out.println("4) Quit");
        Scanner input = new Scanner(System.in);
        int choice = 0;

        while (true) {
            System.out.print("Please enter your choice: ");
            choice = input.nextInt();
            if (choice >= 1 && choice <= 4) {
                return choice;
            }

            System.out.println("Opzione non valida");
        }
    }



    public static String chiediCodicePrenotazione() throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        System.out.print("Inserisci il codice di prenotazione da annullare: ");
        return reader.readLine();
    }

    public static String scegliProiezione(Scanner scanner) {
        System.out.print("Inserisci ID della proiezione: ");
        return scanner.nextLine();
    }

    public static String scegliFila(Scanner scanner) {
        System.out.print("Inserisci fila del posto: ");
        return scanner.nextLine();
    }

    public static int scegliNumeroPosto(Scanner scanner) {
        System.out.print("Inserisci numero del posto: ");
        return Integer.parseInt(scanner.nextLine());
    }

    public static Map<String, String> inserisciDatiCarta(Scanner scanner) {
        Map<String, String> dati = new HashMap<>();

        System.out.print("Numero carta: ");
        dati.put("numero", scanner.nextLine());

        System.out.print("Nome intestatario: ");
        dati.put("nome", scanner.nextLine());

        System.out.print("Cognome intestatario: ");
        dati.put("cognome", scanner.nextLine());

        System.out.print("Data scadenza (YYYY-MM): ");
        dati.put("scadenza", scanner.nextLine());

        System.out.print("CVV: ");
        dati.put("cvv", scanner.nextLine());

        return dati;
    }
}