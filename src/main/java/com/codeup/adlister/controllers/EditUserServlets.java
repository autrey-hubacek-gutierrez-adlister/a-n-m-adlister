package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.EditUserServlets", urlPatterns = "/editUser")
public class EditUserServlets extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("user") == null) {
            resp.sendRedirect("/login");
            return;
        }
        req.getRequestDispatcher("/WEB-INF/edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String newUsername = req.getParameter("newUsername");
        String newEmail = req.getParameter("newEmail");
        String newPassword = req.getParameter("newPassword");

        /* validate input */
        boolean inputHasErrors = newUsername.isEmpty()
                || newEmail.isEmpty()
                || newPassword.isEmpty();

        if (inputHasErrors) {
            resp.sendRedirect("/editUser");
            return;
        }

        // create and save a new user
        User user = new User(newUsername, newEmail, newPassword);

        // hash the password

        String hash = Password.hash(user.getPassword());

        user.setPassword(hash);

        DaoFactory.getUsersDao().insert(user);
        resp.sendRedirect("/login");
    }
}
