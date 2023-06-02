<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <link rel="stylesheet" href="../css/profile.css">
    <title>${sessionScope.user.username}'s Profile</title>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <section class="profile-details">
        <div class="details">
            <ul class="user-img-id">
                <li><span class="dot"></span></li>
                <li><span class="user-id">${sessionScope.user.username}</span></li>
                <li><span class="email">${sessionScope.user.email}</span></li>
            </ul>
            <ul class="button-ul">
                <form method="get" action="/editUser">
                 <input type="hidden" id="editUser" name="editUser" value="${sessionScope.user.id}">
                    <li><button class="prof-btn" id="edit-user-info">Edit Profile</button></li>
                </form>
                <form method="post" action="/deleteUser">
                    <input type="hidden" id="deleteUser" name="deleteUser" value="${sessionScope.user.username}">
                    <input type="submit" class="prof-btn" value="Delete Account">
                </form>
            </ul>
        </div>
    </section>



    <div class="container">

    <c:forEach var="ad" items="${ads}">
    <section class="ads">
        <div class="ads-card">
            <div width="40px" height="40px" ></div>
            <ul class="ad-info">
            <li><h1 id="ad-title">${ad.title}</h1></li>
            <li><p id="ad-desc">${ad.description}</p></li>
            </ul>
            <div class="ad-buttons">
                <form action="/edit" method="get">
                <input name="editAdId" value="${ad.id}" class="form-control" type="hidden">
                <button class="edit-btn" type="submit">Edit</button>
                </form>
                <form action="/delete" method="post">
                    <div class="form-group">
                        <input name="adId" value="${ad.id}" class="form-control" type="hidden">
                        <button class="delete-btn" type="submit">Delete</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
    </c:forEach>
    </div>
<%--    <form method="post" action="/deleteUser">--%>
<%--        <input type="hidden" id="delete" name="deleteUser" value="${sessionScope.user.username}">--%>
<%--        <input type="submit" class="btn btn-outline-danger" value="Delete Account">--%>
<%--    </form>--%>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />

</body>
</html>
