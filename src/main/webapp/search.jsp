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
</head>
<body>
<h1>Search for items</h1>
<form action="/search" method="GET">
    <input type="text" name="search" placeholder="Search Item">
    <input type="submit" value="Search">
</form>
<hr>
<h2>Search by Category:</h2>
<form action="/search" method="GET">
    <input type="hidden" name="category" value="Housing">
    <input type="submit" value="Search Housing">
</form>
<form action="/search" method="GET">
    <input type="hidden" name="category" value="Jobs">
    <input type="submit" value="Search Jobs">
</form>
<form action="/search" method="GET">
    <input type="hidden" name="category" value="Services">
    <input type="submit" value="Search Services">
</form>
<form action="/search" method="GET">
    <input type="hidden" name="category" value="For Sale">
    <input type="submit" value="Search For Sale">
</form>
<hr>
<form action="/search" method="GET">
    <input type="hidden" name="showAll" value="true">
    <input type="submit" value="Show All Ads">
</form>
</body>
</html>







