// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_news/src/model/category_model.dart';
import 'package:app_news/src/theme/my_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  int index;

  CategoryItem({
    required this.categoryModel,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    var siz = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(siz.height * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(index % 2 == 0 ? 0 : 20),
          bottomLeft: Radius.circular(index % 2 == 0 ? 20 : 0),
        ),
        color: categoryModel.color,
        boxShadow: [
          BoxShadow(
            color: MyTheme.defulteColor,
            offset: Offset(0, 17),
            blurRadius: 17,
            spreadRadius: -23,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            categoryModel.imageUrl,
            height: siz.height * 0.1,
          ),
          Text(
            categoryModel.title,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
