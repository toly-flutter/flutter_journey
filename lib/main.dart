import 'package:flutter/material.dart';

import 'day3/widget_show/flex.dart';
import 'day4/anim/widget/text_slider.dart';


var slider = Slider(
    value: 0,
    max: 100,
    min: 0,
    onChanged: (e) {
      print('onChanged:$e');
    },
    onChangeStart: (e) {
      print('onChangeStart:$e');
    },
    onChangeEnd: (e) {
      print('onChangeEnd:$e');
    });


var a = (a) {
  print("a:$a");
};

var b = (b) {
  print("b:$b");
};

var c = (c) {
  print("c:$c");
};

var d = (d) {
  print("d:$d");
};


var box = Container(color: Colors.cyanAccent, width: 100, height: 100,);


var childs= [a,b,c,d].map((fun){
  return SizedBox.fromSize(size: Size(250, 100), child: TextSlider(onChanged: fun,),);
}).toList();

//Center(child: Wrap(children:childs,),)

//Matrix4Page(child: box)
var scaffold = Scaffold(
    body: show
);

var app = MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: scaffold,
);

void main() => runApp(app);