// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:app_news/src/feature/category/widget/category_item.dart';
import 'package:app_news/src/model/category_model.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = "CategoryScreen";
  Function onClickCategory;
  CategoryScreen({
    Key? key,
    required this.onClickCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var siz = MediaQuery.of(context).size;
    List<CategoryModel> categoryList = CategoryModel.getCategory();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
          child: Text(
            "Pick your category\nof interest",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.grey[500],
                ),
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => InkWell(
              highlightColor: Colors.transparent,
              onTap: () {
                onClickCategory(categoryList[index]);
              },
              child: CategoryItem(
                categoryModel: categoryList[index],
                index: index,
              ),
            ),
            itemCount: categoryList.length,
          ),
        )
      ],
    );
  }
}
