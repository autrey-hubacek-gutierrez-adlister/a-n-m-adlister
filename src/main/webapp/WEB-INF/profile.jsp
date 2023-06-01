<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <c:forEach var="ad" items="${ads}">
        <form action="/edit" method="get">
        <h2>${ad.title}</h2>
        <p>${ad.description}</p>

            <div class="form-group">
                <input name="editAdId" value="${ad.id}" class="form-control" type="hidden">
                <button type="submit">Delete</button>
            </div>
        </form>


    <form action="/delete" method="post">
        <div class="form-group">
            <input name="adId" value="${ad.id}" class="form-control" type="hidden">
            <button type="submit">Delete</button>
        </div>
    </form>
        </c:forEach>
</body>
</html>
