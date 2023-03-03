import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/Articles.dart';
import 'package:news_app/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'NewsDetails';
  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: myTheme.mainColor,
        centerTitle: true,
        title: Text(
          news.title!,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: news?.urlToImage ??
                    'https://via.placeholder.com/600x400/000000/ffffff?text=No+image+for+this+article',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${news?.author ?? ''}',
                  textAlign: TextAlign.left,
                )),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${news?.title ?? ''}',
                  style: Theme.of(context).textTheme.headline6,
                )),
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text('${news?.publishedAt ?? ''}',
                  style: const TextStyle(
                      color: Color.fromRGBO(49, 46, 46, 0.8666666666666667)),
                  textAlign: TextAlign.end),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                '${news.content}',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                openUrl(news.url!);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'View Full Article',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Icon(
                    Icons.arrow_right,
                    size: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openUrl(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    }
  }
}
