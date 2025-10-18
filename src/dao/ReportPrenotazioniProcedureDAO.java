package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReportPrenotazioniProcedureDAO {

    public void ReportPrenotazioni() throws SQLException {
        String sql = "{ CALL report_prenotazioni() }";

        try (Connection connection = ConnectionFactory.getConnection();
             CallableStatement stmt = connection.prepareCall(sql)) {

            ResultSet rs = stmt.executeQuery();

            System.out.println("\n=== Report Prenotazioni per Sala ===");
            while (rs.next()) {
                int numeroSala = rs.getInt("Numerosala");
                int confermate = rs.getInt("prenotazioni_confermate");
                int annullate = rs.getInt("prenotazioni_annullate");

                System.out.println("Numero Sala: " + numeroSala);
                System.out.println("Prenotazioni Confermate: " + confermate);
                System.out.println("Prenotazioni Annullate: " + annullate);
                System.out.println("------------------------------");
            }
        }
    }
}