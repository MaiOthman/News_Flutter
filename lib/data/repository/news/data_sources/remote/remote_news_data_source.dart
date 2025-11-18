import '../../../../../model/news_response.dart';

abstract class RemoteNewsDataSource{
  Future<NewsResponse> getNewsBySource(String sourceId);

}