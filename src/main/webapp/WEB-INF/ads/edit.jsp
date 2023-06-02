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
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <title>Edit Ad</title>
    <link href="../../css/edit.css" rel="stylesheet" type="text/css">

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<%--<form action="/delete" method="post">&ndash;%&gt;--%>
<%--            <div class="form-group">--%>
<%--                <input name="adId" value="${ad.id}" class="form-control" type="hidden">--%>
<%--                <button type="submit">Delete</button>--%>
<%--            </div>--%>
<%--        </form>--%>
<button class="action-header">Edit Ad</button>
<form action="/edit" method="post" class="register-form">
    <input type="hidden" name="editAdId" value="${ad.userId}">
    <div class="form-group rounded">
        <label for="title">Title</label>
        <input id="title" name="title" class="form-control" type="text" value="${ad.title}">
    </div>
<%--    <div class="form-group rounded">--%>
<%--        <label for="category">Category</label>--%>
<%--        <input id="category" name="category" class="form-control" type="category"value="${ad.category}">--%>
<%--    </div>--%>
    <div class="form-group rounded">
        <label for="description">Description</label>
        <textarea id="description" name="description" rows="5" cols="33" class="form-control" value="${ad.description}"></textarea>
    </div>
<%--    <div class="input-group mb-3">--%>
<%--        <label class="input-group-text" for="inputGroupFile01">Upload</label>--%>
<%--        <input type="file" class="form-control" id="inputGroupFile01">--%>
<%--    </div>--%>
    <input type="submit" class="submit-button">
</form>




<%--<div class="container">--%>
<%--    <form action="/delete" method="post">--%>
<%--        <div class="form-group">--%>
<%--            <input name="adId" value="${ad.id}" class="form-control" type="hidden">--%>
<%--            <button type="submit">Delete</button>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--    <form action="/edit" method="post">--%>
<%--        <div class="form-group">--%>
<%--            <input type="hidden" name="editAdId" value="${ad.userId}">--%>
<%--            <label for="title">Title</label>--%>
<%--            <input id="title" name="title" class="form-control" type="text" value="${ad.title}">--%>
<%--            <label for="description">Description</label>--%>
<%--            <input id="description" name="description" class="form-control" value="${ad.description}" type="text">--%>
<%--            <button type="submit" class="btn btn-block btn-primary">Submit</button>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</div>--%>
<jsp:include page="/WEB-INF/partials/footer.jsp" />

</body>
</html>
