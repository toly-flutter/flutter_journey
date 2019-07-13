import 'package:flutter/material.dart';

import 'day3/widget_show/material_show.dart';


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
  home: show,
);

void main() => runApp(app);