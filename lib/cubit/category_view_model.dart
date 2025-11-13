import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/cubit/category_states.dart';

class CategoryViewModel extends Cubit<CategoryStates>{
  CategoryViewModel(): super(CategoryLoadingState());
  void getSources(String categoryId) async {
    try{
      emit(CategoryLoadingState());
      var response = await ApiManager.getSources(categoryId);
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