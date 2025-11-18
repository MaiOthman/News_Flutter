import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/news/news_widget.dart';
import 'package:news_app/screens/category_screen/text_tap_bar.dart';

import '../../model/source_response.dart';



class SourceTapBar extends StatefulWidget {
  List<Source> sources;
  MyBottomSheet myBottomSheet;
  String searchedText;

   SourceTapBar({required this.sources, required this.myBottomSheet, required this.searchedText});

  @override
  State<SourceTapBar> createState() => _SourceTapBarState();
}

class _SourceTapBarState extends State<SourceTapBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: widget.sources.length, child:
    Column(
      children: [
        TabBar(
          dividerColor: Colors.transparent,
          indicatorColor: Theme.of(context).canvasColor,
          tabAlignment: TabAlignment.start,
            isScrollable: true,
            onTap: (index)
            {
            setState(() {
              selectedIndex = index;
            });
            },
            tabs: widget.sources.map((source){
          return TextTabBar(source: source, isSelected: (selectedIndex == widget.sources.indexOf(source)));
        }).toList()),
        Expanded(child: NewsWidget(
          //  key: ValueKey(widget.sources[selectedIndex].id),
            source: widget.sources[selectedIndex],
            category: null,
            searchedText: widget.searchedText,
            myBottomSheet: (article) => widget.myBottomSheet(article)))
      ],
    )
    );
  }
}
