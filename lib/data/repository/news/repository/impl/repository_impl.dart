import 'package:news_app/data/repository/news/data_sources/remote/remote_news_data_source.dart';
import 'package:news_app/model/news_response.dart';

import '../news_repository.dart';

class NewsRepositoryImplementation implements NewsRepository{
  RemoteNewsDataSource remoteNewsDataSource;
  NewsRepositoryImplementation({required this.remoteNewsDataSource});
  @override
  Future<NewsResponse> getNewsBySource(String sourceId) {
    // TODO: implement getNewsBySource
    return remoteNewsDataSource.getNewsBySource(sourceId);
  }

}