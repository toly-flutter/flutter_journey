import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../stateless_widget/rich_text.dart';
import '../toly_widget/chart_widget.dart';

loadImage() {
  var show = Image(
    image: AssetImage("images/icon_head.jpg"),
    width: 50,
    height: 50,
  );

  return show;
}

loadByAsset() {
  var show = Image.asset(
    "images/icon_head.png",
    width: 50,
    height: 50,
  );
  return show;
}

loadByNet() {
  var imgUrl = "https://user-gold-cdn.xitu.io/2019/7/24/16c225e78234ec26?"
      "imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1";
  var show = Image.network(
    imgUrl,
    width: 200,
  );
  return show;
}

loadByFile() {
  var imgPath = "/data/user/0/com.toly1994.flutter_journey/cache/timg.jpeg";
  var show = Image.file(
    File(imgPath),
    width: 200,
  );

  return show;
}

loadByMemory() {
  var imgPath = "/data/user/0/com.toly1994.flutter_journey/cache/timg.jpeg";
  var bytes = File(imgPath).readAsBytesSync();
  var show = Image.memory(bytes);
  return show;
}

size() {
  var img = Image.asset(
    'images/ls.jpg',
    width: 100,
    height: 100,
  );

  var imgContainer = Container(
    width: 200,
    height: 200,
    color: Colors.cyanAccent,
    child: img,
  );
  return imgContainer;
}

imageColorMode() {
  var colorBlendMode = [
    //混合模式数组
    BlendMode.clear, BlendMode.src, BlendMode.dst,
    BlendMode.srcOver, BlendMode.dstOver, BlendMode.srcIn,
    BlendMode.dstIn, BlendMode.srcOut, BlendMode.dstOut,
    BlendMode.srcATop, BlendMode.dstATop, BlendMode.xor,
    BlendMode.plus, BlendMode.modulate, BlendMode.screen,
    BlendMode.overlay, BlendMode.darken, BlendMode.lighten,
    BlendMode.colorDodge, BlendMode.colorBurn, BlendMode.hardLight,
    BlendMode.softLight, BlendMode.difference, BlendMode.exclusion,
    BlendMode.multiply, BlendMode.hue, BlendMode.saturation,
    BlendMode.color, BlendMode.luminosity,
  ];

  var imgLi = colorBlendMode.map((mode) {
    return Column(children: <Widget>[
      Container(
          margin: EdgeInsets.all(5),
          width: 60,
          height: 60,
          child: Image(
            image: AssetImage("images/icon_head.png"),
            color: Colors.blue,
            colorBlendMode: mode,
          )),
      Text(mode.toString().split(".")[1])
    ]);
  }).toList();

  var imageColorMode = Wrap(
    children: imgLi,
  );
  return imageColorMode;
}

imageAlignment() {
  var alignment = [
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topCenter,
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment(0.01, 0.01),
    Alignment(0.5, 0.5)
  ];

  var imgLi = alignment.map((alignment) {
    return Column(children: <Widget>[
      Container(
          margin: EdgeInsets.all(5),
          width: 150,
          height: 60,
          color: randomColor(),
          child: Image(
            image: AssetImage("images/wy_300x200_little.jpg"),
            alignment: alignment,
          )),
      Text(alignment.toString())
    ]);
  }).toList();

  var imageColorMode = Wrap(
    children: imgLi,
  );
  return imageColorMode;
}

imageRepeat() {
  var repeat = [
    ImageRepeat.repeatY,
    ImageRepeat.repeatX,
    ImageRepeat.noRepeat,
    ImageRepeat.repeat
  ];

  var imgLi = repeat.map((repeat) {
    return Column(children: <Widget>[
      Container(
          margin: EdgeInsets.all(5),
          width: 150,
          height: 60,
          color: randomColor(),
          child: Image(
            image: AssetImage("images/wy_300x200_little.jpg"),
            repeat: repeat,
          )),
      Text(repeat.toString())
    ]);
  }).toList();

  var imageColorMode = Wrap(
    children: imgLi,
  );
  return imageColorMode;
}

test() {
  var img = Image.asset(
    "images/right_chat.png",
    centerSlice: Rect.fromLTRB(18, 32, 65, 36),
    fit: BoxFit.fill,
  );

  var show = Padding(
    padding: EdgeInsets.all(30),
    child: Container(
      width: 300,
      height: 100,
      child: img,
    ),
  );
  return show;
}

var right = ChatWidget(
  chartItem: ChatItem(
      headIcon: AssetImage("images/icon_head.png"),
      type: ChartType.right,
      text: "凭君莫话封侯事，一将功成万骨枯。你觉得如何?"),
);

var left = ChatWidget(
  chartItem: ChatItem(
      headIcon: AssetImage("images/wy_200x300.jpg"),
      type: ChartType.left,
      text: "在苍茫的大海上，狂风卷积着乌云，在乌云和大海之间，海燕像黑色的闪电，在高傲的飞翔。"),
);

//var show = ListView(
//  children: <Widget>[right, left],
//);

var show = test();
