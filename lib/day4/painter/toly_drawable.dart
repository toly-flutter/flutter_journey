
import 'package:flutter/material.dart';

class TolyDrawable {
  Color color;//颜色
  Offset pos;//位置

  TolyDrawable(this.color,this.pos);
}

class TolyCicle extends TolyDrawable{
  double radius;//大小

  TolyCicle(Color color, Offset pos,{this.radius=1}) : super(color, pos);

}