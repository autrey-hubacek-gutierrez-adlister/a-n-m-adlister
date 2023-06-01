<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body>
<jsp:include page="partials/navbar.jsp" />
<div class="container">
    <h1>Please fill in your information.</h1>
    <script>
        const urlParams = new URLSearchParams(window.location.search);
        const error = urlParams.get('error');
        if (error) {
            alert(error);
        }
    </script>
    <form action="/register" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text" value="${param.username}">
            <div id="usernameAvailability"></div>
            <button type="button" onclick="checkUsernameAvailability()">Check Username</button>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input id="email" name="email" class="form-control" type="email" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" value="${param.email}">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{4,}" value="${param.password}">
            <small id="passwordRequirements" class="form-text text-muted">
                Password must be at least 4 characters long and contain at least one uppercase letter, one digit, and one special character (*).
            </small>
        </div>
        <div class="form-group">
            <label for="confirm_password">Confirm Password</label>
            <input id="confirm_password" name="confirm_password" class="form-control" type="password" required oninput="checkPasswordMatch()" value="${param.confirm_password}">
            <span id="passwordMatchError" style="color: red;"></span>
        </div>
        <input type="submit" class="btn btn-primary btn-block">
    </form>
</div>
</body>
<script>
    function checkPasswordMatch() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirm_password").value;
        var passwordMatchError = document.getElementById("passwordMatchError");
        if (password !== confirmPassword) {
            passwordMatchError.textContent = "Passwords do not match";
        } else {
            passwordMatchError.textContent = "";
        }
    }
    function checkUsernameAvailability() {
        var username = document.getElementById("username").value;
        var usernameAvailability = document.getElementById("usernameAvailability");
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    if (response.available) {
                        usernameAvailability.textContent = "Good to use!";
                        usernameAvailability.style.color = "green";
                    } else {
                        usernameAvailability.textContent = "Username already exists";
                        usernameAvailability.style.color = "red";
                    }
                } else {
                    usernameAvailability.textContent = "Error checking username availability";
                    usernameAvailability.style.color = "red";
                }
            }
        };
        xhr.open("GET", "/checkUsername?username=" + encodeURIComponent(username), true);
        xhr.send();
    }
</script>
</html>
