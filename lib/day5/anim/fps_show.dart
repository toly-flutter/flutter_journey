import 'package:flutter/material.dart';
class FpsShow extends StatefulWidget {
  @override
  _FpsShowState createState() => _FpsShowState();
}

class _FpsShowState extends State<FpsShow> with SingleTickerProviderStateMixin{
  String _fps='';

  AnimationController controller;

  var _oldTime = DateTime.now().millisecondsSinceEpoch;//首次运行时时间

  @override
  void initState() {

    controller =//创建AnimationController对象
    AnimationController(duration: Duration(days: 999 * 365), vsync: this);

    controller.addListener(() {//添加监听,执行渲染
      _render();
    });

    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose(); // 资源释放
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment(-0.98,0.98),child: Text("FPS:$_fps"),);
  }

  //渲染方法，更新状态
  _render() {
    setState(() {
      var now = DateTime.now().millisecondsSinceEpoch;//新时间
      var dt=now - _oldTime;//两次刷新间隔的毫秒值
      _fps=(1000/dt).toStringAsFixed(1);//1000毫秒可以刷新多少次及FPS
      print("_fps:$_fps-----------value:${controller.value}");
      _oldTime = now;//重新赋值
    });
  }
}
