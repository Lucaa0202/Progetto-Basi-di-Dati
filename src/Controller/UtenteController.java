package Controller;
import Exception.DAOException;
import dao.ConfermaPrenotazioneDAO;
import dao.ConnectionFactory;
import Domain.Role;
import dao.PrenotaPostoInAttesaDAO;
import Domain.Film;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import dao.AnnullaPrenotazioneProcedureDAO;
import view.UtenteView;


public class UtenteController implements Controller {

    @Override
    public void start() {
        try {
            ConnectionFactory.changeRole(Role.UTENTE);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        while (true) {
            int choice;
            try {
                choice = UtenteView.showMenu();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

            switch (choice) {
                case 1 -> PrenotazioneInDueFasi();
                case 2 -> annullaPrenotazione();
                case 3 -> visualizzaListaFilm();
                case 4 -> System.exit(0);
                default -> throw new RuntimeException("Invalid choice");
            }
        }
    }

    public void PrenotazioneInDueFasi() {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Inserisci ID utente: ");
        String idUtente = scanner.nextLine();


        String idProiezione = UtenteView.scegliProiezione(scanner);


        String filaPosto = UtenteView.scegliFila(scanner);
        int numeroPosto = UtenteView.scegliNumeroPosto(scanner);


        try {
            new PrenotaPostoInAttesaDAO().execute(filaPosto, numeroPosto, idProiezione, idUtente);
        } catch (DAOException e) {
            System.out.println("Errore durante la prenotazione: " + e.getMessage());
            return;
        }

        Map<String, String> datiCarta = UtenteView.inserisciDatiCarta(scanner);


        try {
            String codicePrenotazione = new ConfermaPrenotazioneDAO().execute(
                    filaPosto,
                    numeroPosto,
                    idProiezione,
                    idUtente,
                    datiCarta.get("numero"),
                    datiCarta.get("nome"),
                    datiCarta.get("cognome"),
                    datiCarta.get("scadenza"),
                    Integer.parseInt(datiCarta.get("cvv"))
            );
            System.out.println("Prenotazione confermata! Codice: " + codicePrenotazione);
        } catch (DAOException e) {
            System.out.println("Errore durante la conferma: " + e.getMessage());
        }
    }

    public void annullaPrenotazione() {
        try {
            String codicePrenotazione = UtenteView.chiediCodicePrenotazione();

            new AnnullaPrenotazioneProcedureDAO()
                    .execute(codicePrenotazione);

            System.out.println("Prenotazione annullata con successo.");

        } catch (IOException e) {
            System.err.println("Errore input: " + e.getMessage());
        } catch (DAOException e) {
            System.err.println("Errore DAO: " + e.getMessage());
        }
    }

    public void visualizzaListaFilm() {
        try {
            List<Film> listaFilm = new dao.VisualizzaListaFilmProcedureDAO().execute();

            System.out.println("*********************************");
            System.out.println("*         LISTA FILM            *");
            System.out.println("*********************************");

            for (Film film : listaFilm) {
                System.out.println(film);
            }

        } catch (DAOException e) {
            System.err.println("Errore durante la visualizzazione dei film: " + e.getMessage());
        }
    }
}


