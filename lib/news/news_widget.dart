import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_state.dart';
import 'package:news_app/cubit/news_view_model.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/widgets/news_card_view.dart';
import 'package:news_app/utils/app_colors.dart';

import '../di/di.dart';
import '../model/source_response.dart';
typedef MyBottomSheet = Function(Articles article);
class NewsWidget extends StatefulWidget {
  Source source;
  NewsCategory? category;
  MyBottomSheet myBottomSheet;
  String searchedText;
   NewsWidget({super.key, required this.source, this.category,
     required this.myBottomSheet, required this.searchedText});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel newsViewModel = NewsViewModel(newsRepository: injectNewsRepository());

  @override
  void initState(){
    newsViewModel.getNewsBySourceId(widget.source.id??"");
  }
  @override
  void didUpdateWidget(covariant NewsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      newsViewModel.getNewsBySourceId(widget.source.id??"");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> newsViewModel,
      child: BlocBuilder<NewsViewModel, NewsStates>(builder: (context, state) {
        if(state is NewsSuccessState){
          return (state.articleList.isEmpty)? Center(child: Text("No result found",
                    style: Theme.of(context).textTheme.titleSmall),
                ):ListView.builder(itemBuilder: (context,index){
                  return InkWell(
                      onTap:(){widget.myBottomSheet(state.articleList[index]);},
                      child: NewsCardView(article: state.articleList[index],));
                }, itemCount: state.articleList.length,);
        }
        else if( state is NewsErrorState){
              return Column(children: [
                Text(state.errorMessage, style: Theme.of(context).textTheme.titleSmall,),
                ElevatedButton(onPressed: (){
                  setState(() {
                    newsViewModel.getNewsBySourceId(widget.source.id??'');
                  });
                }, child: Text("Try again!",style: Theme.of(context).textTheme.titleSmall,) )
              ],);
            }

        else {
          return Center(child: CircularProgressIndicator(
                    color: AppColors.gray,),);
        }
      },


      ),
    );


    //   FutureBuilder(future: ApiDioManager().getNewsBySource(widget.source.id??'',
    //     langProvider.appLang, widget.searchedText
    //
    // ),
    //     builder: (context, snapshot){
    //   if(snapshot.connectionState == ConnectionState.waiting){
    //     return Center(child: CircularProgressIndicator(
    //       color: AppColors.gray,
    //     ),);
    //   }
    //   else if(snapshot.hasError){
    //     return Column(children: [
    //       Text("Something went Wrong!", style: Theme.of(context).textTheme.titleSmall,),
    //       ElevatedButton(onPressed: (){
    //         ApiDioManager().getNewsBySource(widget.source.id??'', langProvider.appLang,
    //         widget.searchedText
    //         );
    //         setState(() {
    //
    //         });
    //       }, child: Text("Try again!",style: Theme.of(context).textTheme.titleSmall,) )
    //     ],);
    //   }
    //   if(snapshot.data?.status != 'ok'){
    //     return Column(children: [
    //       Text("Something went Wrong!", style: Theme.of(context).textTheme.titleSmall,),
    //       ElevatedButton(onPressed: (){
    //        ApiDioManager().getNewsBySource(widget.source.id??'', langProvider.appLang, widget.searchedText);
    //         setState(() {
    //
    //         });
    //       }, child: Text("Try again!",style: Theme.of(context).textTheme.titleSmall,) )
    //     ],);
    //   }
    //   var newsList = snapshot.data?.articles??[];
    //   return (newsList.isEmpty)? Center(child: Text("No result found",
    //       style: Theme.of(context).textTheme.titleSmall),
    //   ):ListView.builder(itemBuilder: (context,index){
    //     return InkWell(
    //         onTap:(){widget.myBottomSheet(newsList[index]);},
    //         child: NewsCardView(article: newsList[index],));
    //   }, itemCount: newsList.length,);
    //
    //
    //     });
  }
}
