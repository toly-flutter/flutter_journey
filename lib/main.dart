import 'package:flutter/material.dart';

import 'day2/grammar_view.dart';




var scaffold = Scaffold(
  appBar: AppBar(
    title: Text('Flutter之旅'),
  ),
  body: CustomPaint(painter: GrammarView(),),
);

var app = MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: scaffold,
);

void main() => runApp(app);