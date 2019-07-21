//_formChild(String str) {
//  var li = <Widget>[];
//
//  for (var i = 0; i < str.length; i++) {
//    li.add(FlutterText(child: Text(str[i],style: TextStyle(fontSize: 30),),
//    ));
//  }
//
//  return li;
//}
//
//var textZone=Row(children:_formChild("代码,改变生活"),mainAxisSize: MainAxisSize.min,);

import 'package:flutter/material.dart';
import 'package:flutter_journey/day4/anim/widget/flutter_layout.dart';

var child = Image(
  image: AssetImage("images/icon_head.png"),
);

var configs = <CurveTween>[
  CurveTween(curve: Curves.bounceIn),
  CurveTween(curve: Curves.bounceInOut),
  CurveTween(curve: Curves.bounceOut),
  CurveTween(curve: Curves.decelerate),
  CurveTween(curve: Curves.ease),
  CurveTween(curve: Curves.easeIn),
  CurveTween(curve: Curves.easeInBack),
  CurveTween(curve: Curves.easeInCirc),
  CurveTween(curve: Curves.easeInCubic),
  CurveTween(curve: Curves.easeInExpo),
  CurveTween(curve: Curves.easeInOut),
  CurveTween(curve: Curves.easeInOutBack),
  CurveTween(curve: Curves.easeOut),
  CurveTween(curve: Curves.easeOutBack),
  CurveTween(curve: Curves.linear),
];

var configsInfo = <String>[
  "bounceIn",
  "bounceInOut",
  "bounceOut",
  "decelerate",
  "ease",
  "easeIn",
  "easeInBack",
  "easeInCirc",
  "easeInCubic",
  "easeInExpo",
  "easeInOut",
  "easeInOutBack",
  "easeOut",
  "easeOutBack",
  "linear",
];


//var show = MultiShower(configs, (config) =>
//    FlutterLayout(child: child,
//      config: AnimConfig(
//          duration: 2000, offset: 45, mode: RockMode.lean, curveTween: config,onFinish: (){
//            print("fi==========================");
//      }),
//    ), width: 60, color: Colors.transparent,infos: configsInfo,);


var show =
FlutterLayout(child: child,
  config: AnimConfig(
      duration: 2000, offset: 45, mode: RockMode.lean, curveTween: CurveTween(curve: Curves.ease),onFinish: (){
    print("fi==========================");
  }),
);

//var text = FlutterText("代码,改变生活",
//  config: AnimConfig(duration: 1000,offset: 5,mode: RockMode.random),
//  style: TextStyle(
//    color: Colors.blue,
//    fontSize: 30,
//    letterSpacing: 3
//),);
