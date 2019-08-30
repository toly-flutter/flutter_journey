import 'package:flutter/material.dart';

class RedPage extends StatefulWidget {
  RedPage({
    Key key,
  }) : super(key: key);

  @override
  _RedPageState createState() => _RedPageState();
}

class _RedPageState extends State<RedPage> with WidgetsBindingObserver{
  int count = 0;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state.toString());
  }

  _RedPageState() {
    print("RedPage--构造函数");
  }

  @override
  void initState() {
    print("RedPage--initState");
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override//当State对象的依赖发生变化时会被调用；
  void didChangeDependencies() {
    print("RedPage--didChangeDependencies");
    super.didChangeDependencies();
  }


  @override//组件状态改变时候调用，可能会调用多次
  void didUpdateWidget(RedPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("RedPage--didUpdateWidget");
  }

  @override//
  void reassemble() {
    print("RedPage--reassemble");
    super.reassemble();
  }

  @override//它主要是用于构建Widget子树的
  Widget build(BuildContext context) {
    print("RedPage--build $count");

    var box=Container(
      padding: EdgeInsets.only(top: 30),
      alignment: Alignment.topCenter,
      color: Colors.red,
      child: Text('当前计数：$count',),
    );
    return count!=5?InkWell(child: box,onTap: (){
      setState(() {
        count++; //进度增加
        if(count==3){
          toApp(context);
        }
        if(count==4){

          showSimpleDialog(context);
        }
      });
    },):Text("hello");
  }

  @override//当State对象从树中被移除时，会调用此回调。
  void deactivate() {
    print("RedPage--deactivate");
    super.deactivate();
  }

  @override//当State对象从树中被永久移除时调用；通常在此回调中释放资源
  void dispose() {
    print("RedPage--dispose");
    super.dispose();
  }
}


//跳转到详情页
toApp(BuildContext context) {
  var app = MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Scaffold(
      appBar: AppBar(title: Text("跳转到的APP"),),
      body:Container(),
    ),
  );
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => app),
  );
}

showSimpleDialog(BuildContext context) {
  var strs = [
    "泽国江山入战图，生民何计乐樵苏。",
    "凭君莫话封侯事，一将功成万骨枯。",
    "传闻一战百神愁，两岸强兵过未休。",
    "谁道沧江总无事，近来长共血争流。"];
  var title = Row(
    //标题
    children: <Widget>[
      Image.asset("images/icon_lwj.png", width: 30, height: 30,),
      SizedBox(width: 10,),
      Text("己亥岁二首·曹松")],);
  showDialog(//内置方法，创建对话弹框
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: title,
          children: strs.map((str) {
            return SimpleDialogOption(
              child: Row(
                children: <Widget>[
                  Icon(Icons.turned_in_not, color: Colors.blue,),
                  Text(str)],),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          }).toList(),
        );
      });
}