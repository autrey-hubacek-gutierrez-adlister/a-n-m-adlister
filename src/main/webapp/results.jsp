<%--
  Created by IntelliJ IDEA.
  User: Miguel.Gutierrez
  Date: 5/31/23
  Time: 10:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Search Results!" />
    </jsp:include>
<link rel="stylesheet" href="css/profile.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<a href="/search.jsp"><button class="back-to-search">Back to Search</button></a>

<%--<h2>Search Result:</h2>--%>

<c:forEach var="result" items="${searchResults}">
    <section class="ads">
        <div class="ads-card">
            <ul class="ad-info">
                <li><h1 id="ad-title">${result.itemName}</h1></li>
                <li><p id="ad-desc">${result.itemDescription}</p></li>
            </ul>
        </div>
    </section>
</c:forEach>
<%--<c:forEach var="result" items="${searchResults}">--%>
<%--    <p>Item ID: ${result.itemId}<br> Item Category: ${result.itemCategory}<br> Title: ${result.itemName}<br> Description: ${result.itemDescription}</p>--%>
<%--</c:forEach>--%>


<jsp:include page="/WEB-INF/partials/footer.jsp" />

</body>
</html>

