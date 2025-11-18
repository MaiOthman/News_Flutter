import 'package:news_app/data/repository/sources/data_source/remote/remote_sources_data_source.dart';
import 'package:news_app/data/repository/sources/repository/sources_repository.dart';
import 'package:news_app/model/source_response.dart';

import '../../../../../../api/api_manager.dart';

class RemoteSourcesDataSourceImpl implements RemoteSourcesDataSource{
  ApiManager apiManager;
  RemoteSourcesDataSourceImpl({required this.apiManager});
  @override
  Future<SourceResponse> getSources({required String categoryId}) {
    // TODO: implement getSources
    return apiManager.getSources(categoryId);

  }

}