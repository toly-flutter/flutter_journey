import 'dart:math';

import 'package:flutter/material.dart';
class SwapText extends StatefulWidget {

  SwapText({Key key,}):super(key:key);
  
  @override
  _SwapTextState createState() => _SwapTextState();
}

class _SwapTextState extends State<SwapText> {
  List<Widget> twoText = [
    ColorfulText(title: "Hello",color: Colors.red),
    ColorfulText(title: "World",color: Colors.blue),
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

class ColorfulText extends StatefulWidget {
  ColorfulText({Key key, this.title,this.color}) : super(key: key);
  final String title;
  final Color color;
  @override
  State<StatefulWidget> createState() => StateColorfulText();
}

class StateColorfulText extends State<ColorfulText> {
  Color color;

  @override
  void initState() {
    color=widget.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Text("  ${widget.title}  ",style: TextStyle(fontSize: 50,color: color),);

}
