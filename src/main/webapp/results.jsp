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
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<a href="/search.jsp">Back to Search</a>

<h2>Search Result:</h2>
<c:forEach var="result" items="${searchResults}">
    <p>Item ID: ${result.itemId}<br> Item Category: ${result.itemCategory}<br> Title: ${result.itemName}<br> Description: ${result.itemDescription}</p>
</c:forEach>



</body>
</html>

