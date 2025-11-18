import 'package:news_app/model/news_response.dart';

abstract class NewsStates{}
class NewsLoadingState extends NewsStates{}
class NewsSuccessState extends NewsStates{
   List<Articles> articleList;
  NewsSuccessState({required this.articleList});

}
class NewsErrorState extends NewsStates{
  String errorMessage;
  NewsErrorState({required this.errorMessage});
}