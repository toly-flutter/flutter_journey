import 'dart:math';

import 'package:flutter/material.dart';

var img = Image.asset(
  'images/ls.jpg',
  centerSlice: Rect.fromPoints(Offset(60,68),Offset(60, 60)),
);

var imgContainer = Container(
  height: 200,
  width: 200,
  color: Colors.cyanAccent,
  child: img,
);



var fitMode = [BoxFit.none, BoxFit.contain, BoxFit.cover,
  BoxFit.fill, BoxFit.fitHeight, BoxFit.fitWidth, BoxFit.scaleDown
];

//循环生成Image控件
form() {
  var imgLi = <Widget>[];
  fitMode.forEach((fit) {
    var img = Container(
        margin: EdgeInsets.all(10),
        width: 150,
        height: 60,
        color: randomRGB(),
        child: Image(
          image: AssetImage("images/wy_300x200_little.jpg"),
          fit: fit,
        ));

    imgLi.add(Column(
      children: <Widget>[img, Text(fit.toString())],
    ));
  });
  return imgLi;
}

var imgBox = Wrap(
  children: form(),
);

Color randomRGB() {
  Random random = new Random();
  int r = 30 + random.nextInt(200);
  int g = 30 + random.nextInt(200);
  int b = 30 + random.nextInt(200);
  return Color.fromARGB(255, r, g, b);
}

////--------------
//叠合模式数组
var colorBlendMode = [
  BlendMode.clear,BlendMode.src,BlendMode.dst,
  BlendMode.srcOver,BlendMode.dstOver,BlendMode.srcIn,
  BlendMode.dstIn,BlendMode.srcOut,BlendMode.dstOut,
  BlendMode.srcATop,BlendMode.dstATop,BlendMode.xor,
  BlendMode.plus, BlendMode.modulate,BlendMode.screen,
  BlendMode.overlay,BlendMode.darken,BlendMode.lighten,
  BlendMode.colorDodge,BlendMode.colorBurn,BlendMode.hardLight,
  BlendMode.softLight,BlendMode.difference,BlendMode.exclusion,
  BlendMode.multiply,BlendMode.hue,BlendMode.saturation,
  BlendMode.color, BlendMode.luminosity,
];

//循环生成Image控件
formImgsColorBlendMode() {
  var imgLi = <Widget>[];
  colorBlendMode.forEach((mode) {
    var img = Container(
        margin: EdgeInsets.all(5),
        width:60,
        height: 60,
        child: Image(
          image: AssetImage("images/icon_head.png"),
          color: Colors.blue,
          colorBlendMode: mode,
        ));

    imgLi.add(Column(children: <Widget>[img,
      Text(mode.toString().split(".")[1])
    ]));
  });
  return imgLi;
}

var imageColorMode = Wrap(
  children: formImgsColorBlendMode(),
);

///----------------
var alignments = [
  Alignment.center,  Alignment.centerLeft, Alignment.centerRight,
  Alignment.topCenter,Alignment.topLeft, Alignment.topRight,
  Alignment.bottomCenter,Alignment.bottomLeft,Alignment.bottomRight,
Alignment(0.01,0.01),Alignment(0.5,0.5)
];


//循环生成Image控件
formImgAlignments() {
  var imgLi = <Widget>[];
  alignments.forEach((align) {
    var img = Container(
        margin: EdgeInsets.all(7),
        width: 150,
        height: 60,
        color: randomRGB(),
        child: Image(
          image: AssetImage("images/wy_300x200_little.jpg"),
          alignment: align,
        ));

    imgLi.add(Column(
      children: <Widget>[img, Text(align.toString())],
    ));
  });
  return imgLi;
}

var imageAlignments = Wrap(
  children: formImgAlignments(),
);

var repeats = [
  ImageRepeat.repeatY,  ImageRepeat.repeatX,
  ImageRepeat.noRepeat,ImageRepeat.repeat
];
//循环生成Image控件
formImgRepeat() {
  var imgLi = <Widget>[];
  repeats.forEach((repeat) {
    var img = Container(
        margin: EdgeInsets.all(7),
        width: 150,
        height: 90,
        color: randomRGB(),
        child: Image(
          image: AssetImage("images/wy_300x200_little.jpg"),
          repeat: repeat,
        ));

    imgLi.add(Column(
      children: <Widget>[img, Text(repeat.toString())],
    ));
  });
  return imgLi;
}

var imageRepeats = Wrap(
  children: formImgRepeat(),
);

///
var qualitys = [
  FilterQuality.none,FilterQuality.high,
  FilterQuality.medium, FilterQuality.low,

];
//循环生成Image控件
formImgQualitys() {
  var imgLi = <Widget>[];
  qualitys.forEach((q) {
    var img = Container(
        margin: EdgeInsets.all(7),
        width:110.0*3/2,
        height: 110,
        color: randomRGB(),
        child: Image(
          image: AssetImage("images/wy_300x200.jpg"),
          filterQuality: q,
        ));

    imgLi.add(Column(
      children: <Widget>[img, Text(q.toString())],
    ));
  });
  return imgLi;
}

var imageQualitys = Wrap(
  children: formImgQualitys(),
);

rangeSliderTest(){

  var rangeSlider =RangeSlider(
    values: RangeValues(0, 1),
    onChanged: (e){
      print('onChanged:$e');
    },
    onChangeStart: (e){
      print('onChangeStart:$e');

    },
    onChangeEnd: (e){
      print('onChangeEnd:$e');

    },
    divisions: 5,
  );

  return rangeSlider;
}

var show=rangeSliderTest();