import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Provider/SettingsProvider.dart';
import 'package:news_app/theme.dart';
import 'package:news_app/ui/News/news_details.dart';
import 'package:provider/provider.dart';

import '../../modules/Articles.dart';

class NewsItem extends StatelessWidget {
  Articles? news;

  NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {
    var sp=Provider.of<SettingsProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(NewsDetails.routeName, arguments: news);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: news?.urlToImage ?? 'https://via.placeholder.com/600x400/000000/ffffff?text=No+image+for+this+article',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${news?.author ?? ''}',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle2
                )),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${news?.title ?? ''}',
                  style: Theme.of(context).textTheme.headline6,
                )),
            SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text('${news?.publishedAt ?? ''}',
                  style: TextStyle(
                      color:myTheme.teal),
                  textAlign: TextAlign.end),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
