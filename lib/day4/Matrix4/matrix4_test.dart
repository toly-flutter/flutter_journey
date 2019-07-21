import 'dart:math';

import 'package:flutter/material.dart';

show0() {
  var box = Container(
    color: Colors.cyanAccent,
    width: 100,
    height: 100,
  );
  var show = Transform(
    transform: Matrix4.rotationZ(45 / 180 * pi),
    transformHitTests: true,
    child: box,
  );
  return show;
}

show1() {
  var box = Container(
    color: Colors.cyanAccent,
    width: 100,
    height: 100,
  );
  var show = GestureDetector(
    child: Transform(
      transform: Matrix4.rotationZ(45 / 180 * pi),
      transformHitTests: true,
      child: box,
    ),
    onTap: () {
      print("999999--");
    },
  );

  return show;
}

show2() {
  var box = Container(
    color: Colors.cyanAccent,
    width: 100,
    height: 100,
  );
  var show = Transform(
    transform: Matrix4.rotationZ(45 / 180 * pi),
    transformHitTests: true,
    origin: Offset(0, 0),
    alignment: Alignment.center,
    child: box,
  );

  return show;
}

show3() {
//  Matrix4 zero= Matrix4.zero();
//  print(zero);

  var identity = Matrix4.identity();


  Matrix4.fromList(<double>[
      1.0,0.0,0.0,0.0,
      0.0,1.0,0.0,0.0,
      0.0,0.0,1.0,0.0,
      0.0,0.0,0.0,1.0,
  ]);

  printMatrix4(identity);

  var box = Container(
    color: Colors.cyanAccent,
    width: 100,
    height: 100,
  );
  var show = Transform(
    transform: Matrix4.rotationZ(45 / 180 * pi),
    transformHitTests: true,
    origin: Offset(0, 0),
    alignment: Alignment.center,
    child: box,
  );

  return show;
}

//var show=show0();
//var show=show1();
//var show=show2();
var show = show3();
//var show=show4();
//var show=show5();

printMatrix4(Matrix4 matrix4) {
  var split = matrix4.toString().split("\n");

  for(var i = 0 ; i < split.length ; i++) {
    var e=split[i];
    if(e.contains(" ")){
      print("---------------");
      print(e.split("] ")[1]);
      if (i==split.length-2){
        print("---------------");
      }
    }
  }

}
