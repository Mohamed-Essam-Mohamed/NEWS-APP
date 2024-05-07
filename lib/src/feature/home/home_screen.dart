import '../category/category_screen.dart';
import 'search.dart';

import '../settings_tap/settings_tap.dart';
import '../tap/init_tab_bar.dart';

import 'drawer_screen.dart';
import '../../model/category_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// background image
        Image.asset(
          'assets/imags/splash.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          drawer: Drawer(
            shadowColor: Colors.white,
            child: DrawerHome(onClickDrawer: onCategoryClickDrawer),
          ),
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Search());
                },
                icon: const Icon(
                  Icons.search,
                  size: 35,
                  color: Colors.white,
                ),
              )
            ],
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              selectedDrawerItem == DrawerHome.onClickSetting
                  ? 'Settings'
                  : selectedCategory == null
                      ? 'News App'
                      : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: selectedDrawerItem == DrawerHome.onClickSetting
              ? const SettingsTap()
              : selectedCategory == null
                  ? CategoryScreen(onClickCategory: onClickCategory)
                  : InitTabBar(categoryModel: selectedCategory!),
        ),
      ],
    );
  }

  CategoryModel? selectedCategory;
  void onClickCategory(CategoryModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedDrawerItem = DrawerHome.onClickCategory;

  void onCategoryClickDrawer(int newSelectedDrawerItem) {
    selectedDrawerItem = newSelectedDrawerItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
