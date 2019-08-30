import 'dart:math';

import 'package:flutter/material.dart';

class SwapText extends StatefulWidget {
  SwapText({
    Key key,
  }) : super(key: key);

  @override
  _SwapTextState createState() => _SwapTextState();
}

class _SwapTextState extends State<SwapText> {
  List<Widget> twoText = [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ColorfulText(
        title: "Hello",
        color: Colors.red,
        key: UniqueKey(),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ColorfulText(title: "World", color: Colors.blue, key: UniqueKey()),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var items =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: twoText);
    return InkWell(
      onTap: swapTiles,
      child: items,
    );
  }

  void swapTiles() {
    setState(() {
      twoText.insert(1, twoText.removeAt(0));
    });
  }
}

class ColorfulText extends StatefulWidget {
  ColorfulText({Key key, this.title, this.color}) : super(key: key);
  final String title;
  final Color color;

  @override
  State<StatefulWidget> createState() => StateColorfulText();
}

class StateColorfulText extends State<ColorfulText> {
  Color color;

  @override
  void initState() {
    color = randomColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Text(
        "  ${widget.title}  ",
        style: TextStyle(fontSize: 50, color: color),
      );
}

///
/// 用来返回一个随机色
///
Color randomColor({
  int offsetA = 120,
  int offsetR = 0,
  int offsetG = 0,
  int offsetB = 0,
}) {
  var random = Random();
  var a = offsetA + random.nextInt(256 - offsetA); //透明度值
  var r = offsetR + random.nextInt(256 - offsetR); //红值
  var g = offsetG + random.nextInt(256 - offsetG); //绿值
  var b = offsetB + random.nextInt(256 - offsetB); //蓝值
  return Color.fromARGB(a, r, g, b); //生成argb模式的颜色
}
