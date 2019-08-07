import 'dart:math';

import 'package:flutter/material.dart';

showRichText() {
  var span = TextSpan(
    text: 'Hello',
    style: TextStyle(color: Colors.black),
    children: <TextSpan>[
      TextSpan(
          text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
      TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
    ],
  );

  var richText = RichText(text: span);

  return richText;
}

rainbowText() {
  const rainbowMap = {
    0xffff0000: "红色",
    0xffFF7F00: "橙色",
    0xffFFFF00: "黄色",
    0xff00FF00: "绿色",
    0xff00FFFF: "青色",
    0xff0000FF: "蓝色",
    0xff8B00FF: "紫色",
  };

  var spans = rainbowMap.keys.map((e) {
    //遍历，生成TextSpan列表
    return TextSpan(
        text: "${rainbowMap[e]}     ",
        style: TextStyle(fontSize: 20.0, color: Color(e)));
  }).toList();

  var show = RichText(
      text: TextSpan(
          text: '七彩字：\n',
          style: TextStyle(fontSize: 16.0, color: Colors.black),
          children: spans));

  return show;
}

welcomeText() {
  var span = TextSpan(
    text: 'hello ',
    style: TextStyle(color: Colors.black,fontSize: 18),
    children: <InlineSpan>[
      WidgetSpan(//使用WidgetSpan添加一个组件
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.ideographic,
          child: Icon(Icons.face,color: Colors.amber,)),
      TextSpan(
        text: ' , welcome to ',
        style: TextStyle(color: Colors.blue,fontSize: 18),
      ),
      WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.ideographic,
          child: FlutterLogo()),
      TextSpan(
        text: ' .',
      ),
    ],
  );

  var show = RichText(text: span);

  return show;
}

colorfulText(String str, {double fontSize = 14}) {
  var spans = <TextSpan>[];
  for (var i = 0; i < str.length; i++) {
    spans.add(
      TextSpan(
          text: str[i],
          style: TextStyle(fontSize: fontSize, color: randomColor())),
    );
  }
  return RichText(text: TextSpan(children: spans));
}

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

var cc = "燕子去了，有再来的时候；杨柳枯了，有再青的时候；桃花谢了，有再开的时候。"
    "但是，聪明的，你告诉我，我们的日子为什么一去不复返呢？——是有人偷了他 们罢："
    "那是谁？又藏在何处呢？是他们自己逃走了罢——如今又到了哪里呢？";

var show = welcomeText();
