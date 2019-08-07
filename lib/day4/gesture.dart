import 'package:flutter/material.dart';

///RaisedButton测试，引入GestureDetector
testOfRaisedButton() {
  var show = RaisedButton(
    child: Text(
      "RaisedButton",
      style: TextStyle(fontSize: 12),
    ),
    onPressed: () {
      print("onPressed");
    },
  );

  return show;
}

testOfInkWell() {
  var box = Container(
    width: 120,
    height: 120*0.681,
  );

  var show = InkWell(
    child: box,
    focusColor: Colors.red,//聚焦时颜色
    hoverColor: Colors.yellow,//悬浮色
    splashColor: Colors.grey,//水波纹色
    highlightColor: Colors.blue,//长按时会显示该色
    borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
    onTap: () {
      print("OnTap in InkWell");
    },
  );
  return show;
}



///GestureDetector测试

testOfGestureDetector7() {
  var box = Container(
    color: Colors.cyanAccent,
    width: 100,
    height: 100,
  );

  var show = GestureDetector(
      child: box,
      onTap: () {
        print("onTap in my box");
      },
      onTapDown: (pos) {
        print(
            "落点----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
      },
      onTapUp: (pos) {
        print(
            "抬起点----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
      },
      onTapCancel: () {
        print("onTapCancel in my box");
      },
      onDoubleTap: () {
        print("onDoubleTap in my box");
      },
      onLongPress: () {
        print("onLongPress in my box");
      },
      onLongPressUp: () {
        print("onLongPressUp in my box");
      });
  return show;
}

testOfGestureDetector10() {
  var box = Container(
    color: Colors.cyanAccent,
    width: 200,
    height: 200,
  );

  var show = GestureDetector(
    child: box,
    onVerticalDragDown: (pos) {
      print("竖直拖拽按下----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
    },
    onVerticalDragStart: (pos) {
      print("开始竖直拖拽----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
    },
    onVerticalDragUpdate: (pos) {
      print("竖直拖拽更新----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
    },
    onVerticalDragEnd: (pos) {
      print("竖直拖拽结束速度----(x,y):(${pos.velocity.pixelsPerSecond.dx},${pos.velocity.pixelsPerSecond.dy})");
    },
    onVerticalDragCancel: () {
      print("onVerticalDragCancel in my box");
    },
    onHorizontalDragDown: (pos) {
      print("水平拖拽按下----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
    },
    onHorizontalDragStart: (pos) {
      print("开始水平拖拽----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
    },
    onHorizontalDragUpdate: (pos) {
      print("水平拖拽更新----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
    },
    onHorizontalDragEnd: (pos) {
      print("水平拖拽结束速度----(x,y):(${pos.velocity.pixelsPerSecond.dx},${pos.velocity.pixelsPerSecond.dy})");
    },
    onHorizontalDragCancel: () {
      print("onHorizontalDragCancel in my box");
    },
  );
  return show;
}



testOfGestureDetector5() {
  var box = Container(
    color: Colors.cyanAccent,
    width: 200,
    height: 200,
  );

  var show = GestureDetector(
    child: box,
    onPanDown: (pos) {
      print("拖拽按下----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
    },
    onPanStart: (pos) {
      print("开始拖拽----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
    },
    onPanUpdate: (pos) {
      print("拖拽更新----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
    },
    onPanEnd: (pos) {
      print("拖拽结束速度----(x,y):(${pos.velocity.pixelsPerSecond.dx},${pos.velocity.pixelsPerSecond.dy})");
    },
    onPanCancel: () {
      print("onPanCancel in my box");
    },
  );
  return show;
}

testOfGestureDetector3() {
  var box = Container(
    color: Colors.cyanAccent,
    width: 200,
    height: 200,
  );

  var show = GestureDetector(
    child: box,
    onScaleStart: (pos) {
      print(
          "onScaleStart----(x,y):(${pos.focalPoint.dx},${pos.focalPoint.dy})");
    },
    onScaleUpdate: (pos) {
      print(
          "onScaleUpdate----(x,y):(${pos.focalPoint.dx},${pos.focalPoint.dy})");
    },
    onScaleEnd: (pos) {
      print(
          "onScaleEnd----(x,y):(${pos.velocity.pixelsPerSecond.dx},${pos.velocity.pixelsPerSecond.dy})");
    },
  );
  return show;
}



var show = testOfInkWell();
