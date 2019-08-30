import 'package:flutter/material.dart';

import 'other_page.dart';


//void main() => runApp(LifecycleApp());

class LifecycleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyLifecyclePage(
        title: 'State生命周期测试-第一个页面',
      ),
    );
  }
}

class MyLifecyclePage extends StatefulWidget {
  final String title;

  ///第1步: 触发MyLifecyclePage StatefulWidget的构造器
  MyLifecyclePage({Key key, this.title}) : super(key: key) {
    print(
        'lifecycle parent MyLifecyclePage----->MyLifecyclePage constructor构造器调用');
  }

  ///第2步: 触发MyLifecyclePage createState方法
  @override
  _MyLifecyclePageState createState() {
    print('lifecycle parent MyLifecyclePage----->createState');
    return _MyLifecyclePageState();
  }
}

class _MyLifecyclePageState extends State<MyLifecyclePage> {
  num _counter = 0;

  ///第4步: 触发_MyLifecyclePageState State的构造器
  _MyLifecyclePageState() {
    print(
        'lifecycle parent MyLifecyclePage----->_MyLifecyclePageState constructor构造器调用');
  }

  ///第5步: 触发initState方法
  @override
  void initState() {
    print('lifecycle parent MyLifecyclePage----->initState');
    super.initState();
  }

  ///第6步: 触发didChangeDependencies方法
  @override
  void didChangeDependencies() {
    print('lifecycle parent MyLifecyclePage----->didChangeDependencies');
    super.didChangeDependencies();
  }

  ///第7步: 触发build方法
  @override
  Widget build(BuildContext context) {
    print('lifecycle parent MyLifecyclePage----->build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          CounterWidget(
            counter: _counter,
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: Text('Add'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => OtherPage()),
                  (route) => route == null);
            },
            child: Text('跳转到下一个页面'),
          ),
        ],
      ),
    );
  }

  @override
  void reassemble() {
    print('lifecycle parent MyLifecyclePage----->reassemble');
    super.reassemble();
  }

  @override
  void didUpdateWidget(MyLifecyclePage oldWidget) {
    print('lifecycle parent MyLifecyclePage----->didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  ///第8步: 触发deactivate方法
  @override
  void deactivate() {
    print('lifecycle parent MyLifecyclePage----->deactivate');
    super.deactivate();
  }

  ///第9步: 触发dispose方法
  @override
  void dispose() {
    print('lifecycle parent MyLifecyclePage----->dispose');
    super.dispose();
  }
}

class CounterWidget extends StatefulWidget {
  CounterWidget({Key key, this.counter}) : super(key: key) {
    print('lifecycle child CounterWidget----->CounterWidget 构造器调用');
  }

  final int counter;

  @override
  _CounterWidgetState createState() {
    print('lifecycle child CounterWidget----->_CounterWidgetState createState');
    return _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  _CounterWidgetState() {
    print('lifecycle child CounterWidget----->_CounterWidgetState 构造器调用');
  }

  @override
  void initState() {
    print('lifecycle child CounterWidget----->initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('lifecycle child CounterWidget----->didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('lifecycle child CounterWidget----->build');
    return Text(
      '${widget.counter}',
      style: TextStyle(
        fontSize: 20.0,
      ),
    );
  }

  @override
  void reassemble() {
    print('lifecycle child CounterWidget----->reassemble');
    super.reassemble();
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    print('lifecycle child CounterWidget----->didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('lifecycle child CounterWidget----->deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('lifecycle child CounterWidget----->dispose');
    super.dispose();
  }
}
