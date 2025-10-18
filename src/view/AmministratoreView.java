package view;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.Scanner;

public class AmministratoreView {

    private static final Scanner input = new Scanner(System.in);

    public static int showMenu() throws IOException {
        System.out.println("*********************************");
        System.out.println("*    AMMINISTRATORE DASHBOARD   *");
        System.out.println("*********************************\n");
        System.out.println("1) Effettua un Report ");
        System.out.println("2) Inserisci una Proiezione");
        System.out.println("3) Quit");

        int choice = 0;
        while (true) {
            System.out.print("Please enter your choice: ");
            choice = input.nextInt();
            if (choice >= 1 && choice <= 3) {
                return choice;
            }
            System.out.println("Opzione non valida");
        }
    }

    private static final BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

    public static String readNomeFilm() throws IOException {
        System.out.print("Inserisci il nome del film: ");
        return reader.readLine();
    }

    public static int readNumeroSala() throws IOException {
        System.out.print("Inserisci il numero della sala: ");
        return Integer.parseInt(reader.readLine());
    }

    public static java.sql.Date readData() throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        System.out.print("Inserisci la data (YYYY-MM-DD): ");
        String input = reader.readLine();
        try {
            LocalDate localDate = LocalDate.parse(input);
            return java.sql.Date.valueOf(localDate);
        } catch (DateTimeParseException e) {
            throw new IOException("Formato data non valido. Usa YYYY-MM-DD.");
        }
    }

    public static java.sql.Time readOrario() throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        System.out.print("Inserisci l'orario (HH:MM:SS): ");
        String input = reader.readLine();
        try {
            LocalTime localTime = LocalTime.parse(input);
            return java.sql.Time.valueOf(localTime);
        } catch (DateTimeParseException e) {
            throw new IOException("Formato orario non valido. Usa HH:MM:SS.");
        }
    }
    public static double readCosto() throws IOException {
        System.out.print("Inserisci costo: ");
        String line = reader.readLine();
        try {
            return Double.parseDouble(line);
        } catch (NumberFormatException e) {
            throw new IOException("Costo non valido");
        }
    }
}