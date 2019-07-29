import 'dart:math';
abstract class Operable{
  void reflex();//反向
  void reflexX();//X反向
  void reflexY();//Y反向

  void scale(num xRate,num yRate);//缩放
  void translate(num dx,num dy);//平移
  void rotate(num deg,[isAnticlockwise=true]);//旋转
}

class Vector2 implements Operable{
  num x;
  num y;
  Vector2(this.x,this.y);

  Vector2.fromMap(Map<String,num> point){
    this.x = point['x'];
    this.y = point['y'];
  }

  @override
  void reflex() {
    this.x=-x;
    this.y=-y;
  }

  @override
  void reflexX() {
    this.x=-x;
  }

  @override
  void reflexY() {
    this.y=-y;
  }

  @override
  void rotate(num deg, [isAnticlockwise = true]) {
    var curRad = rad + deg*pi/180;
    this.x=distance*cos(curRad);
    this.y=distance*sin(curRad);
  }


  @override
  void scale(num xRate, num yRate) {
    this.x *=xRate;
    this.y *=yRate;
  }

  @override
  void translate(num dx, num dy) {
    this.x +=dx;
    this.y +=dy;
  }

  @override
  String toString() {
    return '(${this.x},${this.y}）';
  }

  double get distance => sqrt(x * x + y * y);//模
  double get rad=>atan2(y,x);//弧度
  double get angle=>rad*180/pi;//角度

  //运算符重载
  Vector2 operator +(Vector2 other) => Vector2(x + other.x, y + other.y);
  Vector2 operator -(Vector2 other) => Vector2(x - other.x, y - other.y);
  num operator *(Vector2 other) => x * other.x + y * other.y;

}

main(){
  var v1 = Vector2(3, 4);
  print(v1); //(3,4）
  print(v1.distance); //5.0
  print(v1.angle); //53.13010235415598
  v1.rotate(37);
  print(v1); //(-0.011353562466313798,4.0000058005648444）

  var v2 = Vector2.fromMap({'x': 5, 'y': 6});
  print(v2); //(5,6）
  v2.reflex();
  print(v2);//(-5,-6）

  var v3 = Vector2(2, 2);
  var v4 = Vector2(3, 2);
  print(v4 - v3); //(1,0）
  print(v4 + v3); //(5,4）
  print(v4 * v3); //10
}

