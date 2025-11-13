import 'package:flutter/widgets.dart';

class LangProvider extends ChangeNotifier{
  String appLang = 'en';
  void changeLang(String newLang){
    if(appLang == newLang) {
      return;
    } else{
      appLang = newLang;
      notifyListeners();
    }
  }
}