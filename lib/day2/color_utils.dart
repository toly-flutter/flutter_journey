import 'dart:math';
import 'dart:ui';

///
/// 用来返回一个随机色
///
Color randomColor(){
  var a = Random().nextInt(255);//透明度值
  var r = Random().nextInt(255);//红值
  var g = Random().nextInt(255);//绿值
  var b = Random().nextInt(255);//蓝值
  return Color.fromARGB(a, r, g, b);//生成argb模式的颜色
}
