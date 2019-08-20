import 'dart:math';

import 'package:flutter/material.dart';
class SwapText extends StatefulWidget {

  SwapText({Key key,}):super(key:key);
  
  @override
  _SwapTextState createState() => _SwapTextState();
}

class _SwapTextState extends State<SwapText> {

  List<Widget> twoText = [
    Text("  Hello  ",style: TextStyle(fontSize: 50,color: Colors.red),),
    Text("  World  ",style: TextStyle(fontSize: 50,color: Colors.blue)),
  ];
  @override
  Widget build(BuildContext context) {
    var items= Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: twoText);
    return InkWell(onTap: swapTiles,child: items,);
  }

  void swapTiles() {
    setState(() {
      twoText.insert(1, twoText.removeAt(0));
    });
  }
}
