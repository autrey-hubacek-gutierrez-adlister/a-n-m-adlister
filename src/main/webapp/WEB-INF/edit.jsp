<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
    <link href="../css/register.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="partials/navbar.jsp" />
<button class="action-edit-header">Edit Profile</button>>

<div class="container">
    <form action="/editUser" method="post" class="edit-form">
        <input type="hidden" name="userId" value="${user.id}">
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control"  type="text">
<%--            value=${user.username}--%>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input id="email" name="email" class="form-control"  type="text">
<%--            value=${user.email}--%>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password">
<%--            value=${user.password}--%>
        </div>
        <div class="form-group">
            <label for="confirm_password">Confirm Password</label>
            <input id="confirm_password" name="confirmPassword" class="form-control" type="password">
<%--            value=${user.password}--%>
        </div>
        <input type="submit" class="submit-button">
    </form>
</div>
<jsp:include page="/WEB-INF/partials/footer.jsp" />

</body>
</html>