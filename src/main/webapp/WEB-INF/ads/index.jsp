<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
        </div>
<%--        <form action="/delete" method="post">--%>
<%--            <div class="form-group">--%>
<%--                <input name="adId" value="${ad.id}" class="form-control" type="hidden">--%>
<%--                <button>Delete</button>--%>
<%--            </div>--%>
<%--        </form>--%>
    </c:forEach>
</div>

</body>
</html>
