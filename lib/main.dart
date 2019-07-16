import 'package:flutter/material.dart';

import 'package:flutter_journey/day4/anim/run_balls_creater.dart';
import 'day4/painter/paper.dart';



var scaffold = Scaffold(
  appBar: AppBar(
    title: Text('Flutter之旅'),
  ),
  body: RunBall(),
);

var app = MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: RunBall(),
);

void main() => runApp(app);