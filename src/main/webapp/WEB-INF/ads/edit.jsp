<%--
  Created by IntelliJ IDEA.
  User: asiaautrey
  Date: 5/30/23
  Time: 3:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>edit page</title>
</head>
<body>
<div class="container">
    <form action="/delete" method="post">
        <div class="form-group">
            <input name="adId" value="${ad.id}" class="form-control" type="hidden">
            <button type="submit">Delete</button>
        </div>
    </form>
    <form action="/edit" method="post">
        <div class="form-group">
            <input type="hidden" name="editAdId" value="${ad.userId}">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text" value="${ad.title}">
            <label for="description">Description</label>
            <input id="description" name="description" class="form-control" value="${ad.description}" type="text">
            <button type="submit" class="btn btn-block btn-primary">Submit</button>
        </div>
    </form>
</div>

</body>
</html>
