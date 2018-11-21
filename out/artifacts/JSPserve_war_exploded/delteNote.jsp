<%@ page import="io.github.adyel.util.DatabaseConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: adyel
  Date: 11/21/18
  Time: 11:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/materialize.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="js/materialize.js"></script>
    <title>Confirm Delete</title>
</head>
<body>
<%
    String noteID = request.getParameter("note_id");

    String title = null;
    String text = null;

    try {
        Connection connection = DatabaseConnect.getConnection();
        ResultSet resultSet = connection.createStatement().executeQuery("SELECT * FROM notes WHERE note_id = " + noteID);

        title = resultSet.getString("title");
        text = resultSet.getString("body");

    } catch (SQLException e) {
        e.printStackTrace();
    }

%>


<div class="container">
    <form method="post" action="/routerPath" class="col s12">
        <h3>Edit note</h3>

        <input name="note_id" hidden value="<%=noteID%>">

        <input id="title" name="title" type="text" readonly value="<%=title%>">
        <label for="title">Title of Note</label>

        <br><br><br><br>

        <div class="input-field col s12">
            <textarea id="textbox" name="textbox" class="materialize-textarea" readonly><%=text%></textarea>
            <label for="textbox">Textarea</label>
        </div>

        <button class="btn-large red waves-effect waves-light" type="submit" name="Button" value="delete">delete
            <i class="material-icons right"></i>
        </button>
    </form>
</div>

</body>
</html>
