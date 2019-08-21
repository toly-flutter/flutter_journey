import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_journey/day4/anim/encapsulate/flutter_container.dart';
import 'package:flutter_journey/utils/color_utils.dart';
import 'package:flutter_journey/utils/common_path.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var app = MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'InheritedWidget Page'),
      routes: <String, WidgetBuilder>{
        "/next": (BuildContext context) => NextPage(), //下一页
      },
    );

    return ChangeNotifierProvider<CountModel>.value(
      value: CountModel(0),
      child: app,
    );

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var home = Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            PanelClockWidget(),
          ],
        ),
      ),
      floatingActionButton: CounterButton(),
    );

    return home;
  }
}

//--------------Provider的使用----------------------------------------------
class CountModel with ChangeNotifier {
  int _count; //计数器
  CountModel(this._count); //增长函数

  void increment() {
    //增长函数具体逻辑
    _count++;
    notifyListeners(); //响应
  }

  get count => _count; //获取数字
}

//-------------------------------------------------------------------------------

//对计数器面板组件进行提取
class PanelClockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var child = Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(3),
        padding: EdgeInsets.all(3),
        child: CounterWidget(),
        width: 100,
        decoration: BoxDecoration(
            color: randomColor(),
            borderRadius: BorderRadius.all(Radius.circular(20))));

    return child;
  }
}

//button
class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var count = Provider.of<CountModel>(context).count; //获取数据
    var text = Text(
      '$count',
      style: Theme.of(context).textTheme.display1,
    );
    var result = Wrap(
      spacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Icon(
          Icons.timer,
          color: Colors.blue,
          size: 30,
        ),
        text
      ],
    );
    return FlutterContainer(
      child: result,
      config: AnimConfig(),
    );
  }
}

//对计数器按钮组件进行提取
class CounterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var increment = Provider.of<CountModel>(context).increment; //获取数据
    var count = Provider.of<CountModel>(context).count; //获取数据
    var btn = FloatingActionButton(
      onPressed: () {
        if (count == 5) {
          //点击时为5，再点击则跳转到新界面
          Navigator.of(context).pushNamed("/next");
        } else {
          increment();
        }
      },
      tooltip: 'Increment',
      child: Icon(Icons.add),
      elevation: 4,
      shape: StarBorder(),
    );
    return btn;
  }
}

/// 边线形状类
class StarBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    var r = rect.right / 2;
    return nStarPath(12, r, r * cos((360 / 9 / 2) * pi / 180),
        dx: rect.height / 2, dy: rect.width / 2);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return null;
  }
}

///跳转界面
class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var count = Provider.of<CountModel>(context).count; //2; //获取数据
    var app = MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            Scaffold(appBar: AppBar(title: Text("New Page,now count=$count"))));
    return app;
  }
}
