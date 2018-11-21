package io.github.adyel.util;

import java.sql.*;

public class DatabaseConnect {
    public static final String sqliteConneciton = "jdbc:sqlite:database.db";
    public static Connection connection = null;

    public static Connection getConnection() throws SQLException {

        if (connection == null) {
            try {
                Class.forName("org.sqlite.JDBC");
                connection = DriverManager.getConnection(sqliteConneciton);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }

        return connection;
    }


    public static void createNewDatabase() {

        String createTable = "CREATE TABLE `notes` (" +
                "   `note_id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT," +
                "   `title` TEXT NOT NULL," +
                "   `body` BLOB );";

        try {
            Connection connection = getConnection();
            DatabaseMetaData metaData = connection.getMetaData();

            Statement statement = connection.createStatement();
            statement.execute(createTable);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
