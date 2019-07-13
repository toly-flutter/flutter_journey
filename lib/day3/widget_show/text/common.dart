import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_journey/common/cons.dart';
import 'package:flutter_journey/common/utils.dart';

var container = Container(
  color: Color(0x6623ffff),
  width: 200,
  height: 200 * 0.618,
  child: text,
);

//
//var style = TextStyle(
//    color: Colors.red, //颜色
//    backgroundColor: Colors.white,//背景色
//    fontSize: 20,//字号
//    fontWeight: FontWeight.bold,//字粗
//    fontStyle: FontStyle.italic,//斜体
//    letterSpacing: 10,//字间距
//    fontFamily:"阿里惠普体"
//);

///修改字体
//var style = TextStyle(
//  color: Colors.red, //颜色
//  backgroundColor: Colors.white,//背景色
//  fontFamily:"阿里惠普体"
//);
//
//var text = Text("toly-张风捷特烈-1994`",style: style,);

var shadow = Shadow(
    color: Colors.black, //颜色
    blurRadius: 1, //虚化
    offset: Offset(2, 2) //偏移
    );

shadows() {
  var shadows = <Shadow>[];
  for (int i = 0; i < rainbow.length; i++) {
    shadows.add(Shadow(
        color: Color(rainbow[i]),
        blurRadius: i * 2.5,
        offset: Offset(-(1 + i) * 3.0, -(1 + i) * 3.0)));
  }

  return shadows;
}

var style = TextStyle(
  color: Colors.black,
  //颜色
  fontSize: 20,
  //字号
//    shadows: shadows()
  decoration: TextDecoration.lineThrough,
  //装饰线
  decorationColor: Color(0xffff0000),
  //装饰线颜色
  decorationThickness: 3, //装饰线粗，默认1.0
);

//var text = Text(
//  "张风捷特烈",
//  style: style,
//);

//var text =Text(
//  "张风捷特烈-toly-1994-9999999999999999",
//  strutStyle: StrutStyle(
//    fontFamily: '阿里惠普体',
//    fontSize: 24,
//    forceStrutHeight: true,
//  ),
//  style: TextStyle(
//    color: Colors.black, //颜色
//    fontSize: 24, //字号
//    fontFamily: "阿里惠普体"
//  ),
//);

//var text =Text(
//  "张风捷特烈-toly-1994-9999999999999999",
//  textScaleFactor: 5,
//  maxLines: 2,//最多2行
//  style: TextStyle(
//      color: Colors.black, //颜色
//      fontSize: 12, //字号
//
//  ),
//);

var span = TextSpan(
  text: r'$99',
  style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.lineThrough,
      decorationThickness: 1,
      decorationColor: Colors.red,
      fontSize: 40),
);

var text = Text.rich(
  span,
);

var decorations = [
  TextDecoration.none,
  TextDecoration.lineThrough,
  TextDecoration.overline,
  TextDecoration.underline
];

var textDecorationStyles = [
  TextDecorationStyle.double,
  TextDecorationStyle.dashed,
  TextDecorationStyle.dotted,
  TextDecorationStyle.solid,
  TextDecorationStyle.wavy
];

var textAligns = [
  TextAlign.start,
  TextAlign.center,
  TextAlign.end,
  TextAlign.left,
  TextAlign.right,
  TextAlign.justify
];

var textOverflows = [
  TextOverflow.clip,
  TextOverflow.ellipsis,
  TextOverflow.fade,
  TextOverflow.visible
];

//var show = MultiShower(
//  textOverflow,
//  (type) => Text(
//    "张风捷特烈-toly-1994-99999999999999999999",
//    overflow: type,
//    softWrap: false,
//    style: TextStyle(
//      color: Colors.black, //颜色
//      fontSize: 24, //字号
//    ),
//  ),
//  width: 150,
//  height: 150*0.618,
//);

richText00() {
  var span = TextSpan(
    text: 'Hello', // default text style
    children: <TextSpan>[
      TextSpan(
          text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
      TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
    ],
  );

  return Text.rich(
    span,
  );
}

richText01() {
  var spans = <TextSpan>[];
  rainbowMap.forEach((k, v) {
    spans.add(
      TextSpan(
          text: v + "   ", style: TextStyle(fontSize: 20.0, color: Color(k))),
    );
  });

  return Text.rich(TextSpan(
      text: '七彩字：\n',
      style: TextStyle(fontSize: 16.0, color: Colors.black),
      children: spans));
}

colorfulText(String str, {double fontSize = 14, int radius}) {
  var spans = <TextSpan>[];
  for (var i = 0; i < str.length; i++) {
    spans.add(
      TextSpan(
          text: str[i],
          style: TextStyle(fontSize: fontSize , color: randomRGB())),
    );
  }

  return Text.rich(TextSpan(children: spans));
}

var show = colorfulText(cc, fontSize: 50);
