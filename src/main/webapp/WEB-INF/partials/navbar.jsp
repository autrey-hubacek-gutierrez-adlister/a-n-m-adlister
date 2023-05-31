<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <% if (session.getAttribute("user") == null) { %>
            <li><a href="/login">Login</a></li>
            <% } %>
            <% if (session.getAttribute("user") != null) { %>
            <li><a href="/logout">Logout</a></li>
            <% } %>
            <li><a href="/search.jsp">Search</a></li>
        </ul>
    </div>
</nav>