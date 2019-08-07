import 'package:flutter/material.dart';

showText() {
  var text = Text("toly-张风捷特烈-1994`");

  var show = Container(
    color: Color(0x6623ffff),
    width: 200,
    height: 200 * 0.618,
    child: text,
  );

  return show;
}

showStyleBase() {
  var style = TextStyle(
    color: Colors.red, //颜色
    backgroundColor: Colors.white, //背景色
    fontSize: 20, //字号
    fontWeight: FontWeight.bold, //字粗
    fontStyle: FontStyle.italic, //斜体
    letterSpacing: 10, //字间距
  );

  var text = Text(
    "toly-张风捷特烈-1994`",
    style: style,
  );

  var show = Container(
    color: Color(0x6623ffff),
    width: 200,
    height: 200 * 0.618,
    child: text,
  );
  return show;
}

useFamily(){
  var style = TextStyle(
      color: Colors.red, //颜色
      backgroundColor: Colors.white,//背景色
      fontFamily:"阿里惠普体"
  );

  var text = Text("toly-张风捷特烈-1994`",style: style,);
  var show = Container(
    color: Color(0x6623ffff),
    width: 200,
    height: 200 * 0.618,
    child: text,
  );
  return show;
}

shadowText(){
  var shadow = Shadow(
      color: Colors.black, //颜色
      blurRadius: 1, //虚化
      offset: Offset(2, 2)//偏移
  );

  var style = TextStyle(
      color: Colors.grey, //颜色
      fontSize: 80, //字号
      shadows: [shadow]);

  var text = Text(
    "张风捷特烈",
    style: style,
  );

  var show = Container(
    color: Color(0x6623ffff),
    child: text,
  );
  return show;
}

rainbowShadow(){
  const rainbow = [//颜色列表
    0xffff0000, 0xffFF7F00, 0xffFFFF00,
    0xff00FF00, 0xff00FFFF, 0xff0000FF, 0xff8B00FF
  ];

  int i=0;
  var shadows=rainbow.map((e){//遍历rainbow列表，生成Shadow集合
    var shadow=Shadow(
        color: Color(e),
        blurRadius: i * 2.5,
        offset: Offset(-(i + 1) * 3.0, -(i + 1) * 3.0));
    i++;
    return shadow;
  }).toList();

  var style = TextStyle(
      color: Colors.black, //颜色
      fontSize: 80, //字号
      shadows:shadows);

  var text = Text(
    "张风捷特烈",
    style: style,
  );
  var show = Container(
    color: Color(0x6623ffff),
    child: text,
  );
  return show;
}

decorationTest(){
  var style = TextStyle(
    color: Colors.black, //颜色
    fontSize: 20, //字号
    decoration: TextDecoration.lineThrough,
    decorationColor: Color(0xffff0000),//装饰线颜色
    decorationStyle: TextDecorationStyle.wavy,//装饰线样式
    decorationThickness: 0.8,//装饰线粗
  );

  var text = Text(
    "张风捷特烈",
    style: style,
  );

  var show = Container(
    color: Color(0x6623ffff),
    child: text,
  );
  return show;
}

welcomeText() {
  var span = TextSpan(
    text: 'hello ',
    style: TextStyle(color: Colors.black, fontSize: 18),
    children: <InlineSpan>[
      WidgetSpan( //使用WidgetSpan添加一个组件
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.ideographic,
          child: Icon(Icons.face, color: Colors.amber,)),
      TextSpan(
        text: ' , welcome to ',
        style: TextStyle(color: Colors.blue, fontSize: 18),
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
  Text.rich(span);
}
var show = decorationTest();


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

