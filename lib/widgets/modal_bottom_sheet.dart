import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_routes.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utils/app_colors.dart';

class BottomSheetDesign extends StatelessWidget {
  Articles article;
   BottomSheetDesign({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.02),
      padding: EdgeInsets.symmetric(horizontal: width*0.02, vertical: height*0.01),
      height: height*0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(16)
      ), child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: height*0.009,
      children: [
      Container(
        clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
    color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(16)
    ),
        child: CachedNetworkImage(
          height: height*0.3,
            fit: BoxFit.fill,
            imageUrl: article.urlToImage??"",
            placeholder: (context, url) => Center(child: CircularProgressIndicator(
            color: AppColors.gray,
        )
            )
        ),
      ),
      Text(article.content??"", style: Theme.of(context).textTheme.titleLarge),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: height*0.02),
          backgroundColor: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
          onPressed: (){
          Navigator.of(context).pushNamed(AppRoutes.fullView, arguments: article);

      }, child: Text(
        "View Full Article", style: Theme.of(context).textTheme.displaySmall,))
    ],),
    );
  }
}
