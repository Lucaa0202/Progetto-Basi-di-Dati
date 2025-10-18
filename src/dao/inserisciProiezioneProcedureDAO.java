package dao;

import Exception.DAOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

public class inserisciProiezioneProcedureDAO {

    public void execute(String nomeFilm, int numeroSala, java.sql.Date data, java.sql.Time orario, double costo) throws DAOException {
        String sql = "{CALL inserisci_proiezione(?, ?, ?, ?, ?)}";

        try (Connection conn = ConnectionFactory.getConnection();
             CallableStatement stmt = conn.prepareCall(sql)) {

            stmt.setString(1, nomeFilm);
            stmt.setInt(2, numeroSala);
            stmt.setDate(3, data);
            stmt.setTime(4, orario);
            stmt.setDouble(5, costo);

            stmt.execute();

        } catch (SQLException e) {
            throw new DAOException("Errore durante l'inserimento proiezione: " + e.getMessage());
        }
    }
}