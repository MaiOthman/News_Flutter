import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/news_response.dart';

import '../model/source_response.dart';

class ApiManager{
   Future<SourceResponse> getSources(String categoryId) async {
    Uri url = Uri.https(
      ApiConstants.server,
      EndPoints.sources,
      {
        'apiKey': ApiConstants.api_key,
        'category': categoryId

      }
    );
    try{
      var response = await http.get(url);
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch(e){
      rethrow;
    }
  }
   Future<NewsResponse> getNewsBySource(String sourceId) async{
    Uri url = Uri.https(ApiConstants.server,
      EndPoints.news,
      {
        'apiKey': ApiConstants.api_key,
        'sources': sourceId,
      }
    );
    try{
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    }
    catch(e){
      rethrow;
    }
  }
}