//package com.codeup.adlister.dao;
//
//import com.codeup.adlister.models.Ad;
//
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//public class ListAdsDao implements Ads {
//    private List<Ad> ads;
//
//    public List<Ad> all() {
//        if (ads == null) {
//            ads = generateAds();
//        }
//        return ads;
//    }
//
//    public Long insert(Ad ad) {
//        // make sure we have ads
//        if (ads == null) {
//            ads = generateAds();
//        }
//        // we'll assign an "id" here based on the size of the ads list
//        // really the dao would handle this
//        ad.setId((long) ads.size());
//        ads.add(ad);
//        return ad.getId();
//    }
//
//    @Override
//    public void deleteAds(long adId) throws SQLException {
//      this.ads.remove(adId);
//    }
////
////    @Override
////    public void editAds(long adId,Ad ad) throws SQLException {
////        this.ads.get((int) adId).getDescription().
////    }
//
//
//    private List<Ad> generateAds() {
//        List<Ad> ads = new ArrayList<>();
//        ads.add(new Ad(
//            1,
//            1,
//            "playstation for sale",
//            "playstation for sale"
//        ));
//        ads.add(new Ad(
//            2,
//            1,
//            "Super Nintendo",
//            "Super Nintendo"
//        ));
//        ads.add(new Ad(
//            3,
//            2,
//            "Junior Java Developer Position",
//            "Junior Java Developer Position"
//        ));
//        ads.add(new Ad(
//            4,
//            2,
//            "JavaScript Developer needed",
//            "JavaScript Developer needed"
//        ));
//        return ads;
//    }
//}
