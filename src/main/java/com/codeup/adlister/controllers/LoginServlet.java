package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import org.mindrot.jbcrypt.BCrypt;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }

        String signUpButton = request.getParameter("signup");
        if (signUpButton != null && signUpButton.equals("true")) {
            response.sendRedirect("/register");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Check if username or password is missing
        if (username.isEmpty() || password.isEmpty()) {
            request.setAttribute("errorMessage", "Username and password are required.");
            request.setAttribute("alertType", "danger");
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        }

        User user = DaoFactory.getUsersDao().findByUsername(username);

        if (user == null) {
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.setAttribute("alertType", "danger"); // Add an alert type for Bootstrap CSS classes
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        }
        boolean validAttempt = Password.check(password, user.getPassword());


        if (validAttempt) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("/profile");
        } else {
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.setAttribute("alertType", "danger"); // Add an alert type for Bootstrap CSS classes
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
    }

}