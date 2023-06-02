<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <link rel="stylesheet" href="../../css/profile.css">

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">

    <c:forEach var="ad" items="${ads}">
        <section class="ads">
            <div class="ads-card">
                <img class="ad-img" src="../img/placeholder-image.png" width="40px" height="40px">
                <ul class="ad-info">
                    <li><h1 id="ad-title">${ad.title}</h1></li>
                    <li><p id="ad-desc">${ad.description}</p></li>
                </ul>
            </div>
        </section>
    </c:forEach>

<%--    <c:forEach var="ad" items="${ads}">--%>
<%--        <div class="col-md-6">--%>
<%--            <h2>${ad.title}</h2>--%>
<%--            <p>${ad.description}</p>--%>

<%--        </div>--%>
<%--    </c:forEach>--%>
</div>
<jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>
