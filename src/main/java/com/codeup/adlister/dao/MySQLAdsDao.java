package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public void delete(Ad ad) {

    }

    @Override
    public void deleteAds(long adId) throws SQLException {
        try {
            String deleteQuery = "DELETE FROM ads WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(deleteQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, String.valueOf(adId));
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting ad.", e);
        }

    }



    @Override
    public void editAds(long adId) {
       Ad ad = getAdById(adId);
        try {
            String insertQuery = "UPDATE ads SET (title, description) VALUES (?,?) WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.setString(3, String.valueOf(adId));
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error editing ad.", e);
        }
    }




    public Ad getAdById(long adId) {
       try {
           String query = "SELECT * FROM ads WHERE id = ?";
           PreparedStatement statement = connection.prepareStatement(query);
           statement.setLong(1, adId);
           ResultSet resultSet = statement.executeQuery();

           if (resultSet.next()) {
               String title = resultSet.getString("title");
               String description = resultSet.getString("description");

               return new Ad(adId, title, description);
           }
       } catch (SQLException e) {
           e.printStackTrace();
       }

       return null;
   }



    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }



}