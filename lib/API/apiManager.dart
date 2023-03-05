import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/modules/NewsResponse.dart';

import '../modules/SourcesResponse.dart';
class apiManager{
  static const String baseline='newsapi.org';
  static const String apiKey='35a5753419f74c308f595bf8a957f8c5';
// https://newsapi.org/v2/top-headlines/sources?apiKey=cfda9286e53947efa19eb72d3338583f&category=sports
static Future<SourcesResponse>getSources(String categoryId,String language) async{
  var url=Uri.https(baseline,'/v2/top-headlines/sources',{
    'apiKey':apiKey,
    'category':categoryId,
    'language':language
  }
  );
  var response=await http.get(url);
  var responseBody=response.body;
  var json=jsonDecode(responseBody);
  return SourcesResponse.fromJson(json);
}
static Future<NewsResponse> getNews({String? sourceId,String? query,String? language}) async{
  //https://newsapi.org/v2/everything?apiKey=cfda9286e53947efa19eb72d3338583f&sources=abc-news
  var url=Uri.https(baseline,'/v2/everything',{
    'apiKey':apiKey,
    'sources': sourceId,
    'q':query,
    'language':language
  }
  );
  var response= await http.get(url);
  return NewsResponse.fromJson(jsonDecode(response.body));
}
}