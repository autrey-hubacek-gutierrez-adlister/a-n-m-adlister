package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.DeleteUserServlets", urlPatterns = "/deleteUser")
public class DeleteUserServlets extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("user") == null) {
            resp.sendRedirect("/login");
            return;
        }
        req.getRequestDispatcher("/WEB-INF/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("deleteUser");
        if (username != null) {
            User user = DaoFactory.getUsersDao().findByUsername(username);
            List<Ad> ads = DaoFactory.getAdsDao().all();
            for (Ad ad : ads) {
                if (ad.getUserId() == user.getId()) {
                    System.out.printf("delete %s\n", ad.getTitle());
                    DaoFactory.getAdsDao().delete(ad);
                }
            }
            DaoFactory.getUsersDao().delete(user);
            System.out.printf("deleted %s%n", username);
        }else {
            System.out.printf("deleted %s%n", username);
     }
        resp.sendRedirect("logout");
    }
}
