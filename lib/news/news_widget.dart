import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/api_dio_manager.dart';
import 'package:news_app/api/retrofit_service.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/providers/lang_provider.dart';
import 'package:news_app/widgets/news_card_view.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../api/model/source.dart';
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

  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<LangProvider>(context);
    return FutureBuilder(future: ApiDioManager().getNewsBySource(widget.source.id??'',
        langProvider.appLang, widget.searchedText

    ),
        builder: (context, snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(
          color: AppColors.gray,
        ),);
      }
      else if(snapshot.hasError){
        return Column(children: [
          Text("Something went Wrong!", style: Theme.of(context).textTheme.titleSmall,),
          ElevatedButton(onPressed: (){
            ApiDioManager().getNewsBySource(widget.source.id??'', langProvider.appLang,
            widget.searchedText
            );
            setState(() {

            });
          }, child: Text("Try again!",style: Theme.of(context).textTheme.titleSmall,) )
        ],);
      }
      if(snapshot.data?.status != 'ok'){
        return Column(children: [
          Text("Something went Wrong!", style: Theme.of(context).textTheme.titleSmall,),
          ElevatedButton(onPressed: (){
           ApiDioManager().getNewsBySource(widget.source.id??'', langProvider.appLang, widget.searchedText);
            setState(() {

            });
          }, child: Text("Try again!",style: Theme.of(context).textTheme.titleSmall,) )
        ],);
      }
      var newsList = snapshot.data?.articles??[];
      return (newsList.isEmpty)? Center(child: Text("No result found",
          style: Theme.of(context).textTheme.titleSmall),
      ):ListView.builder(itemBuilder: (context,index){
        return InkWell(
            onTap:(){widget.myBottomSheet(newsList[index]);},
            child: NewsCardView(article: newsList[index],));
      }, itemCount: newsList.length,);


        });
  }
}
