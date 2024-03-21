// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingAnimationPage extends StatefulWidget {
  static const String routeName = "LoadingAnimation";
  @override
  State<LoadingAnimationPage> createState() => _LoadingAnimationPageState();
}

class _LoadingAnimationPageState extends State<LoadingAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Color.fromARGB(255, 207, 207, 207),
                  highlightColor: Color.fromARGB(255, 255, 255, 255),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 15,
                      left: 8,
                      right: 8,
                    ),
                    padding: EdgeInsets.all(10),
                    height: 40,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            itemCount: 5,
          ),
        ),
        Expanded(
          flex: 10,
          child: ListView.builder(
            itemBuilder: (context, index) => Shimmer.fromColors(
              baseColor: Color.fromARGB(255, 207, 207, 207),
              highlightColor: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    height: 260,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(
                      top: 2,
                      left: 20,
                      right: 20,
                    ),
                    height: 15,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(
                      top: 2,
                      left: 20,
                      right: 20,
                    ),
                    height: 15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(
                      top: 2,
                      left: 20,
                      right: 20,
                    ),
                    height: 15,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            itemCount: 6,
          ),
        ),
      ],
    );
  }
}
