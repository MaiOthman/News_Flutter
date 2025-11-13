import 'dart:core';

import 'package:news_app/utils/app_assets.dart';

class NewsCategory{
  String id;
  String name;
  String image;
  NewsCategory({
    required this.id, required this.name, required this.image
});
  static List<NewsCategory> newsCategory(bool isDark){
    return [
      NewsCategory(id: 'general', name: 'General', image: isDark? AppAssets.general_light: AppAssets.general_dark),
      NewsCategory(id: 'business', name: 'Business', image:  isDark? AppAssets.business_light: AppAssets.business_dark),
      NewsCategory(id: 'sports', name: 'Sports', image:  isDark? AppAssets.sport_light: AppAssets.sport_dark),
      NewsCategory(id: 'technology', name: 'Technology', image:  isDark? AppAssets.technology_light: AppAssets.technology_dark),
      NewsCategory(id: 'entertainment', name: 'Entertainment', image:  isDark? AppAssets.entertainment_light: AppAssets.entertainment_dark),
      NewsCategory(id: 'health', name: 'Health', image:  isDark?AppAssets.health_light: AppAssets.health_dark),
      NewsCategory(id: 'science', name: 'Science', image:  isDark? AppAssets.science_light: AppAssets.science_dark),
    ];
  }
}