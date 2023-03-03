import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/Categories/category_tab.dart';
import 'package:news_app/ui/News/tab_news.dart';

import '../../modules/Source.dart';

class CategoryTabs extends StatefulWidget {
List<Source> sources;

CategoryTabs({required this.sources});

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: Column(
            children: [
              TabBar(tabs: widget.sources.map((item) => CategoryTab(source: item,isSelected:widget.sources.indexOf(item)==selectedIndex?true:false ,)).toList(),
                isScrollable: true,
                indicatorColor: Colors.transparent,
                padding: EdgeInsets.symmetric(vertical: 10),
                onTap: (value) {
                  setState(() {
                    selectedIndex=value;
                  });
                },
              )
            ],
          ),
        ),
        Expanded(child: TabNews(source: widget.sources[selectedIndex]))
      ],
    );
  }
}
