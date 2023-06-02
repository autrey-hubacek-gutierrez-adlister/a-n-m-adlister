<%--
  Created by IntelliJ IDEA.
  User: Miguel.Gutierrez
  Date: 5/30/23
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Item Search</title>
    <link rel="stylesheet" href="css/search.css">
  </head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Search Ads!" />
    </jsp:include>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<form action="/search" method="GET">
    <ul class="search-ul">
        <li><input type="text" class="form-group form-control"  name="search" placeholder="Search Item"></li>
        <li><input type="submit" class="text-btn" value="Search"></li>
    </ul>
</form>
<%--<hr>--%>
<div class="button-container">
<ul class="query-buttons">
<%--<h2>Search by Category:</h2>--%>
<li>
<form action="/search" method="GET">
    <input type="hidden" name="category" value="Housing">
    <input type="submit"class="search-btn" value="Search Housing">
</form>
</li>
<li>
<form action="/search" method="GET">
    <input type="hidden" name="category" value="Jobs">
    <input type="submit" class="search-btn" value="Search Jobs">
</form>
</li>
<li>
<form action="/search" method="GET">
    <input type="hidden" name="category" value="Services">
    <input type="submit" class="search-btn" value="Search Services">
</form>
</li>
<li>
<form action="/search" method="GET">
    <input type="hidden" name="category" value="For Sale">
    <input type="submit" class="search-btn" value="Search For Sale">
</form>
</li>
<%--<hr>--%>
<li>
<form action="/search" method="GET">
    <input type="hidden" name="showAll" value="true">
    <input type="submit" class="search-btn" value="Show All Ads">
</form>
</li>
</ul>
</div>
<jsp:include page="/WEB-INF/partials/footer.jsp" />

</body>
</html>







