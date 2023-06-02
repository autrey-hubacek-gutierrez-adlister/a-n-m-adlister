package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
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
        req.getRequestDispatcher("/WEB-INF/edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long userId = Long.parseLong(req.getParameter("userId"));
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String passwordConfirmation = req.getParameter("confirmPassword");
        String image = req.getParameter("image");

        /* validate input */
        boolean inputHasErrors = username.isEmpty()
                || email.isEmpty();

        if (inputHasErrors) {
            resp.sendRedirect("/editUser");
            return;
        }
        User user;
        if(password.isEmpty() || (! password.equals(passwordConfirmation))){
            user = new User(username, email, password,image);
        }else {
            user = new User(userId,username, email, password,image);
        }

        DaoFactory.getUsersDao().edit(user);
        req.getSession().removeAttribute("user");
        req.getSession().setAttribute("user", user);
        resp.sendRedirect("/profile");
    }
}
