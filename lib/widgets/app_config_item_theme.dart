import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_style.dart';
import 'package:provider/provider.dart';

class AppConfigItemTheme extends StatefulWidget {
  List<String> items= ['light', 'dark'];
  late String selectedItem;

  @override
  State<AppConfigItemTheme> createState() => _AppConfigItemThemeState();
}

class _AppConfigItemThemeState extends State<AppConfigItemTheme> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of <ThemeProvider>(context);
    if(themeProvider.appTheme == ThemeMode.light){
      widget.selectedItem = widget.items.first;
    } else {
      widget.selectedItem = widget.items.last;
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
        value: widget.selectedItem,
   items: widget.items.map((item)=> DropdownMenuItem<String>(
       value: item,
       child: Text(item, style: AppStyle.med20white,))).toList()
   , onChanged: (String? value) {
          setState(() {
            widget.selectedItem = value??"";
            if( widget.selectedItem == 'light'){
              themeProvider.changeTheme(ThemeMode.light);
            } else {
              themeProvider.changeTheme(ThemeMode.dark);
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
