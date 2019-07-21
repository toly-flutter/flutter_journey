import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AnimPage extends StatefulWidget {
  @override
  _AnimPageState createState() => _AnimPageState();
}

class _AnimPageState extends State<AnimPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  List<Offset> _points=[];//点集

  @override
  void initState() {
    super.initState();
    controller = AnimationController(//创建 Animation对象
        duration: const Duration(milliseconds: 2000), //时长
        vsync: this);



    var curveTween = CurveTween(curve:Curves.bounceInOut);

    var tween = Tween(begin: 25.0, end: 150.0); //创建从25到150变化的Animatable对象
    animation = tween.animate(curveTween.animate(controller)); //执行animate方法，生成
    animation.addListener(() {
      render(_points,animation.value);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose(); // 资源释放
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter之旅"),
      ),
      body: CustomPaint(
        painter: AnimView(_points),//入参
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward(); //执行动画
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  double x=0;
  //核心渲染方法,将值加入集合中并渲染
  void render(List<Offset> _points, double value) {
    _points.add(Offset(x, -value));
    x++;
    setState(() {//更新组件
    });
  }
}


class AnimView extends CustomPainter {

  List<Offset> _points;
  Paint mPaint;
  Paint gridPaint;

  AnimView(this._points) {
    mPaint = new Paint();
    gridPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.cyanAccent;
    mPaint..color = Colors.deepOrange..strokeWidth=3;
  }

  @override
  void paint(Canvas canvas, Size size) {


    canvas.drawPath(gridPath(area: Size(500, 1000)), gridPaint);
    canvas.translate(200,200);
    canvas.drawCircle(Offset(0, 0), 2.5, gridPaint..color=Colors.black..style=PaintingStyle.fill);
    _drawStar(canvas,_points);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void _drawStar(Canvas canvas, List<Offset> pos) {

    canvas.drawPoints(PointMode.lines, pos, mPaint);

    

  }
}

///创建一个区域是[area]，小格边长为[step]的网格的路径
Path gridPath({double step = 20, Size area}) {
  Path path = Path();
  for (int i = 0; i < area.height / step + 1; i++) {
    //画横线
    path.moveTo(0, step * i); //移动画笔
    path.lineTo(area.width, step * i); //画直线
  }

  for (int i = 0; i < area.width / step + 1; i++) {
    //画纵线
    path.moveTo(step * i, 0);
    path.lineTo(step * i, area.height);
  }
  return path;
}
