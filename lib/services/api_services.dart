import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_testing/models/api_responses.dart';

class ApiServices {
  final String url;
  ApiServices(this.url);

  Future<ResponsesLists> fetchData() async {
    Uri uri = Uri.parse(Uri.encodeFull(url));
    Response response = await get(uri);
    
    if (response.statusCode == 200) {
      return ResponsesLists.fromJson(jsonDecode(response.body));
      
    } else {
      print(response.statusCode);
      throw Exception("Something went wrong!!!");
    }
  }
}
