import 'dart:convert';

import 'package:app_news/src/model/news_respons_model.dart';
import 'package:app_news/src/model/sources_respons_model.dart';
import 'package:http/http.dart' as http;

class ApiProject {
  static const String baseUrl = "newsapi.org";
  /*
 https://newsapi.org/v2/top-headlines/sources?apiKey=fe3889024c19498da3a6be826bf2ea59&category=sports
  */
  static Future<SourcesRsponse> getSources(String category) async {
    Uri url = Uri.https(baseUrl, "/v2/top-headlines/sources", {
      "apiKey": "fe3889024c19498da3a6be826bf2ea59",
      "category": category,
    });

    try {
      var response = await http.get(url);
      var responseBody = response.body;
      return SourcesRsponse.fromJson(jsonDecode(responseBody));
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse> getNews(String source, {int page = 1}) async {
    Uri url = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': 'fe3889024c19498da3a6be826bf2ea59',
      'sources': source,
      'page': page.toString(),
    });

    try {
      var response = await http.get(url);
      var responseBody = response.body;
      return NewsResponse.fromJson(jsonDecode(responseBody));
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse> getSearch(String query) async {
    try {
      final Uri url = Uri.https(baseUrl, '/v2/everything', {
        'apiKey': 'fe3889024c19498da3a6be826bf2ea59',
        'q': query,
      });
      var response = await http.get(url);
      var responseBody = response.body;
      return NewsResponse.fromJson(jsonDecode(responseBody));
    } catch (e) {
      throw e;
    }
  }
}
