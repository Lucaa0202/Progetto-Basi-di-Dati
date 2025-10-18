package dao;

import Exception.DAOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

public class ConfermaPrenotazioneDAO {

    public String execute(
            String filaPosto,
            int numeroPosto,
            String idProiezione,
            String idUtente,
            String numeroCarta,
            String nome,
            String cognome,
            String dataScadenza,
            int cvv
    ) throws DAOException {
        String sql = "{ CALL confermaPrenotazione(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }";
        String codicePrenotazione = null;

        try (Connection conn = ConnectionFactory.getConnection();
             CallableStatement stmt = conn.prepareCall(sql)) {

            stmt.setString(1, filaPosto);
            stmt.setInt(2, numeroPosto);
            stmt.setString(3, idProiezione);
            stmt.setString(4, idUtente);
            stmt.setString(5, numeroCarta);
            stmt.setString(6, nome);
            stmt.setString(7, cognome);
            stmt.setString(8, dataScadenza);
            stmt.setInt(9, cvv);

            stmt.registerOutParameter(10, Types.VARCHAR);

            stmt.execute();

            codicePrenotazione = stmt.getString(10);

        } catch (SQLException e) {
            throw new DAOException("Errore confermaPrenotazione: " + e.getMessage(), e);
        }

        return codicePrenotazione;
    }
}