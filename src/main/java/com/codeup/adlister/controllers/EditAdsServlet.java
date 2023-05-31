package com.codeup.adlister.controllers;


import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "controllers.EditAdsServlet", urlPatterns = "/ads/edit")
public class EditAdsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(req, resp);
        req.setAttribute("ads", DaoFactory.getAdsDao().all());

    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object ads =req.getAttribute("ads");
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        long userId = Long.parseLong(req.getParameter("userId"));
        DaoFactory.getAdsDao().editAds(Long.parseLong((req.getParameter("editAdId"))));
        resp.sendRedirect("/ads");
    }

}