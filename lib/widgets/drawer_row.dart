import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_style.dart';

class DrawerRow extends StatelessWidget {
  IconData icon;
  String text;
   DrawerRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.04),
      child: Row(
        spacing: width*0.02,
        children: [
        Icon(icon, color: AppColors.primaryDark),
        Text(text, style: AppStyle.bold20white,)
      ],),
    );
  }

}
