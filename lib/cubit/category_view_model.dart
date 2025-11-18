import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/cubit/category_states.dart';
import 'package:news_app/data/repository/sources/data_source/remote/implemnetation/remote_sources_data_source_Impl.dart';
import 'package:news_app/data/repository/sources/data_source/remote/remote_sources_data_source.dart';
import 'package:news_app/data/repository/sources/repository/implementation/sources_impl.dart';
import 'package:news_app/data/repository/sources/repository/sources_repository.dart';

class CategoryViewModel extends Cubit<CategoryStates>{
  SourcesRepository sourcesRepository;
  CategoryViewModel({required this.sourcesRepository}): super(CategoryLoadingState());
  void getSources(String categoryId) async {
    try{
      emit(CategoryLoadingState());
      var response = await sourcesRepository.getSources(categoryId: categoryId);
      if(response.status == 'error'){
        emit(CategoryErrorState(errorMessage: response.message!));
      }
      else if(response.status == 'ok'){
        emit(CategorySuccessState(sourcesList: response.sources!));
      }


    } catch(e){
      emit(CategoryErrorState(errorMessage: e.toString()));

    }

  }

}