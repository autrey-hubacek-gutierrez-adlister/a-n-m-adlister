<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
    <link rel="stylesheet" href="../../css/create.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <button class="action-header">Create Ad</button>
        <form action="/ads/create" method="post" class="register-form">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group rounded">
                <label for="description">Description</label>
                <textarea id="description" name="description" rows="5" cols="33" class="form-control"></textarea>
            </div>
<%--            <div class="input-group mb-3">--%>
<%--                <label class="input-group-text" for="inputGroupFile01">Upload</label>--%>
<%--                <input type="file" class="form-control" id="inputGroupFile01">--%>
<%--            </div>--%>
            <input type="submit" class="submit-button">
        </form>
    </div>
<jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>
