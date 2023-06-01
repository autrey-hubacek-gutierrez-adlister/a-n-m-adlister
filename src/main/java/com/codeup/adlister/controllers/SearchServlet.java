package com.codeup.adlister.controllers;

import com.codeup.adlister.models.SearchResult;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchServlet", urlPatterns = "/search")
public class SearchServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/adlister_db";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "codeup";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchQuery = request.getParameter("search");
        String category = request.getParameter("category");
        boolean showAll = Boolean.parseBoolean(request.getParameter("showAll"));

        List<SearchResult> searchResults = new ArrayList<>();
        if (showAll) {
            searchResults = getAllAds();
        } else if (category != null && !category.isEmpty()) {
            searchResults = performSearchByCategory(category);
        } else if (searchQuery != null && !searchQuery.isEmpty()) {
            searchResults = performSearch(searchQuery);
        }

        request.setAttribute("searchResults", searchResults);
        request.getRequestDispatcher("/results.jsp").forward(request, response);
    }

    private List<SearchResult> performSearch(String searchQuery) {
        List<SearchResult> searchResults = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            String sql = "SELECT id, title, description, category FROM ads WHERE title LIKE ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, "%" + searchQuery + "%");

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int itemId = resultSet.getInt("id");
                String itemName = resultSet.getString("title");
                String itemDescription = resultSet.getString("description");
                String itemCategory = resultSet.getString("category");
                SearchResult searchResult = new SearchResult(itemId, itemName, itemDescription, itemCategory);
                searchResults.add(searchResult);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return searchResults;
    }

    private List<SearchResult> performSearchByCategory(String category) {
        List<SearchResult> searchResults = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            String sql = "SELECT id, title, description, category FROM ads WHERE category = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, category);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int itemId = resultSet.getInt("id");
                String itemName = resultSet.getString("title");
                String itemDescription = resultSet.getString("description");
                SearchResult searchResult = new SearchResult(itemId, itemName, itemDescription, category);
                searchResults.add(searchResult);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return searchResults;
    }

    private List<SearchResult> getAllAds() {
        List<SearchResult> searchResults = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            String sql = "SELECT id, title, description, category FROM ads";
            PreparedStatement statement = conn.prepareStatement(sql);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int itemId = resultSet.getInt("id");
                String itemName = resultSet.getString("title");
                String itemDescription = resultSet.getString("description");
                String itemCategory = resultSet.getString("category");
                SearchResult searchResult = new SearchResult(itemId, itemName, itemDescription, itemCategory);
                searchResults.add(searchResult);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return searchResults;
    }
}