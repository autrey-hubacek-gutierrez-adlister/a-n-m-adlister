<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

<link rel="stylesheet" href="../../css/navbar.css">
    <nav class="navbar navbar-expand-lg bg-body-tertiar" style="background-color: #C7D66D;">
        <div class="container-fluid">
            <a class="navbar-brand logo" href="/index.jsp"><img src="../../img/communilist%20logo.png"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/ads">Ads</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/ads/create">Create Ad</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/search.jsp">Search</a>
                    </li>
                </ul>

                <% if (session.getAttribute("user") == null) { %>
                <form action="/register" method="get">
                    <button id="sign-up-button">Sign Up</button>
                </form>
                <form action="/login" method="get">
                <button id="sign-in-button">Login</button>
                </form>
                <% } %>
                <% if (session.getAttribute("user") != null) { %>
                <form action="/logout" method="get">
                <button id="logout-button">Logout</button>
                </form>
                <form action="/profile" method="get">
                <button id="profile-button">Profile</button>
                </form>
                <% } %>
            </div>
        </div>
    </nav>












<%--    <nav class="navbar navbar-default">--%>
<%--    <div class="container-fluid">--%>
<%--        <!-- Brand and toggle get grouped for better mobile display -->--%>
<%--        <div class="navbar-header">--%>
<%--            <a class="navbar-brand" href="/ads">Adlister</a>--%>
<%--        </div>--%>
<%--        <ul class="nav navbar-nav navbar-right">--%>
<%--            <% if (session.getAttribute("user") == null) { %>--%>
<%--            <li><a href="/login">Login</a></li>--%>
<%--            <% } %>--%>
<%--            <% if (session.getAttribute("user") != null) { %>--%>
<%--            <li><a href="/logout">Logout</a></li>--%>
<%--            <% } %>--%>
<%--            <li><a href="/search.jsp">Search</a></li>--%>

<%--        </ul>--%>
<%--    </div>--%>
<%--</nav>--%>