import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/widgets/app_config_item_lang.dart';
import 'package:news_app/widgets/app_config_item_theme.dart';
import 'package:news_app/widgets/drawer_row.dart';

class HomeDrawer extends StatelessWidget {
  VoidCallback onHomeClick;
   HomeDrawer({super.key, required this.onHomeClick});

  @override
  Widget build(BuildContext context) {
    List<String> theme = [AppLocalizations.of(context)!.dark, AppLocalizations.of(context)!.light];
    List<String> lang = [AppLocalizations.of(context)!.en, AppLocalizations.of(context)!.ar];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      spacing: height*0.02,
      children: [
      Container(
        alignment: Alignment.center,
        width: double.infinity,
          height: height*0.20,
          color: AppColors.primaryDark,
          child: Text(AppLocalizations.of(context)!.news_app,style: Theme.of(context).textTheme.titleMedium,) ),
      InkWell(
          onTap: (){
            onHomeClick();
          },
          child: DrawerRow(icon: Icons.home_outlined, text: AppLocalizations.of(context)!.go_to_home)),
        Divider(thickness: 2, indent: width*0.04, endIndent: width*0.04,),
        DrawerRow(icon: Icons.imagesearch_roller_outlined, text: AppLocalizations.of(context)!.theme),
        AppConfigItemTheme(),
        Divider(thickness: 2, indent: width*0.04, endIndent: width*0.04,),
        DrawerRow(icon: Icons.language, text: AppLocalizations.of(context)!.language),
        AppConfigItemLang()

      ],);
  }
}
