package com.codeup.adlister.controllers;


import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "controllers.EditAdsServlet", urlPatterns = "/edit")
public class EditAdsServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getSession().getAttribute("user") == null) {
            resp.sendRedirect("/login");
            // add a return statement to exit out of the entire method.
            return;
        }

        req.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(req, resp);

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        User loggedInUser = (User) req.getSession().getAttribute("user");
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        String oldTitle = DaoFactory.getUsersDao().

        DaoFactory.getAdsDao().editAds(Integer.parseInt(req.getParameter("id").);
    }

}
