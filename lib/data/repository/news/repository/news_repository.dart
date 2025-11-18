import '../../../../model/news_response.dart';

abstract class NewsRepository{
  Future<NewsResponse> getNewsBySource(String sourceId);
}