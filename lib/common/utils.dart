import 'dart:math';

import 'dart:ui';
///简单随机色
///
Color randomRGB() {
  Random random = Random();
  int r = 30 + random.nextInt(200);
  int g = 30 + random.nextInt(200);
  int b = 30 + random.nextInt(200);
  return Color.fromARGB(255, r, g, b);
}
