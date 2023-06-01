package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.sql.SQLException;
import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    void delete(Ad ad);

    void deleteAds(long adId) throws SQLException;

    void editAds(long adId,String title, String description);
  
    Ad getAdById(long id);

}


