<%--
  Created by IntelliJ IDEA.
  User: Miguel.Gutierrez
  Date: 5/30/23
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Search" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<h2>Item Search</h2>

<form action="${pageContext.request.contextPath}/search" method="post">
    <input type="text" name="q" placeholder="Search for items">
    <button type="submit">Search</button>
</form>

<hr>

<h3>Search Result:</h3>
<c:if test="${not empty searchResult}">
    <c:out value="${searchResult}" escapeXml="false" />
</c:if>
</body>
</html>

