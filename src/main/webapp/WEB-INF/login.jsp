<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
    <link href="../css/login.css" rel="stylesheet" type="text/css">

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<form action="/login" method="post" class="login-form">
    <div class="form-group rounded">
        <label for="username">Username</label>
        <input id="username" name="username" class="form-control" type="text">
    </div>
    <div class="form-group rounded">
        <label for="password">Password</label>
        <input id="password" name="password" class="form-control" type=password>
    </div>
    <input type="submit" class="submit-button">
</form>
<%--    <form action="/register" method="GET">--%>
<%--        <input type="submit" class="btn btn-primary btn-block" value="Sign Up">--%>
<%--    </form>--%>



<%--<div class="container">--%>
<%--    <h1>Please Log In</h1>--%>
<%--    <form action="/login" method="POST">--%>
<%--        <div class="form-group">--%>
<%--            <label for="username">Username</label>--%>
<%--            <input id="username" name="username" class="form-control" type="text">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="password">Password</label>--%>
<%--            <input id="password" name="password" class="form-control" type="password">--%>
<%--        </div>--%>
<%--        <input type="submit" class="btn btn-primary btn-block" value="Log In">--%>
<%--    </form>--%>
<%--    <form action="/register" method="GET">--%>
<%--        <input type="submit" class="btn btn-primary btn-block" value="Sign Up">--%>
<%--    </form>--%>
<%--</div>--%>
<jsp:include page="/WEB-INF/partials/footer.jsp" />

</body>
</html>