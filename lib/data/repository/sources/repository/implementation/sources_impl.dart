import 'package:news_app/api/api_manager.dart';
import 'package:news_app/data/repository/sources/data_source/remote/remote_sources_data_source.dart';
import 'package:news_app/data/repository/sources/repository/sources_repository.dart';
import 'package:news_app/model/source_response.dart';

class SourcesRepositoryImpl implements SourcesRepository{
  RemoteSourcesDataSource remoteSourcesDataSource;
  SourcesRepositoryImpl({required this.remoteSourcesDataSource});
  @override
  Future<SourceResponse> getSources({required String categoryId}) {
    return remoteSourcesDataSource.getSources(categoryId: categoryId);

  }

}