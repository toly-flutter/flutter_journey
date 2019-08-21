import 'dart:async';

import 'package:flutter/material.dart';


class StreamCounterWidget extends StatelessWidget {

  StreamController<int> countController;
  int _count=0;

  StreamCounterWidget(){
    countController = StreamController<int>();
    countController.add(_count);
  }

  @override
  Widget build(BuildContext context) {
    var streamText= StreamBuilder<int>(
        stream: countController.stream,
        builder: (contxt, snapshot) {
          return Text("${snapshot.data}",style: Theme.of(context).textTheme.display1,);
        });
    var app = MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("StreamCounterWidget"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              streamText,
            ],
          ),
        ),
        floatingActionButton:FloatingActionButton(onPressed: (){
          _count++;
          countController.add(_count);

        },child: Icon(Icons.add),),
      ),
    );
    return app;
  }
}