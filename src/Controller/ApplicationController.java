package Controller;

import Domain.Credentials;

public class ApplicationController implements Controller {

    Credentials cred;

    public void start() {
        LoginController loginController = new LoginController();
        loginController.start();
        this.cred = loginController.getCred();
        if (this.cred.getRole() == null) {
            throw new RuntimeException("Credenziali non valide");
        } else {
            switch (this.cred.getRole()) {
                case AMMINISTRATORE -> (new AmministratoreController()).start();
                case UTENTE -> (new UtenteController()).start();
                default -> throw new RuntimeException("Credenziali non valide");
            }

        }
    }
}
