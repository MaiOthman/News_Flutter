import '../../../../../model/source_response.dart';

abstract class RemoteSourcesDataSource{
  Future <SourceResponse> getSources({required String categoryId});

}