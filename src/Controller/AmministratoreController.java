package Controller;
import Domain.Role;
import dao.ConnectionFactory;
import dao.ProiezioneStampaDAO;
import dao.inserisciProiezioneProcedureDAO;
import dao.ReportPrenotazioniProcedureDAO;
import Exception.DAOException;
import view.AmministratoreView;
import java.io.IOException;
import java.sql.SQLException;

public class AmministratoreController implements Controller {

    @Override
    public void start() {

        try {
            ConnectionFactory.changeRole(Role.AMMINISTRATORE);
        } catch (SQLException e) {
            System.err.println("Errore nel cambio ruolo: " + e.getMessage());
            return;
        }

        while (true) {
            int choice;
            try {
                choice = AmministratoreView.showMenu();
            } catch (IOException e) {
                System.err.println("Errore input: " + e.getMessage());
                continue;
            }

            switch (choice) {
                case 1 -> ReportPrenotazioni();
                case 2 -> inserisciProiezione();
                case 3 -> System.exit(0);

                default -> System.out.println("Scelta non valida!");
            }
        }
    }

    public void ReportPrenotazioni() {
        ReportPrenotazioniProcedureDAO dao = new ReportPrenotazioniProcedureDAO();
        try {
            dao.ReportPrenotazioni();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void inserisciProiezione() {
        String nomeFilm;
        int numeroSala;
        java.sql.Date data;
        java.sql.Time orario;
        double costo;

        try {
            nomeFilm = AmministratoreView.readNomeFilm();
            numeroSala = AmministratoreView.readNumeroSala();
            data = AmministratoreView.readData();
            orario = AmministratoreView.readOrario();
            costo = AmministratoreView.readCosto();
        } catch (IOException e) {
            System.err.println("Errore nell'input: " + e.getMessage());
            return;
        }

        try {
            new inserisciProiezioneProcedureDAO().execute(nomeFilm, numeroSala, data, orario, costo);
            System.out.println("Proiezione inserita correttamente!");


            new ProiezioneStampaDAO().stampaProiezioni();

        } catch (DAOException e) {
            System.err.println("Errore durante l'inserimento della proiezione: " + e.getMessage());
        }
    }
}