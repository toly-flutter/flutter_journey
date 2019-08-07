import 'dart:math';

import 'package:flutter/material.dart';

containerBase() {
  var container = Container(
    //容器组件
    width: 150,
    //容器宽
    height: 100,
    //容器高
    color: Colors.lightBlueAccent,
    //容器的颜色
    padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
    margin: EdgeInsets.fromLTRB(10, 20, 30, 40),
    child: Text("Container"),
    //容器内部组件
    alignment: Alignment.center,
  );
  return container;
}

padding() {
  var show = Padding(
    child: Image.asset(
      //图片组件
      "images/wy_200x300.jpg",
      fit: BoxFit.cover,
    ),
    padding: EdgeInsets.only(left: 30),
  );
  return show;
}

testDecoration() {
  var show = Container(
      child: ClipRRect(
        //圆角裁切组件
        borderRadius: BorderRadius.all(Radius.circular(50)), //圆角大小设置
        child: Image.asset(
          //图片组件
          "images/wy_200x300.jpg",
          fit: BoxFit.cover,
        ),
      ),
      height: 100,
      width: 100,
      decoration: ShapeDecoration(
        //Container装饰线对象
        shape: RoundedRectangleBorder(
          //装饰线形状使用圆角矩形
          borderRadius: BorderRadius.all(
            //圆角大小设置
            Radius.circular(50.0),
          ),
        ),
        color: Colors.white, //容器内颜色
        shadows: [
          //容器外部阴影
          BoxShadow(
            color: Colors.blue.withOpacity(0.5), //阴影颜色
            offset: new Offset(0.0, 0.0), //阴影偏移
            blurRadius: 6.0, //阴影模糊度
            spreadRadius: 0.0, //阴影扩散半径
          ),
        ],
      ));
  return Center(
    child: show,
  );
}

testConstraints() {
  var show = Container(
    constraints: BoxConstraints(
      minWidth: 50, //最小宽
      minHeight: 50, //最小高
      maxHeight: 100, //最大高
      maxWidth: 100, //最大宽
    ),
    child: Container(
      width: 150,
      height: 10,
      color: Colors.cyanAccent,
    ),
  );
  return Center(
    child: show,
  );
}

test() {
  var matrix4 = [
    //Matrix4待测试项数组
    Matrix4.rotationX(45 * pi / 180),
    Matrix4.rotationY(45 * pi / 180),
    Matrix4.rotationZ(45 * pi / 180),
    Matrix4.skew(30 * pi / 180, -45 * pi / 180),
    Matrix4.skewX(45 * pi / 180),
    Matrix4.skewY(45 * pi / 180),
    Matrix4.translationValues(10, 10, 10),
    Matrix4.diagonal3Values(0.5, 0.8, 1)
  ];

  var strInfo = [
    //文字描述信息
    "rotationX(45°)",
    "rotationY(45°)",
    "rotationZ(45°)",
    "skew（30°，-45°）",
    "skewX（45°）",
    "skewY（45°）",
    "translationValues\n(10,10,10)",
    "diagonal3Values\n(0.5, 0.8, 1)"
  ];

  int i = -1; //索引
  var show = Wrap(
    children: matrix4.map((e) {
      i++; //索引自加
      return Padding(
          padding: EdgeInsets.only(left: 50),
          child: Column(children: <Widget>[
            Container(
              width: 50,
              height: 50,
              color: Colors.grey,
              child: Container(
                color: Colors.cyanAccent,
                transform: e,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(strInfo[i]),
            )
          ]));
    }).toList(),
  );

  return Center(
    child: show,
  );
}

//test() {
//  var img = Image.asset(
//    //图片组件
//    "images/wy_200x300.jpg",
//    fit: BoxFit.cover,
//    width: 100,
//    height: 100,
//  );
//
//  var text = Text(
//    "hello",
//  );
//
//  return Container(
//    alignment: Alignment.topCenter,
//    child: Stack(
//      alignment: Alignment.bottomCenter,
//      children: <Widget>[
//        Padding(
//          padding: EdgeInsets.only(top: 300),
//          child: text,
//        ),
//        Padding(
//          padding: EdgeInsets.only(bottom: 30),
//          child: img,
//        ),
//      ],
//    ),
//  );
//}

var show = padding();
