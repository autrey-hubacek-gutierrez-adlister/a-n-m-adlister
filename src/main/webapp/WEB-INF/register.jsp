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
    <button class="action-header">Sign Up</button>
    <form action="/register" method="post" class="register-form">
        <div class="form-group rounded">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text">
        </div>
        <div class="form-group rounded">
            <label for="email">Email</label>
            <input id="email" name="email" class="form-control" type="text">
        </div>
        <div class="form-group rounded">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password">
        </div>
        <div class="form-group rounded">
            <label for="confirm_password">Confirm Password</label>
            <input id="confirm_password" name="confirm_password" class="form-control" type="password">
        </div>
<%--            <li><label class="form-check-label" for="flexCheckDefault">Agree to terms and conditions</label>--%>
<%--                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></li>--%>
           <input type="submit" class="submit-button">
    </form>





























<%--    <div class="container">--%>
<%--        <h1>Please fill in your information.</h1>--%>
<%--        <form action="/register" method="post">--%>
<%--            <div class="form-group">--%>
<%--                <label for="username">Username</label>--%>
<%--                <input id="username" name="username" class="form-control" type="text">--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <label for="email">Email</label>--%>
<%--                <input id="email" name="email" class="form-control" type="text">--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <label for="password">Password</label>--%>
<%--                <input id="password" name="password" class="form-control" type="password">--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <label for="confirm_password">Confirm Password</label>--%>
<%--                <input id="confirm_password" name="confirm_password" class="form-control" type="password">--%>
<%--            </div>--%>
<%--            <input type="submit" class="btn btn-primary btn-block">--%>
<%--        </form>--%>
<%--    </div>--%>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />

</body>
</html>
