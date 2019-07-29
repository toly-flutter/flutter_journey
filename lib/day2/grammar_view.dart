import 'package:flutter/material.dart';
import 'package:flutter_journey/utils/_toly_utils.dart';

class GrammarView extends CustomPainter {
  Paint mPaint; //画笔对象
  Path mPath;//路径

  GrammarView() {
    mPaint = Paint(); //创建画笔对象
    mPath=Path();
//    Animatable
    mPaint.isAntiAlias = true; //抗锯齿
    mPaint.style = PaintingStyle.stroke; //线条
    mPaint.strokeWidth = 2; //线条粗细
    mPaint.color=getColor("紫罗兰");

//    ---->[情景1:曾经的写法]----
//    var paint = Paint();
//    paint.strokeCap = StrokeCap.round;
//    paint.style = PaintingStyle.stroke; //画线条
//    paint.color = Color(0xffBBC3C5); //画笔颜色
//    paint.isAntiAlias = true; //抗锯齿
//    paint.filterQuality =  FilterQuality.high; //抗锯齿
//
//    ---->[情景2:级联的写法]----
//    paint
//    ..strokeCap = StrokeCap.round
//    ..style = PaintingStyle.stroke //画线条
//    ..color = Color(0xffBBC3C5) //画笔颜色
//    ..isAntiAlias = true //抗锯齿
//    ..filterQuality = FilterQuality.high;










































  }

  @override
  void paint(Canvas canvas, Size size) {

    var size=Size(100,100);
    print(size.isInfinite);//false
    var size2= Size(10,20);
    print(size>size2);//true
    print(size.hashCode);

    mPath.addOval(Rect.fromCircle(radius: 15.0, center: Offset(15, 15))); //小球路径
    for (int i = 0; i < 10; i++) {
      if (i.isOdd) {
        continue;
      }
      canvas.translate(35, 0);
      canvas.drawPath(mPath, mPaint..color=randomColor()); //使用path绘制

    }


//    for (int i = 0; i < 10; i++) {
//        if(i.isOdd){
//          mPaint.color = Colors.red; //画笔颜色
//        }else if(i<4){
//          mPaint.color = Colors.blue; //画笔颜色
//        }else{
//          mPaint.color = Colors.green; //画笔颜色
//        }
//        canvas.translate(35, 0);
//        canvas.drawPath(mPath, mPaint); //使用path绘制
//    }


//    var i = 0;
//    do{
//        i++;
//    }while(i < 10);
//
//    while (i < 10) {
//       i++;
//    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // 是否应该重新绘制
    return true;
  }
}

/// 根据中文[cn]获得颜色
Color getColor(String cn){

  Color color=Colors.blue;
  switch(cn){
    case "红":
      color=Colors.red;
      break;
    case "黄":
      color=Colors.yellow;
      break;
    case "蓝":
      color=Colors.blue;
      break;
    case "紫罗兰":
      color=Color(0xFFC000FF);
      break;
  }
  return color;
}
