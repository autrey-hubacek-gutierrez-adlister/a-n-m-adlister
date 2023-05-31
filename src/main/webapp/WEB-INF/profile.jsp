<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>
    <form method="post" action="/deleteUser">
        <input type="hidden" id="delete" name="deleteUser" value="${sessionScope.user.username}">
        <input type="submit" class="btn btn-outline-danger" value="Delete Account">
    </form>
</body>
</html>
