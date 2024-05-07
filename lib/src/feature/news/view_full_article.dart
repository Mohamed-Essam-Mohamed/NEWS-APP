import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class ViewFullArticle extends StatefulWidget {
  String url;
  ViewFullArticle({required this.url});

  @override
  State<ViewFullArticle> createState() => _ViewFullArticleState();
}

class _ViewFullArticleState extends State<ViewFullArticle> {
  var controller = WebViewController();
  var timer = false;

  @override
  void initState() {
    super.initState();
    changeTimer();
    controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: timer == false
          ? Center(
              child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ))
          : WebViewWidget(controller: controller),
    );
  }

  void changeTimer() {
    Timer(const Duration(milliseconds: 1300), () {
      timer = true;
      setState(() {});
    });
  }
}
