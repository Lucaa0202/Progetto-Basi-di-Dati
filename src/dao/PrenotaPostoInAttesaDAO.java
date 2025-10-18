package dao;

import Exception.DAOException;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

public class PrenotaPostoInAttesaDAO {

    public void execute(String filaPosto, int numeroPosto, String idProiezione, String idUtente) throws DAOException {
        String sql = "{ CALL prenotaPostoInAttesa(?, ?, ?, ?) }";

        try (Connection conn = ConnectionFactory.getConnection();
             CallableStatement stmt = conn.prepareCall(sql)) {

            stmt.setString(1, filaPosto);
            stmt.setInt(2, numeroPosto);
            stmt.setString(3, idProiezione);
            stmt.setString(4, idUtente);

            stmt.execute();

        } catch (SQLException e) {
            throw new DAOException("Errore durante la prenotazione in attesa: " + e.getMessage(), e);
        }
    }
}