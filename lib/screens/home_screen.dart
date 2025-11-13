import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_app/drawer/home_drawer.dart';
import 'package:news_app/fragments/category_fragment.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/providers/lang_provider.dart';
import 'package:news_app/screens/category_screen/category_details_screen.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../api/api_dio_manager.dart';
import '../l10n/app_localizations.dart';
import '../model/news_response.dart';

class HomeScreen extends StatefulWidget {
  String searchText = '';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    var langProvider = Provider.of<LangProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // var sourceList = ApiDioManager().getSources(
    //     category!.id,
    //     langProvider.appLang
    // );
    // var filteredList = sourceList;
    // for(int i = 0; i < filteredList.le)
    return Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //leading: InkWell(child: Icon(Icons.menu, color: Theme.of(context).canvasColor,)),
          title: category == null? Text(AppLocalizations.of(context)!.home, style:
          Theme.of(context).textTheme.titleSmall,): Text(category?.name??"", style:
          Theme.of(context).textTheme.titleSmall,),
          centerTitle: true,
          actions: [
            category == null? SizedBox(): AnimSearchBar(
            onSubmitted: (text){
              setState(() {
                widget.searchText = text;
              });

                },
            width: 400,
            textController: textController,
            suffixIcon: Icon(Icons.search, color: Theme.of(context).canvasColor),
            onSuffixTap: () {
             setState(() {
               textController.clear();
               widget.searchText = '';
             });}
                      //   InkWell(child: Icon(Icons.search,color: Theme.of(context).canvasColor,),
                      // onTap: (){
                      //   isSearch = true;
                      // },
                      // )
              )],
        ),
        drawer: Drawer(
          backgroundColor: AppColors.primaryLight,
          child: HomeDrawer(onHomeClick: onHomeClick),),
        body: category == null? CategoryFragment(categoryCallBack: onCategoryCLick):
            CategoryDetailsScreen(category: category!!, searchText: widget.searchText)
    );
  }

  NewsCategory? category;

   onCategoryCLick(NewsCategory selectedCategory){
    setState(() {
      category = selectedCategory;
      widget.searchText = '';
    });
  }
  onHomeClick(){
     setState(() {
       category = null;
       Navigator.of(context).pop();
     });
  }
  // onSearchClick(List<Articles> list, String searchedText){
  //    var filteredList;
  //    for(int i = 0 ; i < list.length ; i++){
  //      if(list[i]!=null){
  //        if(list[i].title!.toLowerCase().contains(searchedText)){
  //          filteredList.add(list[i]);
  //        }
  //      }
  //    }
  //    return filteredList;
  // }


  // searchByCategory(String text) {
  //    List<NewsCategory> categories= NewsCategory.newsCategory(false);
  //    for(int i = 0; i < categories.length; i++){
  //      if(categories[i].id.contains(text)){
  //
  //      }
  //    }
  // }
}
