import '../../api/api_project.dart';
import '../news/widget/news_item.dart';
import '../../model/news_respons_model.dart';
import '../../theme/my_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Search extends SearchDelegate {
  // @override
  // // TODO: implement searchFieldDecorationTheme
  // InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(
  //       border: InputBorder.none,
  //       enabledBorder: InputBorder.none,
  //       focusedBorder: InputBorder.none,
  //     );
  //? change color text write in search Article
  @override
  TextStyle? get searchFieldStyle =>
      TextStyle(color: Colors.white, fontSize: 20);
  //? chang text Search to Search Article
  @override
  String? get searchFieldLabel => 'Search Article';
  //? control style app bar theme
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 11),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        hintStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(
          Icons.search,
          color: Colors.white,
          size: 35,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        query = '';
      },
      icon: const Icon(
        Icons.clear,
        size: 35,
        color: Colors.white,
      ),
    );
  }

  //? لما تعمل انتر
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return FutureBuilder<NewsResponse>(
      future: ApiProject.getSearch(query),
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
        var articlesList = snapshot.data!.articles ?? [];
        return ListView.builder(
            itemCount: articlesList.length,
            itemBuilder: (context, index) {
              return NewsItem(news: articlesList[index]);
            });
      },
    );
  }

  //? لما تيجي تكتب
  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return FutureBuilder<NewsResponse>(
      future: ApiProject.getSearch(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.defulteColor,
            ),
          );
        } else if (snapshot.hasError) {
          MaterialButton(
            onPressed: () {
              // ApiProject.getNews(widget.source.id ?? "");
            },
          );
        }
        if (snapshot.data?.status != "ok") {
          return const Center(
            child: Text(
              "Please writ to Search",
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 191, 186, 186),
              ),
            ),
          );
        }
        var articlesList = snapshot.data!.articles ?? [];
        return ListView.builder(
            itemCount: articlesList.length,
            itemBuilder: (context, index) {
              return NewsItem(news: articlesList[index]);
            });
      },
    );
  }
}
