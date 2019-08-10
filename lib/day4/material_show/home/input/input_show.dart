import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_journey/day4/material_show/home/input/TextFieldTest.dart';

class InputShow extends StatefulWidget {
  @override
  _InputShowState createState() => _InputShowState();
}

class _InputShowState extends State<InputShow> {
  @override
  Widget build(BuildContext context) {



    var show =
        Container(
          height: 500,
          child: TextFieldTest(),
          padding: EdgeInsets.fromLTRB(30, 20, 30, 0),


    );
    return Transform.translate(offset: Offset(-20,80,),child: Transform.rotate(angle: 45*pi/180,child: TextFieldTest(),),);

  }







}
