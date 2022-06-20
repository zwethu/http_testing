import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_testing/models/news_response.dart';

class NewsApiServices{
 static const String _apiKey = "127eda8cc5c148b2a7392a2504e0d56e";
  final String _url = "https://newsapi.org/v2/everything?q=tesla&from=2022-05-18&sortBy=publishedAt&apiKey=127eda8cc5c148b2a7392a2504e0d56e";

  Future fetchData()async{
    Uri uri = Uri.parse(Uri.encodeFull(_url));
    Response response = await get(uri);
    if(response.statusCode == 200){
      print(response.body);
      return NewsResponse.fromJson(jsonDecode(response.body));
    }
    else if(response.statusCode == 426){
      throw Exception(['Change URL']);
    }
      else{
      print(response.statusCode);
      throw Exception(response.statusCode);
    }
  }
}