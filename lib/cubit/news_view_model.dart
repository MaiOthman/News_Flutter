import 'package:bloc/bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/cubit/news_state.dart';
import 'package:news_app/data/repository/news/data_sources/remote/impl/remote_news_data_source_impl.dart';
import 'package:news_app/data/repository/news/data_sources/remote/remote_news_data_source.dart';
import 'package:news_app/data/repository/news/repository/impl/repository_impl.dart';
import 'package:news_app/data/repository/news/repository/news_repository.dart';

class NewsViewModel extends Cubit<NewsStates>{
  late NewsRepository newsRepository;
  NewsViewModel({required this.newsRepository}):super(NewsLoadingState());
  void getNewsBySourceId(String sourceId) async{
    try{
      emit(NewsLoadingState());
      var response =  await newsRepository.getNewsBySource(sourceId);
      if(response.status == 'error'){
        emit(NewsErrorState(errorMessage: response.message!));
      } else {
        emit(NewsSuccessState(articleList: response.articles!));
      }
    } catch(e){
      emit(NewsErrorState(errorMessage: e.toString()));

    }
  }
}