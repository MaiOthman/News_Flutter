import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/category_states.dart';
import 'package:news_app/cubit/category_view_model.dart';
import 'package:news_app/di/di.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/providers/lang_provider.dart';
import 'package:news_app/screens/category_screen/source_tap_bar.dart';
import 'package:news_app/widgets/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class CategoryDetailsScreen extends StatefulWidget{
  NewsCategory category;
  String searchText;
  CategoryDetailsScreen({required this.category, this.searchText = ''});
  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  CategoryViewModel viewModel = CategoryViewModel(sourcesRepository: injectSourceRepository());

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => viewModel,
      child: BlocBuilder<CategoryViewModel, CategoryStates>(builder:(context, state) {
        if(state is CategorySuccessState){
              var sourceLists = state.sourcesList;
                return sourceLists.isEmpty? Center(child: Text("No result found",
                    style: Theme.of(context).textTheme.titleSmall)):
                SourceTapBar(sources: sourceLists!, searchedText: widget.searchText,
                    myBottomSheet: (article)=> myBottomSheet(article));

        }
        else if(state is CategoryErrorState){
                return Column(
                  children: [
                    Text('Something went wrong!'),
                    ElevatedButton(onPressed: (){
                      viewModel.getSources(
                          widget.category.id
                      );
                      setState(() {

                      });
                    }, child: Text("try again"))
                  ],
                );

        }
        else{
          return Center(child: CircularProgressIndicator(color: Colors.grey));
        }

      })

      // FutureBuilder(future: ApiDioManager().getSources(
      //   widget.category.id,
      //   langProvider.appLang
      // ),
      //       builder: (context, snapshot){
      //     if(snapshot.connectionState == ConnectionState.waiting){
      //       return Center(child:
      //         CircularProgressIndicator(color: Colors.grey));
      //     } else if(snapshot.hasError){
      //       return Column(
      //         children: [
      //           Text('Something went wrong!'),
      //           ElevatedButton(onPressed: (){
      //             ApiDioManager().getSources(
      //                 widget.category.id, langProvider.appLang
      //             );
      //             setState(() {
      //
      //             });
      //           }, child: Text("try again"))
      //         ],
      //       );
      //     }
      //     if(snapshot.data?.status!='ok'){
      //       return Column(
      //         children: [
      //           Text('Something went wrong!'),
      //           ElevatedButton(onPressed: (){
      //             ApiDioManager().getSources(
      //                 widget.category.id, langProvider.appLang
      //             );
      //             setState(() {
      //
      //             });
      //
      //           }, child: Text("try again"))
      //         ],
      //       );
      //     }
      //
      //       var sourceLists = snapshot.data?.sources??[];
      //     var filteredList = sourceLists;
      //     if(widget.searchText.isNotEmpty && sourceLists.isNotEmpty){
      //        filteredList =[];
      //       for(int i = 0 ; i<sourceLists.length; i++){
      //         if(sourceLists[i].name!.toLowerCase().contains(widget.searchText.toLowerCase())){
      //           filteredList.add(sourceLists[i]);
      //         }
      //       }
      //     }
      //       return sourceLists.isEmpty? Center(child: Text("No result found",
      //           style: Theme.of(context).textTheme.titleSmall)):
      //       SourceTapBar(sources: sourceLists!,
      //           myBottomSheet: (article)=> myBottomSheet(article));
      //       }),
    );
  }

  myBottomSheet(Articles article) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context, builder: (context)=> BottomSheetDesign( article: article));
  }
}