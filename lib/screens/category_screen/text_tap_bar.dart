import 'package:flutter/material.dart';

import '../../model/source_response.dart';


class TextTabBar extends StatelessWidget{
  Source source;
  bool isSelected;
  TextTabBar({
    required this.source,
    required this.isSelected
});
  @override
  Widget build(BuildContext context) {
    return Text(source.name??"",
    style: isSelected? Theme.of(context).textTheme.displaySmall
        : Theme.of(context).textTheme.displayMedium
    );
  }

}