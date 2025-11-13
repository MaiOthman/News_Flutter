import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/providers/lang_provider.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_style.dart';
import 'package:provider/provider.dart';

class AppConfigItemLang extends StatefulWidget {


  @override
  State<AppConfigItemLang> createState() => _AppConfigItemState();
}

class _AppConfigItemState extends State<AppConfigItemLang> {
  @override
  Widget build(BuildContext context) {
    List<String> items= [AppLocalizations.of(context)!.en, AppLocalizations.of(context)!.ar];
    late String selectedItem;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var langProvider = Provider.of <LangProvider>(context);
    if(langProvider.appLang == 'en'){
      selectedItem = items.first;
    } else {
      selectedItem = items.last;
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.04),
      child: DropdownButtonFormField<String>(
        iconSize: width*0.1,
        iconEnabledColor: AppColors.primaryDark,
        decoration: InputDecoration(
          border: border(),
          enabledBorder: border(),
          focusedBorder: border()
        ),
        value: selectedItem,
   items: items.map((item)=> DropdownMenuItem<String>(
       value: item,
       child: Text(item, style: AppStyle.med20white,))).toList()
   , onChanged: (String? value) {
          setState(() {
            selectedItem = value??"";
            if(selectedItem == AppLocalizations.of(context)!.en){
              langProvider.changeLang('en');
            } else {
              langProvider.changeLang('ar');
            }
          });
      },),
    );

  }
  OutlineInputBorder border (){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.primaryDark, width: 2)
    );
  }
}
