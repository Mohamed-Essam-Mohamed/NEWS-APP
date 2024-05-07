import '../theme/my_theme.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String title;
  String imageUrl;
  Color color;
  CategoryModel({
    required this.color,
    required this.id,
    required this.imageUrl,
    required this.title,
  });
  //      .
  static List<CategoryModel> getCategory() {
    return [
      CategoryModel(
        color: MyTheme.redColor,
        id: "business",
        imageUrl: "assets/imags/bussines.png",
        title: "Business",
      ),
      CategoryModel(
        color: MyTheme.blueColor,
        id: "entertainment",
        imageUrl: "assets/imags/environment.png",
        title: "Entertainment",
      ),
      CategoryModel(
        color: MyTheme.gamalyColor,
        id: "health",
        imageUrl: "assets/imags/health.png",
        title: "Health",
      ),
      CategoryModel(
        color: MyTheme.defulteColor,
        id: "science",
        imageUrl: "assets/imags/science.png",
        title: "Sciences",
      ),
      CategoryModel(
        color: MyTheme.yellwColor,
        id: "sports",
        imageUrl: "assets/imags/ball.png",
        title: "Sports",
      ),
      CategoryModel(
        color: MyTheme.pinkColor,
        id: "technology",
        imageUrl: "assets/imags/Politics.png",
        title: "Technology",
      ),
    ];
  }
}
