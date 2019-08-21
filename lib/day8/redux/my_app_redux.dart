import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_journey/day4/anim/encapsulate/flutter_container.dart';
import 'package:flutter_journey/utils/color_utils.dart';
import 'package:flutter_journey/utils/common_path.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

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
          "/next_in_redux": (BuildContext context) => NextPage(), //下一页
        });

    return StoreProvider<CountState>(
      store: Store(counterReducer, initialState: CountState(0)),
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
    return Scaffold(
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
            PanelWidget(),
          ],
        ),
      ),
      floatingActionButton: CounterButton(),
    );
  }
}

//动作枚举
enum Actions {
  increment, //增加
  decrement //减少
}

//状态类
class CountState {
  final int count; //计数器
  const CountState(this.count);
}

//动作处理器
CountState counterReducer(CountState prev, dynamic action) {
  switch (action) {
    case Actions.increment:
      return CountState(prev.count + 1);
      break;
    case Actions.decrement:
      return CountState(prev.count - 1);
      break;
  }
  return prev;
}

//对计数器面板组件进行提取
class PanelWidget extends StatelessWidget {
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
    var countText = StoreConnector<CountState, int>(
      converter: (store) => store.state.count, //转换器，获取仓库，从仓库拿值
      builder: (context, count) {//构造器，构建Widget
        return Text(
          '$count',
          style: Theme.of(context).textTheme.display1,
        );
      },
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
        countText
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
    var self=context;
    var btnAdd = StoreConnector<CountState, VoidCallback>(
      converter: (store) {
        return () => store.dispatch(Actions.increment); //分发动作
      },
      builder: (context, callback) {
        //构造器，使用动作逻辑
        return FloatingActionButton(
          onPressed: (){
            callback();
            print(StoreProvider.of<CountState>(context).state.count);
            if(StoreProvider.of<CountState>(context).state.count>5){
              Navigator.of(self).pushNamed("/next_in_redux");
            }
          },
          tooltip: 'Increment',
          shape: StarBorder(),
          child: Icon(Icons.add),
        );
      },
    );

    var btnMinus = StoreConnector<CountState, VoidCallback>(
      converter: (store) {
        return () => store.dispatch(Actions.decrement); //分发动作
      },
      builder: (context, callback) {
        //构造器，使用动作逻辑
        return FloatingActionButton(
          onPressed: callback,
          heroTag: "TMD",
          tooltip: 'Increment',
          shape: StarBorder(),
          child: Icon(Icons.remove),
        );
      },
    );

    return Wrap(
      children: <Widget>[btnAdd,btnMinus],
    );
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
    var count = StoreProvider.of<CountState>(context).state.count; //获取值
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
