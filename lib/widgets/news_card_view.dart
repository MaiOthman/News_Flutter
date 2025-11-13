import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_style.dart';

import '../api/model/news/article.dart';

class NewsCardView extends StatelessWidget {
  Articles article;
   NewsCardView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding:  EdgeInsets.symmetric(vertical: height*0.01, horizontal: width*0.02),
      //height: height*0.4,
      margin: EdgeInsets.symmetric(vertical: height*0.01, horizontal: width*0.04),
      decoration: BoxDecoration(border: Border.all(color: Theme.of(context).canvasColor)
      , borderRadius: BorderRadius.circular(16)
      ),
      child:
      Column(
        spacing: height*0.005,
        children: [
        Container(
          clipBehavior: Clip.antiAlias,
          //padding: EdgeInsets.symmetric(horizontal: width*0.01, vertical: height*0.01),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child:
            CachedNetworkImage(
              imageUrl: article.urlToImage??"",
              placeholder: (context, url) => Center(child: CircularProgressIndicator(
                color: AppColors.gray,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            //Image.network(article.urlToImage!, height: height*0.3, fit: BoxFit.fill,)
        ),
        Text(article.title??"", style: Theme.of(context).textTheme.displaySmall),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Expanded(child: Text("By: ${article.author}", style: AppStyle.med12gray,)),
          Text(GetTimeAgo.parse(DateTime.parse(article.publishedAt??"")), style: AppStyle.med12gray,)
        ],)
      ],)
      ,
    );
  }
}
