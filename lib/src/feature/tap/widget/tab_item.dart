import 'package:app_news/src/model/sources_respons_model.dart';
import 'package:app_news/src/theme/my_theme.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  Source source;
  bool isSelected;
  TabItem({required this.source, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
      ),
      child: Text(
        source.name ?? "",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color:
              isSelected ? MyTheme.whiteColor : Theme.of(context).primaryColor,
        ),
      ),
    );
    ;
  }
}
