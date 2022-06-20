import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_testing/models/holidays_responses.dart';

class HolidayApiService{
  static const String _apiKey = "7b3d73cf-d179-4f7c-a385-bbc58973146e";
  // final String _url = "https://holidayapi.com/v1/holidays?pretty&key=$_apiKey&country=MM&year=2021";
  final String _url = "https://holidayapi.com/v1/holidays?pretty&key=7b3d73cf-d179-4f7c-a385-bbc58973146e&country=MM&year=2021";

  Future<HolidaysResponse> fetchData()async{
    Uri uri = Uri.parse(Uri.encodeFull(_url));
    Response response = await get(uri);
    if(response.statusCode == 200){
      return HolidaysResponse.fromJson(jsonDecode(response.body));
    }else{
      print(response.statusCode);
      throw Exception("Somethings went wrong!!!");
    }
  }
}