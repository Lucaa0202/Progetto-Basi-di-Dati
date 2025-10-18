package dao;

import Domain.Role;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class ConnectionFactory {
    private static String connectionUrl;
    private static String user;
    private static String pass;

    static {
        try (InputStream input = new FileInputStream("resources/db.properties")) {
            Properties properties = new Properties();
            properties.load(input);

            connectionUrl = properties.getProperty("CONNECTION_URL");
            user = properties.getProperty("LOGIN_USER");
            pass = properties.getProperty("LOGIN_PASS");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private ConnectionFactory() {}

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(connectionUrl, user, pass);
    }

    public static void changeRole(Role role) throws SQLException {
        try (InputStream input = new FileInputStream("resources/db.properties")) {
            Properties properties = new Properties();
            properties.load(input);

            user = properties.getProperty(role.name() + "_USER");
            pass = properties.getProperty(role.name() + "_PASS");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}