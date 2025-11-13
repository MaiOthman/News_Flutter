import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
  NewsCategory newsCategory;
  int index;
   CategoryItem({super.key, required this.newsCategory, required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24)
      ),
      child: Stack(
        alignment: index%2 == 0 ? AlignmentDirectional.bottomEnd : AlignmentDirectional.bottomStart,
        children: [
          Image.asset(newsCategory.image),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width*0.02, vertical: height*0.02),
            padding: EdgeInsetsDirectional.only(start: index%2==0? width*0.02: 0,
            end:index%2!=0? width*0.02:0
            ),
            width: width*0.40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(84),color: AppColors.gray),
            child: Row(
              textDirection: index%2==0? TextDirection.ltr: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(AppLocalizations.of(context)!.view_all, style: Theme.of(context).textTheme.titleMedium,),
              CircleAvatar(radius: 25,
              backgroundColor: Theme.of(context).cardColor,
                child: index%2==0? Icon(Icons.arrow_forward_ios_outlined, color: Theme.of(context).canvasColor,):
                Icon(Icons.arrow_back_ios_outlined, color: Theme.of(context).canvasColor,)
                ,
              )
            ],),
          )
        ],
      ),
      
    );
  }
}
