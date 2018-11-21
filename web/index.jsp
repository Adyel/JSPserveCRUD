<%@ page import="io.github.adyel.model.Notes" %>
<%@ page import="io.github.adyel.util.DatabaseConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>

    <link rel="stylesheet" href="css/materialize.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <title>HTML FORM</title>
</head>

<body>


<%
    ArrayList<Notes> listNotes = new ArrayList<>();


    try {
        Connection connection = DatabaseConnect.getConnection();
        ResultSet resultSet = connection.createStatement().executeQuery("SELECT * FROM notes");

        while (resultSet.next()) {
            try {
                listNotes.add(new Notes(resultSet.getInt("note_id"), resultSet.getString("title"), resultSet.getString("body")));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    pageContext.setAttribute("Notes", listNotes);
%>


<div class="container">
    <div class="col s12 m6">
        <c:forEach items="${Notes}" var="note">
            <div class="card hoverable blue-grey">
                <div class="card-content white-text">
                    <span class="card-title"> ${note.title} </span>
                    <p> ${note.text} </p>
                </div>

                <div class="card-action">
                    <a href="delteNote.jsp?note_id=${note.id}"
                       class="waves-effect waves-light btn-small cyan teal-text"><i
                            class="material-icons">delete</i></a>
                    <a href="updateNote.jsp?note_id=${note.id}"
                       class="waves-effect waves-light btn-small yellow orange-text"><i class="material-icons">edit</i></a>
                        <%--<a href = "#" > Edit</a >--%>
                        <%--<a href = "#" > Delete</a >--%>
                </div>
            </div>
        </c:forEach>
    </div>

    <form action="WriteNote.jsp">
        <button name="add" class="btn-floating btn-large waves-effect waves-light red hoverable"><i
                class="material-icons">add</i></button>
    </form>
</div>

</body>
</html>
