// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:app_news/src/animation/loading_animation_image.dart';
import 'package:app_news/src/feature/news/news_details_screen.dart';
import 'package:app_news/src/model/news_respons_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final Articles news;
  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    var dateTime = DateTime.parse(news.publishedAt!);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Card(
        color: Colors.white,
        elevation: 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetailsScreen(
                      articles: news,
                    ),
                  ),
                );
              },
              child: ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? "",
                  placeholder: (context, url) => LoadingAnimationImage(),
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/imags/NewsTest.png'),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    news.author ?? "",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    news.title ?? "",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
