import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/widgets/category_item.dart';
typedef onCategoryItemClick = void Function(NewsCategory);
class CategoryFragment extends StatelessWidget {
  onCategoryItemClick categoryCallBack ;
   CategoryFragment({super.key, required this.categoryCallBack});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<NewsCategory> categoriesList= NewsCategory.newsCategory(false);

    return Padding(padding:
    EdgeInsets.symmetric(horizontal: width*0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
          AppLocalizations.of(context)!.good_morning,
          style: Theme.of(context).textTheme.titleMedium,),
        Expanded(child: ListView.separated(
            padding: EdgeInsets.only(top: height*0.02),
            itemBuilder: (context,index)=> InkWell(
              onTap: (){
                categoryCallBack(categoriesList[index]);
              },
                child: CategoryItem(newsCategory: categoriesList[index], index: index,)),
            separatorBuilder: (context,index)=> SizedBox(height: height*0.02,),
            itemCount: 7))
      ],),
    );
  }
}
