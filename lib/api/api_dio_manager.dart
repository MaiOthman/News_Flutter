
import 'package:dio/dio.dart';
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiDioManager {
   Dio dio = Dio(
    BaseOptions(baseUrl: "https://newsapi.org",
    queryParameters: {'apiKey': ApiConstants.api_key}
    )
  );
  ApiDioManager(){
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
    )
    );
  }
   Future<SourceResponse> getSources(String categoryId, String lang) async {
    try{
      var response = await dio.get(EndPoints.sources, queryParameters:
      {
        'category': categoryId,
        'language': lang
      });
      var json = response.data;
      return SourceResponse.fromJson(json);
    } catch(e){
      rethrow;
    }
  }
   Future<NewsResponse> getNewsBySource(String sourceId, String lang,
       String titleSearch
       ) async{
    try{
      print('Searching for: $titleSearch with source: $sourceId');
      var response = await dio.get(EndPoints.news,
      queryParameters: {
        'sources': sourceId,
      'language': lang,
        'q': titleSearch,
        'searchIn': 'title,description,content'
      });
      var json = response.data;
      return NewsResponse.fromJson(json);
    }
        catch(e){
      rethrow;

        }

  }

}