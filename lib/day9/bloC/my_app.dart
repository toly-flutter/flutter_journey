import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_journey/day5/anim/encapsulate/flutter_container.dart';
import 'package:flutter_journey/utils/color_utils.dart';
import 'package:flutter_journey/utils/common_path.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var app=MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'InheritedWidget Page'),
    );

    return BlocProvider<CounterBloc>(//包根节点
      builder: (context) => CounterBloc(),
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


enum CounterEvent {
  increment,//增加
  decrement//减少
}


class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;//初始值
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement://当是增加时
        yield currentState-1;
        break;
      case CounterEvent.increment://当是减少时
        yield currentState+1;
        break;
    }
  }
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
        decoration:
            BoxDecoration(
                color: randomColor(),
                borderRadius: BorderRadius.all(Radius.circular(20))));
    return child;
  }
}

//button
class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var text= BlocBuilder<CounterBloc, int>(
      builder: (context, count) {
        return Text('${count}', style: Theme.of(context).textTheme.display1,);
      },
    );

    var result = Wrap(
      spacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Icon(Icons.timer, color: Colors.blue, size: 30,),
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
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    var btnAdd = FloatingActionButton(
      onPressed: (){
          counterBloc.dispatch(CounterEvent.increment);//执行增加
      },
      child: Icon(Icons.add),
      elevation: 4,
      shape:StarBorder() ,
    );

    var btnMinus = FloatingActionButton(
      onPressed: (){
        counterBloc.dispatch(CounterEvent.decrement);//执行减少
      },
      child: Icon(Icons.remove),
      elevation: 4,
      shape:StarBorder() ,
    );
    return Wrap(children: <Widget>[btnAdd,btnMinus],);
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
    var r=rect.right/2;
    return nStarPath(12, r,r* cos((360 / 9 / 2)*pi / 180),dx: rect.height/2,dy: rect.width/2);
  }
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {

  }

  @override
  ShapeBorder scale(double t) {
    return null;
  }
}


///跳转界面
class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var text= BlocBuilder<CounterBloc, int>(
      builder: (context, count) {
        return Center(
          child: Text(
            'New Page,now count=${count}',
            style: Theme.of(context).textTheme.display1,
          ),
        );
      },
    );

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(appBar: AppBar(
            title: text)));
  }
}
