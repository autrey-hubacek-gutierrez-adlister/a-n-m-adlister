package com.codeup.adlister.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchServlet", urlPatterns = "/search")
public class SearchServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/adlister_db";
    private static final String DB_USERNAME = "username";
    private static final String DB_PASSWORD = "password";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchQuery = request.getParameter("q");

        String searchResult = performSearch(searchQuery);

        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h2>Search Result:</h2>");
        out.println("<p>" + searchResult + "</p>");
        out.println("</body></html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchQuery = request.getParameter("q");

        String searchResult = performSearch(searchQuery);

        response.sendRedirect("/search?q=" + searchQuery);
    }

    private String performSearch(String searchQuery) {
        try {
            Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            String sql = "SELECT * FROM items WHERE name LIKE ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, "%" + searchQuery + "%");

            ResultSet resultSet = statement.executeQuery();

            StringBuilder result = new StringBuilder();
            while (resultSet.next()) {
                int itemId = resultSet.getInt("id");
                String itemName = resultSet.getString("name");
                result.append("Item ID: ").append(itemId).append(", Name: ").append(itemName).append("<br>");
            }

            resultSet.close();
            statement.close();
            conn.close();

            return result.toString();
        } catch (SQLException e) {
            e.printStackTrace();
            return "An error occurred while performing the search.";
        }
    }
}
