import '../../animation/loading_animation_image.dart';
import 'view_full_article.dart';
import '../../model/news_respons_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class NewsDetailsScreen extends StatelessWidget {
  Articles articles;

  NewsDetailsScreen({required this.articles, super.key});

  static const String routeName = 'NewsDetailsScreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            articles.source!.name ?? '',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(19.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: articles.urlToImage ?? "",
                    placeholder: (context, url) =>
                        const LoadingAnimationImage(),
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/imags/NewsTest.png'),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  articles.title ?? "",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  articles.description ?? "",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  articles.content ?? "",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewFullArticle(
                            url: articles.url ?? '',
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'View Full Article',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
