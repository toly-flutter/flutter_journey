import 'dart:math';
import 'dart:ui';


/**
 * n角星路径
 *
 * @param num 几角星
 * @param R   外接圆半径
 * @param r   内接圆半径
 * @return n角星路径
 */
/// 获得一个[num]角星，外接圆半径为[R],内接圆半径为[r],位移偏移[dx],[dy]的路径
Path nStarPath(Path path,int num, double R, double r, {dx = 0, dy = 0}) {
  double perDeg = 360 / num; //尖角的度数
  double degA = perDeg / 2 / 2;
  double degB = 360 / (num - 1) / 2 - degA / 2 + degA;
  path.moveTo(cos(rad(degA)) * R + dx, (-sin(rad(degA)) * R + dy));
  for (int i = 0; i < num; i++) {
    path.lineTo(cos(rad(degA + perDeg * i)) * R + dx,
        -sin(rad(degA + perDeg * i)) * R + dy);
    path.lineTo(cos(rad(degB + perDeg * i)) * r + dx,
        -sin(rad(degB + perDeg * i)) * r + dy);
  }
  path.close();
  return path;
}

double rad(double deg) {
  return deg * pi / 180;
}


Path gridPath(double step, Size area) {
  Path path = Path();
  for (int i = 0; i < area.height / step + 1; i++) {//画横线
    path.moveTo(0, step * i);//移动画笔
    path.lineTo(area.width, step * i);//画直线
  }
  for (int i = 0; i < area.width / step + 1; i++) {//画纵线
    path.moveTo(step * i, 0);
    path.lineTo(step * i, area.height);
  }
  return path;
}