import 'package:flutter/material.dart';
import 'package:flutter_journey/day5/material_show/cons.dart';
class ClipRRectTest extends StatelessWidget {
  ClipRRectTest({Key key}) :super(key: key);

  @override
  Widget build(BuildContext context) {

    var clipRRect = ClipRRect(
      borderRadius: BorderRadius.all(Radius.elliptical(10, 15)),
      child: Cons.BOX_50X50,
    );

    return clipRRect;
  }

}