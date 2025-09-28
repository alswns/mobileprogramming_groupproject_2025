import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget{// 검색창 위젯
  final String text;
  SearchWidget({super.key, required this.text});

  State <SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget>{

  @override
  Widget build(BuildContext context){
    return Container(
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(10),
       border: Border.all(
         color: Theme.of(context).primaryColor
       ),
     ),
     child: TextField(
       decoration: InputDecoration(
         hintText: widget.text,
         prefixIcon: Icon(Icons.search), // 검색 아이콘
         border: InputBorder.none,
         contentPadding: EdgeInsets.all(16.0),
       ),
       onChanged: (value) {
        // 여기 나중에 구현...
       },
     ),

    );
  }
}