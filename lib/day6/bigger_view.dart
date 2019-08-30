import 'dart:async';
import 'dart:ui' as ui;
import 'dart:math';

import 'package:flutter/material.dart';

/// 图片放大镜的配置类,将图片提供器中的[image],
/// 在半径为[radius]的[outlineColor]色圆中局部放大比例[rate]倍,
class BiggerConfig{
  double rate;
  ImageProvider image;
  double radius;
  Color outlineColor;
  bool isClip;
  BiggerConfig({this.rate=3, @required this.image,this.isClip=true,
    this.radius=30, this.outlineColor=Colors.white});
}

class BiggerView extends StatefulWidget {
  BiggerView({Key key, @required this.config,}) : super(key: key);

  final BiggerConfig config;
  ui.Image _imageUI;
  @override
  _BiggerViewState createState() => _BiggerViewState();
}

class _BiggerViewState extends State<BiggerView> {
  ui.Image _imageUI;
  var posX = 0.0;
  var posY = 0.0;
  bool canDraw=false;

  @override
  void initState() {
    loadImage(widget.config.image).then((image) {
      _imageUI = image;
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width=_imageUI != null ? _imageUI.width.toDouble() / widget.config.rate : 0.0;
    var height= _imageUI != null ? _imageUI.height.toDouble() / widget.config.rate : 0.0;
    var show = Container(
      child: CustomPaint(
        painter: BiggerPainter(_imageUI, posX, posY,canDraw,widget.config.radius,widget.config.rate,widget.config.isClip),
      ),
      width: width,
      height:height,
    );
    return GestureDetector(
      child: show,
      onPanDown: (detail) {
        posX = detail.localPosition.dx;
        posY = detail.localPosition.dy;
        canDraw=true;
        setState(() {});
      },
      onPanUpdate: (detail) {
        posX = detail.localPosition.dx;
        posY = detail.localPosition.dy;
        if(judgeRectArea(posX,posY,width+2,height+2)){
          setState(() {});
        }
      },
      onPanEnd: (detail){
        canDraw=false;
        setState(() {});
      },
    );
  }
  //判断落点是否在矩形区域
   bool judgeRectArea(double dstX, double dstY, double w, double h) {
    return (dstX - w/2).abs() < w / 2 && (dstY - h/2).abs() < h / 2;
  }
}

Future<ui.Image> loadImage(ImageProvider provider){
  Completer<ui.Image> completer = Completer<ui.Image>();
  ImageStreamListener listener;
  ImageStream stream = provider.resolve(ImageConfiguration());
  listener = ImageStreamListener((info, syno) {
    final ui.Image image = info.image;
    completer.complete(image);
    stream.removeListener(listener);
  });
  stream.addListener(listener);
  return completer.future;
}

class BiggerPainter extends CustomPainter {
  final ui.Image _img;//图片
  Paint mainPaint;//主画笔
  Path circlePath;//圆路径
  double _x;//触点x
  double _y;//触点y
  double _radius;//圆形放大区域
  double _rate;//放大倍率
  bool _canDraw;//是否绘制放大图
  bool _isClip;//是否是裁切模式
  BiggerPainter(this._img, this._x, this._y,this._canDraw,this._radius,this._rate,this._isClip) {
    mainPaint = Paint()..color = Colors.white..style=PaintingStyle.stroke..strokeWidth=1;
    circlePath=Path();
  }
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    canvas.clipRect(rect); //裁剪区域
    if (_img != null) {
      Rect src = Rect.fromLTRB(0, 0, _img.width.toDouble(), _img.height.toDouble());
      canvas.drawImageRect(_img, src, rect, mainPaint);
      if(_canDraw){
        var tempY=_y;
        _y = _y > 2 * _radius ? _y - 2 * _radius : _y +  _radius;
        circlePath.addOval(Rect.fromCircle(center: Offset(_x, _y),radius:_radius ));
        if(_isClip){
          canvas.save();
          canvas.clipPath(circlePath);
          canvas.drawImage(_img, Offset(-_x * (_rate - 1), -tempY * (_rate - 1)), mainPaint);
          canvas.drawPath(circlePath, mainPaint);
        }else{
          canvas.drawImage(_img, Offset(-_x * (_rate - 1), -tempY * (_rate - 1)), mainPaint);
        }
      }
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
/// 测试
var show = Center(
  child: BiggerView(
    config: BiggerConfig(image: AssetImage("images/sabar.jpg"),rate: 3,isClip: false),
  ),
);
