package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.codeup.adlister.dao.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "controllers.EditAdsServlet", urlPatterns = "/edit")
public class EditAdsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        String adId = request.getParameter("editAdId");
        Ad ad = DaoFactory.getAdsDao().getAdById(Long.parseLong(adId));
        request.setAttribute("ad", ad);
        request.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(request, response);

    }





    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String adId = request.getParameter("editAdId");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        DaoFactory.getAdsDao().editAds(Long.parseLong(adId),title,description);
        response.sendRedirect("/ads");

        }

    }
