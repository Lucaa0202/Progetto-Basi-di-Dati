package Domain;

public class Film {
    private String nomeFilm;
    private String durata;
    private String casaCinematografica;

    public Film(String nomeFilm, String durata, String casaCinematografica) {
        this.nomeFilm = nomeFilm;
        this.durata = durata;
        this.casaCinematografica = casaCinematografica;
    }

    public String getNomeFilm() {
        return nomeFilm;
    }

    public String getDurata() {
        return durata;
    }

    public String getCasaCinematografica() {
        return casaCinematografica;
    }

    @Override
    public String toString() {
        return "Film{" +
                "Nome='" + nomeFilm + '\'' +
                ", Durata='" + durata + '\'' +
                ", CasaCinematografica='" + casaCinematografica + '\'' +
                '}';
    }
}