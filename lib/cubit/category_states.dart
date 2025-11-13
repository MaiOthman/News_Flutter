import 'package:news_app/model/source_response.dart';

abstract class CategoryStates{}
class CategoryLoadingState extends CategoryStates{}
class CategorySuccessState extends CategoryStates{
  List<Source> sourcesList;
  CategorySuccessState({required this.sourcesList});

}
class CategoryErrorState extends CategoryStates{
  String errorMessage;
  CategoryErrorState({required this.errorMessage});
}