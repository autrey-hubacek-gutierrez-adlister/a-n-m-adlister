<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
    <link rel="stylesheet" href="css/home.css">
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <section class="banner">
        <ul class="banner-ul">
            <li class="banner-li" id="banner-phrase"><p class="banner-phrase">“Connecting Locals,
                <br>
                Uniting Communities!”
            </p></li>
            <li class="banner-li" id="call-to-action"><button class="call-to-action"><a class="cta-link" href="/register">Start Selling Today</a> </button></li>
        </ul>
    </section>


    <section class="category-buttons">
        <ul class="category-ul">
            <li class="category-li" id="automobile">
                <form action="/search"method="get">
                    <button class="category-button" id="forsale-button">
                    <input type="hidden" name="category" value="For Sale">
                    <img src="img/FOR%20SALE%20BUTTON.png"></button>
                </form></li>
            <form action="/search" method="get">
            <li class="category-li" id="jobs"><button class="category-button" id="jobs-button">
                <input type="hidden" name="category" value="Jobs">
                <img src="img/JOBS%20BUTTON.png"></button></li>
            </form>
            <form action="/search"method="get">
            <li class="category-li" id="services"><button class="category-button" id="services-button">
                <input type="hidden" name="category" value="Services">
                <img src="img/SERVICES%20BUTTON.png"></button></li>
            </form>
        </ul>
    </section>



    <section class="recent-posts">
        <div class="recent-post"><img><h4 class="recent-posttext">recent Post</h4></div>
        <div class="recent-post"><img><h4 class="recent-posttext">recent Post</h4></div>
    </section>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />

</body>
</html>
