import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/API/apiManager.dart';
import 'package:news_app/modules/NewsResponse.dart';
import 'package:news_app/modules/Source.dart';
import 'package:news_app/ui/News/news_item.dart';

class TabNews extends StatelessWidget {
Source source;
TabNews({required this.source});
  @override
  Widget build(BuildContext context) {
    return Container(
child: FutureBuilder<NewsResponse>(
  future: apiManager.getNews(sourceId: source.id??''),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (snapshot.hasError) {
      return Center(
        child: Text("Error displaying data"),
      );
    }
    if (snapshot.data?.status == 'error') {
      return Center(
        child: Text(
            "Error fetching data from server as ${snapshot.data?.message}"),
      );
    }
    var articles=snapshot.data?.articles;
    return ListView.builder(itemBuilder: (context, index) {
      return NewsItem(news: articles?[index]);
    },itemCount: articles?.length ?? 0,);

  },
),
    );
  }
}
