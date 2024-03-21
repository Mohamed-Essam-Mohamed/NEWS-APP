// ignore_for_file: prefer_const_constructors

import 'package:app_news/src/feature/category/category_screen.dart';

import 'package:app_news/src/feature/home/home_screen.dart';
import 'package:app_news/src/feature/news/news_details_screen.dart';
import 'package:app_news/src/model/news_respons_model.dart';

import 'package:app_news/src/theme/my_theme.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale("en"),
      theme: MyTheme.theme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
