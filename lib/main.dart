import 'package:flutter/material.dart';

import 'toly_widget/user_panel.dart';


//var show=CustomPaint(painter: GrammarView(),);


var scaffold = Scaffold(
  appBar: AppBar(
    title: Text('Flutter之旅'),
  ),
  body: show,
);

var app = MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: scaffold,
);

void main() => runApp(app);



