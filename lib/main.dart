import 'package:flutter/material.dart';
import 'package:flutter_journey/day3/widget_show/single_child.dart';

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