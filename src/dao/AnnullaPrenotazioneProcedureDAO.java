package dao;
import Exception.DAOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

public class AnnullaPrenotazioneProcedureDAO {

    public void execute(String codicePrenotazione) throws DAOException {
        String sql = "{ CALL annulla_prenotazione(?) }";

        try (
                Connection conn = ConnectionFactory.getConnection();
                CallableStatement stmt = conn.prepareCall(sql)
        ) {
            stmt.setString(1, codicePrenotazione);

            stmt.execute();

        } catch (SQLException e) {
            throw new DAOException("Errore durante l'annullamento: " + e.getMessage(), e);
        }
    }
}