import 'dart:math';

import 'package:flutter/material.dart';

class AnimPage extends StatefulWidget {
  @override
  _AnimPageState createState() => _AnimPageState();
}

class _AnimPageState extends State<AnimPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Color> animation;

  Star _star;

  @override
  void initState() {
    _star=Star(5, 100, 60,Colors.red);

    //
    super.initState();
    controller = AnimationController(//创建 Animation对象
        duration: const Duration(milliseconds: 2000), //时长
        vsync: this);

    var colorTween = ColorTween(begin: Colors.red, end: Colors.yellow); //创建从红到黄变化的Animatable对象
    animation = colorTween.animate(controller); //执行animate方法，生成


    animation.addListener(() {
      render(_star,animation.value);
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
        painter: AnimView(_star),
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

  //核心渲染方法
  void render(Star star, Color value) {
    star.color=value;
    setState(() {//更新组件

    });
  }
}


class Star{
  double R;
  double r;
  int num;
  Color color;
  Star(this.num,this.R,this.r,this.color);
}

class AnimView extends CustomPainter {

  Star _star;
  Paint mPaint;
  Paint gridPaint;

  AnimView(this._star) {
    mPaint = new Paint();
    gridPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.cyanAccent;
    mPaint.color = Colors.deepOrange;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(gridPath(area: Size(500, 1000)), gridPaint);

    canvas.translate(200, 200);

    _drawStar(canvas,_star);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void _drawStar(Canvas canvas, Star star) {
    canvas.drawPath(nStarPath(star.num, star.R, star.r), mPaint..color=star.color);
  }
}

/// 可以创建一个外接圆半径为[R],内接圆半径半径为[r]的[num]角星,
Path nStarPath(int num, double R, double r) {
  Path path = new Path();
  double perDeg = 360 / num;
  double degA = perDeg / 2 / 2;
  double degB = (360 / (num - 1) - degA) / 2 + degA;

  path.moveTo(cos(_rad(degA)) * R, (-sin(_rad(degA)) * R));
  for (int i = 0; i < num; i++) {
    path.lineTo(
        cos(_rad(degA + perDeg * i)) * R, -sin(_rad(degA + perDeg * i)) * R);
    path.lineTo(
        cos(_rad(degB + perDeg * i)) * r, -sin(_rad(degB + perDeg * i)) * r);
  }
  path.close();
  return path;
}

double _rad(double deg) {
  return deg * pi / 180;
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
