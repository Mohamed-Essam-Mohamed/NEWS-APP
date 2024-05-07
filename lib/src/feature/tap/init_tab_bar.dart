// ignore_for_file: prefer_const_constructors

import 'package:app_news/src/animation/loading_animation_page.dart';

import 'package:app_news/src/api/api_project.dart';
import 'package:app_news/src/feature/tap/widget/tab_container.dart';
import 'package:app_news/src/model/category_model.dart';
import 'package:app_news/src/model/sources_respons_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class InitTabBar extends StatefulWidget {
  final CategoryModel categoryModel;
  const InitTabBar({required this.categoryModel, super.key});

  @override
  State<InitTabBar> createState() => _InitTabBarState();
}

class _InitTabBarState extends State<InitTabBar> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesRsponse>(
      future: ApiProject.getSources(widget.categoryModel.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingAnimationPage();
        } else if (snapshot.hasError) {
          Center(
            child: MaterialButton(
              onPressed: () {
                ApiProject.getSources(widget.categoryModel.id);
                setState(() {});
              },
            ),
          );
        }
        if (snapshot.data?.status != "ok") {
          return const Center(
            child: Text(
              "Error",
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 191, 186, 186)),
            ),
          );
        }
        var sourceList = snapshot.data?.sources ?? [];
        return TabContainer(sourceList: sourceList);
      },
    );
  }
}
