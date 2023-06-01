package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import org.json.JSONObject;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.CheckUsernameServlet", urlPatterns = "/checkUsername")
public class CheckUsernameServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");

        // Check if username already exists
        boolean usernameExists = DaoFactory.getUsersDao().findByUsername(username) != null;

        // Create a JSON response
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("available", !usernameExists);

        // Set the response content type
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Send the JSON response
        response.getWriter().write(jsonResponse.toString());
    }
}
