import 'package:flutter/material.dart';

var scaffold = Scaffold(
  appBar: AppBar(
    title: Text('Flutter之旅'),
  ),
);

var app = MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: scaffold,
);

void main() => runApp(app);