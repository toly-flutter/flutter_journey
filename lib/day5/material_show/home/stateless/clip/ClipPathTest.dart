import 'package:flutter/material.dart';
import 'package:flutter_journey/day5/material_show/cons.dart';
import 'package:flutter_journey/utils/common_path.dart';

class ClipPathTest extends StatelessWidget {
  ClipPathTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var clipPath = ClipPath(
      child: Cons.BOX_50X50,
      clipper: StarClipper(),
    );
    return clipPath;
  }
}

class StarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    return nStarPath(8, 25, 20, dx: 25, dy: 25);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

