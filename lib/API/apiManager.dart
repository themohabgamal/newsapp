import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/modules/NewsResponse.dart';

import '../modules/SourcesResponse.dart';
class apiManager{
  static const String baseline='newsapi.org';
  static const String apiKey='cfda9286e53947efa19eb72d3338583f';
// https://newsapi.org/v2/top-headlines/sources?apiKey=cfda9286e53947efa19eb72d3338583f&category=sports
static Future<SourcesResponse>getSources(String categoryId) async{
  var url=Uri.https(baseline,'/v2/top-headlines/sources',{
    'apiKey':apiKey,
    'category':categoryId
  }
  );
  var response=await http.get(url);
  var responseBody=response.body;
  var json=jsonDecode(responseBody);
  return SourcesResponse.fromJson(json);
}
static Future<NewsResponse> getNews({String? sourceId,String? query}) async{
  //https://newsapi.org/v2/everything?apiKey=cfda9286e53947efa19eb72d3338583f&sources=abc-news
  var url=Uri.https(baseline,'/v2/everything',{
    'apiKey':apiKey,
    'sources': sourceId,
    'q':query,
  }
  );
  var response= await http.get(url);
  return NewsResponse.fromJson(jsonDecode(response.body));
}
}