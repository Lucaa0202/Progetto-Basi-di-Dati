package dao;
import dao.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Exception.DAOException;

public class ProiezioneStampaDAO {

    public void stampaProiezioni() throws DAOException {
        String query = "SELECT Id_Proiezione, NomeFilm, NumeroSala, Data, Orario, Costo FROM proiezione";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            System.out.println("\n--- Elenco Proiezioni ---");
            while (rs.next()) {
                int id = rs.getInt("Id_Proiezione");
                String nomeFilm = rs.getString("NomeFilm");
                int numeroSala = rs.getInt("NumeroSala");
                java.sql.Date data = rs.getDate("Data");
                java.sql.Time orario = rs.getTime("Orario");
                double costo = rs.getDouble("Costo");

                System.out.printf("ID: %d | Film: %s | Sala: %d | Data: %s | Orario: %s | Costo: %.2f €%n",
                        id, nomeFilm, numeroSala, data.toString(), orario.toString(), costo);
            }

        } catch (SQLException e) {
            throw new DAOException("Errore durante la lettura delle proiezioni: " + e.getMessage());
        }
    }
}