import 'package:news_app/api/api_manager.dart';
import 'package:news_app/data/repository/news/data_sources/remote/impl/remote_news_data_source_impl.dart';
import 'package:news_app/data/repository/news/data_sources/remote/remote_news_data_source.dart';
import 'package:news_app/data/repository/news/repository/impl/repository_impl.dart';
import 'package:news_app/data/repository/news/repository/news_repository.dart';
import 'package:news_app/data/repository/sources/data_source/remote/implemnetation/remote_sources_data_source_Impl.dart';
import 'package:news_app/data/repository/sources/data_source/remote/remote_sources_data_source.dart';
import 'package:news_app/data/repository/sources/repository/implementation/sources_impl.dart';
import 'package:news_app/data/repository/sources/repository/sources_repository.dart';

  NewsRepository injectNewsRepository(){
    return NewsRepositoryImplementation(remoteNewsDataSource: injectRemoteNewsDataSource());
  }
  RemoteNewsDataSource injectRemoteNewsDataSource(){
    return RemoteNewsDataSourceImpl(apiManager: injectApiManager());
  }
  ApiManager injectApiManager(){
    return ApiManager();
  }
  SourcesRepository injectSourceRepository(){
    return SourcesRepositoryImpl(remoteSourcesDataSource: injectRemoteSourceDataSource());
  }
  RemoteSourcesDataSource injectRemoteSourceDataSource(){
    return RemoteSourcesDataSourceImpl(apiManager: injectApiManager());
  }
