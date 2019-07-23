import 'package:flutter/material.dart';

import 'day5/show.dart';





//Matrix4Page(child: box)
var scaffold = Scaffold(
  appBar: AppBar(title: Text("Flutter之旅"),),
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