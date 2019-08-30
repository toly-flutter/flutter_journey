import 'package:flutter/material.dart';

import 'day9/redux/theme_i18n/index.dart';

//import 'day4/view_pager/slide_pager_auto_paly.dart';





////var show=CustomPaint(painter: GrammarView(),);
//var topCenterShow = Align(alignment: Alignment.topCenter,child:RunBallWidget(size: Size(200, 150),) ,);
//var centerShow = Align(alignment: Alignment.center,child:StarAnimWidget(size: Size(200, 200),) ,);
//var centerShow = Align(alignment: Alignment.center,child:FlutterText(str:"捷") ,);
//var centerShow = Align(alignment: Alignment.center,
//    child: FlutterContainer(child: Text("捷", style: TextStyle(fontSize: 50),),
//      config: AnimConfig(mode: FlutterMode.random),));

//var centerShow = Align(alignment: Alignment.center,
//    child: show);


//var scaffold = Scaffold(
//  appBar: AppBar(
//    title: Text('Flutter之旅'),
//  ),
//  body: SlidePage(
//    onPageChanged: (page){
//      print(page);
//    },
//    onClick: (index){
//      print(index);
//    },
//    config: PageConfig(
//      autoPlay: true
//    ),
//    children: List.generate(10, (i) => "images/wy_300x200.jpg").map((e) =>
//        Card(child: Image.asset(e, fit: BoxFit.cover,),)).toList(),),
//);


//var app = MaterialApp(
//
//    title: 'Flutter Demo',
//    theme: ThemeData(
//      primarySwatch: Colors.blue,
//    ),
//    home: scaffold
//);


//void main() => runApp(CupertinoPage());
void main() => runApp(SwitchThemeRedux());
//void main() => runApp(LifePage());
//void main() => runApp(MyApp());
//void main() => runApp(MyMaterialApp());

