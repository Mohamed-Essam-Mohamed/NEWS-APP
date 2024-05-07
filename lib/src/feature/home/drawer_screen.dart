// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DrawerHome extends StatelessWidget {
  static const int onClickCategory = 1;
  static const int onClickSetting = 2;
  final Function onClickDrawer;
  const DrawerHome({required this.onClickDrawer});

  @override
  Widget build(BuildContext context) {
    var siz = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          child:
              Text("News App", style: Theme.of(context).textTheme.titleLarge),
          color: Theme.of(context).primaryColor,
          width: double.infinity,
          height: siz.height * 0.25,
          alignment: Alignment.center,
        ),
        InkWell(
          onTap: () {
            onClickDrawer(DrawerHome.onClickCategory);
          },
          child: Container(
            margin: EdgeInsets.all(15),
            child: Row(
              children: [
                Text(
                  "Category",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black),
                ),
                Spacer(),
                Icon(
                  Icons.list,
                  size: 30,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            onClickDrawer(DrawerHome.onClickSetting);
          },
          child: Container(
            margin: EdgeInsets.all(15),
            child: Row(
              children: [
                Text(
                  "Settings",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black),
                ),
                Spacer(),
                Icon(
                  Icons.settings,
                  size: 30,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
