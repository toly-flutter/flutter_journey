import 'package:flutter/material.dart';
import 'package:flutter_journey/utils/common_path.dart';

class StarAnimWidget extends StatefulWidget {
  final Size size;

  StarAnimWidget({Key key, this.size}) : super(key: key);

  @override
  _StarAnimWidgetState createState() => _StarAnimWidgetState();
}

class _StarAnimWidgetState extends State<StarAnimWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  Animation<int> intAnimation; //int型
  Animation<Color> colorAnimation; //Color型

  Star _star;

  @override
  void initState() {
    _star = Star(5, widget.size.height / 2, widget.size.height / 4);
    super.initState();
    controller = AnimationController(
        //创建 Animation对象
        duration: const Duration(milliseconds: 2000), //时长
        vsync: this);

    //半径动画
    var tween = Tween(begin: 100.0, end: 20.0); //创建从25到150变化的Animatable对象
    animation = tween.animate(controller); //执行animate方法，生成
    animation.addListener(() {
//        render(_star,animation.value);
    });

    var curveTween = CurveTween(curve:Cubic(0.96, 0.13, 0.1, 1.2));//创建curveTween
    //角数动画
    intAnimation = IntTween(begin: 5, end: 98).animate(curveTween.animate(controller))
      ..addListener(() {
        renderNum(_star, intAnimation.value);
      });
    //颜色动画
    colorAnimation = ColorTween(begin: Colors.deepOrange, end: Colors.blue)
        .animate(controller)
          ..addListener(() {
            renderColor(_star, colorAnimation.value);
          });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose(); // 资源释放
  }

  @override
  Widget build(BuildContext context) {
    var show = SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: CustomPaint(
        painter: StarPainter(_star),
      ),
    );

    return InkWell(
      child: show,
      onTap: () {
        controller.forward(); //点击时执行动画
      },
      onDoubleTap: () {
        controller.stop(); //双击击时暂停动画
      },
    );
  }

  //核心渲染方法
  void render(Star star, num value) {
    setState(() {
      //更新组件
      star.R = value;
    });
  }

  //核心渲染方法
  void renderNum(Star star, num value) {
    setState(() {
      //更新组件
      star.num = value;
    });
  }

  //核心渲染方法
  void renderColor(Star star, Color value) {
    setState(() {
      //更新组件
      star.color = value;
    });
  }
}

class Star {
  double R; //外接圆半径
  double r; //内接圆半径
  int num; //角个数
  Color color;

  Star(this.num, this.R, this.r, {this.color = Colors.deepOrange});
}

class StarPainter extends CustomPainter {
  Star _star;
  Paint _paint;
  StarPainter(this._star) {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    canvas.clipRect(rect); //裁剪区域

    canvas.translate(rect.height / 2, rect.width / 2);
    _drawStar(canvas, _star);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void _drawStar(Canvas canvas, Star star) {
    canvas.drawPath(
        nStarPath(
          star.num,
          star.R,
          star.r,
        ),
        _paint..color = _star.color);
  }
}
