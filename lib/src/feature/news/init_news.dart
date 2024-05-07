import 'package:flutter/material.dart';

import '../../api/api_project.dart';
import '../../model/news_respons_model.dart';
import '../../model/sources_respons_model.dart';
import '../../theme/my_theme.dart';
import 'widget/news_item.dart';

// ignore: must_be_immutable
class InitNews extends StatefulWidget {
  final Source source;
  const InitNews({required this.source, super.key});

  @override
  State<InitNews> createState() => _InitNewsState();
}

class _InitNewsState extends State<InitNews> {
  int page = 1;
  List<Articles> articlesList = [];
  late ScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(
      () {
        //? i can know if start or end of the page
        if (controller.position.atEdge) {
          //? if end of the page
          if (controller.offset != 0) {
            setState(() {
              page++;
            });
          }
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiProject.getNews(widget.source.id!, page: page),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: MyTheme.defulteColor,
            ),
          );
        } else if (snapshot.hasError) {
          MaterialButton(
            onPressed: () {
              // ApiProject.getNews(widget.source.id ?? "");
              ApiProject.getNews(widget.source.id ?? "", page: page);
              setState(() {});
            },
          );
        }
        if (snapshot.data?.status != "ok") {
          return const Center(
            child: Text(
              "Error",
              style: TextStyle(
                fontSize: 60,
                color: Color.fromARGB(255, 191, 186, 186),
              ),
            ),
          );
        }
        articlesList = [];
        articlesList.addAll(snapshot.data!.articles ?? []);
        page = 1;
        return RefreshIndicator(
          color: Theme.of(context).primaryColor,
          onRefresh: () async {
            await Future.delayed(const Duration(milliseconds: 1000));
            setState(() {
              articlesList = [];
              page = 1;
            });
          },
          child: ListView.builder(
              controller: controller,
              itemCount: articlesList.length,
              itemBuilder: (context, index) {
                return NewsItem(news: articlesList[index]);
              }),
        );
      },
    );
  }
}
