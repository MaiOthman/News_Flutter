import 'package:news_app/api/api_manager.dart';
import 'package:news_app/data/repository/news/data_sources/remote/remote_news_data_source.dart';
import 'package:news_app/model/news_response.dart';

class RemoteNewsDataSourceImpl extends RemoteNewsDataSource{
  ApiManager apiManager;
  RemoteNewsDataSourceImpl({required this.apiManager});
  @override
  Future<NewsResponse> getNewsBySource(String sourceId) {
    // TODO: implement getNewsBySource
    return apiManager.getNewsBySource(sourceId);
  }


}