import '../../news/init_news.dart';
import 'tab_item.dart';
import '../../../model/sources_respons_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabContainer extends StatefulWidget {
  final List<Source> sourceList;

  const TabContainer({required this.sourceList, super.key});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: widget.sourceList
                .map(
                  (source) => TabItem(
                    source: source,
                    isSelected:
                        selectedIndex == widget.sourceList.indexOf(source),
                  ),
                )
                .toList(),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(child: InitNews(source: widget.sourceList[selectedIndex])),
        ],
      ),
    );
  }
}
