import 'package:app_news/src/feature/news/init_news.dart';
import 'package:app_news/src/feature/tap/widget/tab_item.dart';
import 'package:app_news/src/model/sources_respons_model.dart';
import 'package:app_news/src/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabContainer extends StatefulWidget {
  List<Source> sourcceList;

  TabContainer({required this.sourcceList, super.key});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcceList.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: widget.sourcceList
                .map(
                  (source) => TabItem(
                    source: source,
                    isSelected:
                        selectedIndex == widget.sourcceList.indexOf(source),
                  ),
                )
                .toList(),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(child: InitNews(source: widget.sourcceList[selectedIndex])),
        ],
      ),
    );
  }
}
