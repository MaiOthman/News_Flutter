// import 'dart:convert' show jsonEncode;
// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:dio/dio.dart' hide Headers;
// import 'package:dio/dio.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:news_app/api/end_points.dart';
// import 'package:news_app/api/model/news/news_response.dart';
// import 'package:retrofit/retrofit.dart';
//
// import '../api/model/source_response.dart';
// import '../model/source_response.dart';
//
//
// part 'retrofit_service.g.dart';
//
// @RestApi(baseUrl: 'https://newsapi.org')
// abstract class RestClient {
//   factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;
//
//   @GET(EndPoints.sources)
//   Future<SourceResponse> getSources(
//       @Query('apikey') String apiKey,
//       @Query('category') String categoryId,
//       );
//   @GET(EndPoints.news)
//   Future<NewsResponse> getNewsBySourceId(
//       @Query('apikey') String apiKey,
//       @Query('sources') String sourceId
//
//       );
//
// }
