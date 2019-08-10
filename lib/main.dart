import 'package:flutter/material.dart';
import 'package:flutter_journey/day4/anim/flutter_text.dart';
import 'package:flutter_journey/day4/anim/run_ball.dart';
import 'package:flutter_journey/day4/anim/tween.dart';
import 'package:flutter_journey/day4/material_show/sliver/CupertinoPage.dart';

import 'day4/anim/fps_show.dart';
import 'day4/material_show/app.dart';

////var show=CustomPaint(painter: GrammarView(),);
//var topCenterShow = Align(alignment: Alignment.topCenter,child:RunBallWidget(size: Size(200, 150),) ,);
//var centerShow = Align(alignment: Alignment.center,child:StarAnimWidget(size: Size(200, 200),) ,);
var centerShow = Align(alignment: Alignment.center,child:FlutterText(str:"捷") ,);

var scaffold = Scaffold(
  appBar: AppBar(
    title: Text('Flutter之旅'),
  ),
  body: centerShow,
);

var app = MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: scaffold,
);

void main() => runApp(app);
//void main() => runApp(CupertinoPage());

