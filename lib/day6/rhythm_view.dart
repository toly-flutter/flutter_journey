import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

///配置类:宽[width]，高[height],动画时长[duration],线粗[lineWidth],最大振幅[maxA]
class RhythmConfig {
  double width;
  double height;
  int duration;
  double lineWidth;
  double maxA;
  RhythmConfig({this.width = 400, this.height = 200,
    this.duration = 2000,this.lineWidth=3,this.maxA=200});
}

class RhythmView extends StatefulWidget {
  RhythmView({Key key, this.config}) : super(key: key);
  final RhythmConfig config;

  @override
  _RhythmViewState createState() => _RhythmViewState();
}

class _RhythmViewState extends State<RhythmView>
    with SingleTickerProviderStateMixin {
  AnimationController controller; //动画控制器
  Animation<double> animation; //动画
  double fie = 0;
  double A=0; //振幅
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        ////创建 Animation对象
        duration: Duration(milliseconds: widget.config.duration), //时长
        vsync: this);
    animation = Tween(begin: 0.0, end: rad(360)).animate(controller)
      ..addListener(() {//动画监听
        setState(() {
          fie = animation.value;
          A = widget.config.maxA * (1 - animation.value / (2 * pi));
        });
      });

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: Container(
        width: widget.config.width,
        height: widget.config.height,
        child: CustomPaint(
          painter: RhythmPainter(fie, A,widget.config),
        )),onTap: (){
      widget.config.maxA=60*Random().nextDouble()+30;//随机设置最大浮度
      controller.reset();
      controller.forward(); //立即执行
    },);
  }
}

class RhythmPainter extends CustomPainter {
  double min; //最小x
  double max; //最大x
  double fie; //初相
  double A; //振幅
  double omg; //角频率
  Paint mPaint; //主画笔
  Path mPath; //主路径
  Path mReflexPath; //镜像路径
  RhythmConfig config; //镜像路径

  RhythmPainter(this.fie, this.A,this.config) {
    var colors =  [
    Color(0xFFF60C0C),//红
    Color(0xFFF3B913),//橙
    Color(0xFFE7F716),//黄
    Color(0xFF3DF30B),//绿
    Color(0xFF0DF6EF),//青
    Color(0xFF0829FB),//蓝
    Color(0xFFB709F4),//紫
  ];
   var pos = [1.0/ 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];
   var shader= ui.Gradient.linear(
       Offset(-config.width/2,0),Offset(config.width/2, 0)
       ,colors, pos,TileMode.repeated);

    //初始化主画笔
    mPaint = Paint()
      ..isAntiAlias = true
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = config.lineWidth;
    mPaint.shader=shader;//设置填色器
    //初始化主路径
    mPath = Path();
    mReflexPath = Path();
    max = config.width / 2;
    min = -config.width / 2;
    formPath();//形成路径
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    canvas.clipRect(rect); //裁剪区域
    canvas.translate(rect.width / 2, rect.height / 2);
    canvas.drawPath(mPath, mPaint);
    canvas.drawPath(mReflexPath, mPaint);
  }

  //根据渐息函数进行路径的生成
  void formPath() {
    mPath.moveTo(min, f(min));
    mReflexPath.moveTo(min, f(min));
    for (double x = min; x <= max; x+=config.lineWidth*2) {
      double y = f(x);
      mPath.lineTo(x, y);
      mReflexPath.lineTo(x, -y);
    }
  }

  //渐息函数
  double f(double x) {
    double len = max - min;
    double a = 4 / (4 + pow(rad(x / pi * 800 / len), 4));
    double aa = pow(a, 2.5);
    omg = 2 * pi / (rad(len) / 2);
    double y = aa * A * sin(omg * rad(x) - fie);
    return y;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

double rad(double deg) {
  return deg / 180 * pi;
}

var show = RhythmView(
  config: RhythmConfig(maxA: 59),
);
