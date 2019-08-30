import 'package:flutter/material.dart';
import 'package:flutter_journey/day5/material_show/cons.dart';

class ClipOvalTest extends StatelessWidget {
  ClipOvalTest({Key key}) :super(key: key);

  @override
  Widget build(BuildContext context) {

    var clipOval = ClipOval(//椭圆裁切
      child: Cons.BOX_50X50,
    );

    return clipOval;
  }

}