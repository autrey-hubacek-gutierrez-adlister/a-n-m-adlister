package com.codeup.adlister.controllers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.AdsDetailServlet", urlPatterns = "/details")
public class AdsDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String adId = req.getParameter("id");

        req.setAttribute("adTitle", "Sample Ad");
        req.setAttribute("adDescription", "This is a sample ad description.");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/ad_details.jsp");
        dispatcher.forward(req, resp);
    }
}
