import 'package:flutter/material.dart';
import 'package:flutter_journey/day4/material_show/cons.dart';
import 'package:flutter_journey/day4/material_show/home/nav/AppBottomBarTest.dart';
import 'package:flutter_journey/day4/material_show/home/stateless/button/ButtonBarTest.dart';
import 'package:flutter_journey/day4/material_show/home/stateless/button/CupertinoButtonTest.dart';
import 'package:flutter_journey/day4/material_show/home/stateless/ChipTest.dart';
import 'package:flutter_journey/day4/material_show/home/stateless/button/IconButtonTest.dart';
import 'package:flutter_journey/day4/material_show/home/stateless/clip/ClipOvalTest.dart';
import 'package:flutter_journey/day4/material_show/home/stateless/clip/ClipPathTest.dart';
import 'package:flutter_journey/day4/material_show/home/stateless/clip/ClipRRectTest.dart';

import 'button/FloatingActionButtonTest.dart';

class StatelessShow extends StatelessWidget {
  StatelessShow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var show = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[

        Row(children: <Widget>[
           FlutterLogo(size: 50,),Icon(Icons.loop,color: Colors.blue,size: 50,),ChipTest(),
        ], mainAxisAlignment: MainAxisAlignment.spaceAround),

        Row(children: <Widget>[
          Cons.BOX_50X50,
          ClipRRectTest(),
          ClipOvalTest(),
          ClipPathTest(),
        ], mainAxisAlignment: MainAxisAlignment.spaceAround),

        Row(children: <Widget>[
         FloatingActionButtonTest(),CupertinoButtonTest(), IconButtonTest()
        ], mainAxisAlignment: MainAxisAlignment.spaceAround),
        ButtonBarTest(),
      ],
    );


    return show;
  }
}
