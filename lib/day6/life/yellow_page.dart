import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_journey/day6/life/life_page.dart';

class YellowPage extends StatefulWidget {
  YellowPage({
    Key key,
  }) : super(key: key);

  @override
  _YellowPageState createState() => _YellowPageState();
}

class _YellowPageState extends State<YellowPage> {
  int count = 0;

  _YellowPageState() {
    print("YellowPage---构造函数");
  }

  @override
  void initState() {
    print("YellowPage--initState");
    super.initState();
  }

  @override//组件状态改变时候调用，可能会调用多次
  void didUpdateWidget(YellowPage oldWidget) {
    print("YellowPage---didUpdateWidget");
    super.didUpdateWidget(oldWidget);

  }

  @override//当State对象从树中被移除时，会调用此回调。
  void deactivate() {
    print("YellowPage--deactivate");
    super.deactivate();
  }

  @override//它主要是用于构建Widget子树的
  Widget build(BuildContext context) {
    print("YellowPage--build $count");

    var box=Container(
      padding: EdgeInsets.only(top: 30),
      alignment: Alignment.topCenter,
      color: Colors.yellow,
      child: CountWidget(count: count,child: TextWidget(),),
    );
    return InkWell(child: box,onTap: (){
      setState(() {
        count++; //进度增加
      });
    },);
  }

  @override//当State对象的依赖发生变化时会被调用；
  void didChangeDependencies() {
    print("YellowPage--didChangeDependencies");
    super.didChangeDependencies();
  }


  @override//
  void reassemble() {
    print("YellowPage--reassemble");
    super.reassemble();
  }

  @override//当State对象从树中被永久移除时调用；通常在此回调中释放资源
  void dispose() {
    print("YellowPage--dispose");
    super.dispose();
  }
}

class CountWidget extends InheritedWidget{
  final int count;

  CountWidget({@required this.count,Widget child}) : super(child: child);

  //定义一个方法，方便子树中的widget获取这个widget，进而获得共享数据。
  static CountWidget of(BuildContext context){
    /**
     * 获取最近的给定类型的Widget，该widget必须是InheritedWidget的子类，
     * 并向该widget注册传入的context，当该widget改变时，
     * 这个context会重新构建以便从该widget获得新的值。
     * 这就是child向InheritedWidget注册的方法。
     */
    return context.inheritFromWidgetOfExactType(CountWidget);
  }

  /**
   * framework通过使用以前占据树中的这个位置的小部件作为参数调用这个函数来区分这些情况。
   */
  @override
  bool updateShouldNotify(CountWidget oldWidget) {
    return oldWidget.count != count;
  }
}

class TextWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TextWidgetState();
  }
}
class _TextWidgetState extends State<TextWidget>{
  @override
  Widget build(BuildContext context) {
    return Text(
        CountWidget.of(context).count.toString()
    );
  }

  /**
   * 如果依赖的InheritedWidget改变了，framework将会调用这个方法来通知这个对象。
   * 在这个方法中调用BuildContext.inheritFromWidgetOfExactType是安全的。
   * 子类很少覆写这个方法，因为framework通常会在依赖的InheritedWidget改变后调用build方法，
   * 覆写这个方法通常用来做一些耗时的工作，比如网络请求
   */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependencies change${CountWidget.of(context).count.toString()}");
  }
}