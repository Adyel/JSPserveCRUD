package io.github.adyel.routes;

import io.github.adyel.util.DatabaseConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "io.github.adyel.routes.Servlet")
public class Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");

        String title = request.getParameter("title");
        String content = request.getParameter("textbox");

        String postJob = request.getParameter("Button");
        String noteID = request.getParameter("note_id");

        File file = new File("database.db");

        if (!file.exists()) {
            DatabaseConnect.createNewDatabase();
        }

        Connection connection;

        try {
            connection = DatabaseConnect.getConnection();
            Statement statement = connection.createStatement();

            if (postJob.equals("save")) {
                statement.execute("INSERT INTO notes (title, body) VALUES  (\"" + title + "\"," + "\"" + content + "\")");
            } else if (postJob.equals("update")) {
                statement.execute("UPDATE notes SET title = \"" + title + "\", body = " + "\"" + content + "\" WHERE note_id = " + noteID);
            } else if (postJob.equals("delete")) {
                statement.execute("DELETE FROM notes WHERE note_id = " + noteID);
            }


            response.sendRedirect("index.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("Text/html");

        String operation = request.getParameter("operation");

        if (operation.equals("edit")) {

        } else if (operation.equals("delete")) {

        }

    }
}
