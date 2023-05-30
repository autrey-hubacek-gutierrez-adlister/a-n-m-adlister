<%--
  Created by IntelliJ IDEA.
  User: nicholashubacek
  Date: 5/30/23
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Account</title>
</head>
<body>
<h1>Delete Account</h1>
<form action="DeleteUserServlets" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br><br>
    <input type="submit" value="Delete Account">
</form>
</body>
</html>
