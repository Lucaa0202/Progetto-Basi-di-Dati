package dao;

import Exception.DAOException;
import Domain.Film;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VisualizzaListaFilmProcedureDAO {

    public List<Film> execute() throws DAOException {
        List<Film> listaFilm = new ArrayList<>();

        try (Connection conn = ConnectionFactory.getConnection();
             CallableStatement stmt = conn.prepareCall("{CALL visualizzaListaFilm()}")) {

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String nomeFilm = rs.getString("NomeFilm");
                String durata = rs.getString("Durata");
                String casaCinematografica = rs.getString("CasaCinematografica");

                Film film = new Film(nomeFilm, durata, casaCinematografica);
                listaFilm.add(film);
            }

        } catch (SQLException e) {
            throw new DAOException("Errore durante il recupero dei film: " + e.getMessage(), e);
        }

        return listaFilm;
    }
}