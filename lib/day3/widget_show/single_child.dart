import 'package:flutter/material.dart';



///[Container] -----------------
var container = Container(
  //容器组件
  color: Colors.lightBlueAccent,
  //容器的颜色
  width: 150,
  //容器宽
  height: 100,
  //容器高
  child: Text("Container"),
  //容器内部组件
  padding: EdgeInsets.all(20),
  //内边距
  margin: EdgeInsets.fromLTRB(5, 10, 15, 20), //外边距
);

////[Card] -----------------
var card = Card(
  //卡片组件
  elevation: 10,
  //阴影深度
  color: Color(0xffffffff),
  //卡片颜色
  child: container,
  //卡片内部组件
  margin: EdgeInsets.only(left: 40, top: 20),
  //外边距
  shape: CircleBorder(side: BorderSide(color: Colors.blue)),
  clipBehavior: Clip.hardEdge,
);


///[SingleChildRenderObjectWidget]  一族  --------------------------
///
/// 1. [Align] ------------------------------------
///
///Align 基础测试----
alignBase(){
  var childBox = Container(//孩子组件
    width: 40,
    height: 40,
    color: Colors.cyanAccent,
  );

  var align = Align(//布局组件Align
    alignment: Alignment.center,
    child: childBox,
  );

  var fatherBox = Container(//父亲组件
    width: 110,
    height: 68,
    color: Colors.grey,
    child: align,
  );
  return fatherBox;
}

///Align widthFactor测试----
alignFactorTest(){
  var childBox = Container(
    //孩子组件
    width: 40,
    height: 40,
    color: Colors.cyanAccent,
  );

  var align = Align(
    //布局组件Align
    widthFactor: 5,
    heightFactor: 2,
    alignment: Alignment.topLeft,
    child: childBox,
  );

  var fatherBox = Container(//父亲组件宽高未指定时
    color: Colors.grey,
    child: align,
  );
  return fatherBox;
}

//循环生成Image控件
formAlignments({double childWidth = 40, double fatherWidth = 110}) {
  var alignments = [
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topCenter,
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment(0, 0),
    Alignment(0.5, 0.5)
  ];
  var alignmentInfos = [
    "center",
    "centerLeft",
    "centerRight",
    "topCenter",
    "topLeft",
    "topRight",
    "bottomCenter",
    "bottomLeft",
    "bottomRight",
    "Alignment(0,0)",
    "Alignment(0.5,0.5)"
  ];


  var imgLi = <Widget>[];
  for (int i = 0; i < alignments.length; i++) {
    var childBox = Container(
      width: childWidth,
      height: childWidth,
      color: Colors.cyanAccent,
    );
    var align = Align(
      alignment: alignments[i],
      child: childBox,
    );
    var fatherBox = Container(
      margin: EdgeInsets.all(5),
      width: fatherWidth,
      height: fatherWidth * 0.618,
      color: Colors.grey,
      child: align,
    );

    imgLi.add(Column(
      children: <Widget>[fatherBox, Text(alignmentInfos[i])],
    ));
  }

  return Wrap(
    children: imgLi,
  );
}


///2.[Center]-----------------------------------------

centerBase(){
  var childBox = Container(//孩子组件
    width: 40,
    height: 40,
    color: Colors.cyanAccent,
  );

  var align = Center(//布局组件Center
    child: childBox,
  );

  var fatherBox = Container(//父亲组件
    width: 110,
    height: 68,
    color: Colors.grey,
    child: align,
  );
  return fatherBox;
}


///3.[Padding]-----------------------------------------
paddingBase(){
  var childBox = Container(//孩子组件
    width: 40,
    height: 40,
    color: Colors.cyanAccent,
  );

  var padding = Padding(//布局组件Padding
    child: childBox,
    padding: EdgeInsets.all(10),
  );

  var fatherBox = Container(//父亲组件
    width: 110,
    height: 68,
    color: Colors.grey,
    child: padding,
  );
  return fatherBox;
}



///4.[Padding]-----------------------------------------
offStageBase(){
  var childBox = Container(//孩子组件
    width: 40,
    height: 40,
    color: Colors.cyanAccent,
  );

  var offstage = Offstage(//布局组件Offstage
    child: childBox,
    offstage: false,
  );

  var fatherBox = Container(//父亲组件
    padding:EdgeInsets.all(10) ,
    width: 110,
    height: 68,
    color: Colors.grey,
    child: offstage,
  );
  return fatherBox;
}
///5.[Baseline]-----------------------------------------
baselineBase(){
  var childBox = Text(//孩子组件
    'Toly',
    style: TextStyle(fontSize: 30),
  );

  var baseline = Baseline(//布局组件Baseline
    child: childBox,
    baseline: 68,
    baselineType: TextBaseline.alphabetic,

  );

  var fatherBox = Container(//父亲组件
    width: 110,
    height: 68,
    color: Colors.grey,
    child: baseline,
  );
  return fatherBox;
}

///6.[Transform]-----------------------------------------
transformBase(){
  var childBox = Container(//孩子组件
    color: Colors.cyanAccent,
  );

  var transform = Transform(//布局组件Transform
    child: childBox,
    transform: Matrix4.skew(0.5, 0.3),

  );

  var fatherBox = Container(//父亲组件
    width: 110,
    height: 68,
    color: Colors.grey,
    child: transform,
  );
  return fatherBox;
}



/// 3.1. [SizedBox] -----------------
///
sizedBoxBase(){
  var childBox = Container(//孩子组件
    width: 40,
    height: 40,
    color: Colors.cyanAccent,
  );

  var sizedBox = SizedBox(//布局组件SizedBox
    child: childBox,
    height: 100,
    width: 100,
  );
  return sizedBox;
}


/// 3.2.[FittedBox] -----------------
///
fittedBoxBase(){
  var child = Container(//孩子组件
    width: 50.0,
    height: 50.0,
    color: Colors.cyanAccent,
  );

  var fittedBox = FittedBox(//布局组件FittedBox
    fit: BoxFit.contain,
    alignment: Alignment.center,
    child: child,
  );

  var father = Container(//父亲组件
    width: 200,
    height: 100,
    child: fittedBox,
    color: Colors.grey,
  );
  return father;
}

/// 3.3.[AspectRatio] -----------------
aspectRatioBase() {
  var child = Container( //孩子组件
    color: Colors.cyanAccent,
  );
  var aspectRatio = AspectRatio( //布局组件AspectRatio
    aspectRatio: 4 / 3,
    child: child,
  );
  var father = Container( //父亲组件
    width: 200,
    child: aspectRatio,
  );
  return father;
}

///3.4.[ConstrainedBox]-----------------
///
var constrainedBox = ConstrainedBox(
  constraints: const BoxConstraints(
      minWidth: 150, maxWidth: 200, maxHeight: 200, minHeight: 50),
  child: const Card(child: Text('Hello World!')),
);


/// 3.5.[LimitedBox] -----------------
limitedBoxBase() {
  var child = Container( //孩子组件
    color: Colors.cyanAccent,
  );
  //布局组件LimitedBox
  var limitedBox = LimitedBox(maxWidth: 50, maxHeight: 50, child: child);

  var father = Column( //父亲组件
    children: <Widget>[limitedBox],
  );
  return father;
}

///3.6.[OverflowBox] -----------------
overflowBoxBase() {
  var child = Container( //孩子
    color: Color(0x88FF0000), //这里将孩子透明度变为一半
    width: 300.0,
    height: 300.0,
  );

  var overflowBox = OverflowBox(//布局组件OverflowBox
    alignment: Alignment.topLeft,
    maxWidth: 200.0,
    maxHeight: 150.0,
    child: child,
  );

  var father = Container(
    //父亲
      color: Colors.black,
      width: 100.0,
      height: 100.0,
      child: overflowBox);
  return father;
}


///7.[SizedOverflowBox]-----------------
sizedOverflowBoxBase() {
  var child = Container(
    //孩子
    color: Color(0x88FF0000), //这里将孩子透明度变为一半
    width: 50.0,
    height: 100.0,
  );

  //布局组件SizedOverflowBox
  var sizedOverflowBox = SizedOverflowBox(
    alignment: Alignment.bottomRight,
    size: Size(50, 100),
    child: child,
  );

  var father = Container(
    //父亲
      color: Colors.grey,
      alignment: Alignment.bottomRight,
      width: 100.0,
      height: 100.0,
      child: sizedOverflowBox);
  return father;
}


///8.[FractionallySizedBox]----
fractionallySizedBoxBase() {
  var child = Container(
    //孩子
    color: Color(0x88FF0000), //这里将孩子透明度变为一半
  );

  //布局组件FractionallySizedBox
  var fractionallySizedBox = FractionallySizedBox(
      alignment: Alignment.topLeft,
      widthFactor: 1.5,
      heightFactor: 0.5,
      child: child);


  var father = Container(
    //父亲
      color: Colors.grey,
      alignment: Alignment.bottomRight,
      width: 200.0,
      height: 100.0,
      child: fractionallySizedBox);
  return father;
}


///9.[IntrinsicWidth] 和 [IntrinsicHeight] ------
///
intrinsicWidthBase() {
  var child = Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Container(
        width: 100,
        height: 100,
        color: Colors.cyanAccent,
      )
    ],
  );
  //布局组件IntrinsicWidth
  var intrinsicWidth = IntrinsicWidth(
    child: child,
  );
  return intrinsicWidth;
}

intrinsicHeightBase() {
  var child = Row(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Container(
        width: 100,
        height: 100,
        color: Colors.cyanAccent,
      )
    ],
  );
  //布局组件IntrinsicWidth
  var intrinsicHeight = IntrinsicHeight(
    child: child,
  );
  return intrinsicHeight;
}


var show = intrinsicHeightBase();

///10.[CustomSingleChildLayout]
var customSingleChildLayout = CustomSingleChildLayout(
  delegate: CenterChildLayoutDelegate(),
  child: Container(
    width: 100,
    height: 100,
    color: Colors.cyanAccent,
  ),
);

class CenterChildLayoutDelegate extends SingleChildLayoutDelegate {
  @override
  bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) {
    // TODO: implement shouldRelayout
    return null;
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {}

  @override
  Offset getPositionForChild(Size size, Size childSize) {}

  @override
  Size getSize(BoxConstraints constraints) {}
}


