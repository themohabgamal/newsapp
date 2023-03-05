import 'package:flutter/material.dart';
import 'package:news_app/API/apiManager.dart';
import 'package:news_app/theme.dart';
import 'package:news_app/ui/News/news_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../modules/NewsResponse.dart';
import '../Categories/category_tabs.dart';

class Search extends SearchDelegate{
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: myTheme.teal),// affects AppBar's background color
        textTheme: const TextTheme(
            headline6: TextStyle( // headline 6 affects the query text
                color: myTheme.mainColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
return [
 IconButton(onPressed: (){
   showResults(context);
 }, icon: Icon(Icons.search)),
];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.of(context).pop();
    }, icon: Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: FutureBuilder<NewsResponse>(
        future: apiManager.getNews(query: query),
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

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Center(
      child:Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Text(AppLocalizations.of(context)!.looking,style: Theme.of(context).textTheme.headline5,textAlign: TextAlign.center,)),);
  }
  
}