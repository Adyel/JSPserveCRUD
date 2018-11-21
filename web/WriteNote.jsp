<%--
  Created by IntelliJ IDEA.
  User: adyel
  Date: 17/11/18
  Time: 02:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <link rel="stylesheet" href="css/materialize.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="js/materialize.js"></script>

    <title>Create a new Note</title>
</head>


<body>


<div class="container">
    <form method="post" action="/routerPath" class="col s12">
        <h3>Create a new note</h3>
        <input id="title" name="title" type="text">
        <label for="title">Title of Note</label>

        <br><br><br><br>

        <div class="input-field col s12">
            <textarea id="textbox" name="textbox" class="materialize-textarea"></textarea>
            <label for="textbox">Textarea</label>
        </div>

        <button class="btn waves-effect waves-light" type="submit" name="Button" value="save">Save
            <i class="material-icons right">save</i>
        </button>
    </form>


</div>


</body>
</html>
