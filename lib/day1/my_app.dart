import 'package:flutter/material.dart';
import 'package:flutter_journey/day1/clock_view.dart';

class MyApp extends StatelessWidget {
  // 这个组件是你应用的根组件
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //这是你应用的主题
        // 尝试用"flutter run"来运行你的应用，你将会看到应用有一个蓝色的toolbar。
        // 之后，不要退出应用，尝试将下面的primarySwatch改成Colors.green，再通过热启动（命令行里输入r,或直接在IDE中保存你的修改）
        // 可以看到计数器没有归零，你的应用没有重新启动
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: '粒子数字'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  //这个组件是你应用程序的主页面，他是有状态的。这意味着它有一个状态对象(定义如下)，其中包含影响其外观的字段。
  //这种类的状态基于配置。
  // 该类是状态的配置。它会持有一些值（如本例的title），这是由父组件提供的（如本例中的App组件），并由状态的构建方法使用。
  // Widget子类中的字段总是标记为“final”。
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
      body: CustomPaint(
        painter: ClockView(),
      ),
    );
  }
}
