import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_journey/day4/anim/widget/flutter_layout.dart';

class FlutterText extends Text {


  FlutterText(this.data, {
    Key key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.config,
  }) : super(data);

  Random random = Random();

  final String data;
  final TextStyle style;
  final StrutStyle strutStyle;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final Locale locale;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int maxLines;
  final String semanticsLabel;
  final TextWidthBasis textWidthBasis;
  final AnimConfig config;

  @override
  Widget build(BuildContext context) {
    var textZone = Row(
      children: _formChild(data),
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
    );

    return textZone;
  }

  _formChild(String str) {
    var li = <Widget>[];

    for (var i = 0; i < str.length; i++) {
      li.add(FlutterLayout(
        config: AnimConfig(duration: config.duration,offset: config.offset,mode: _dealRandom(),curveTween: config.curveTween),
        child: Text(
          str[i],
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
        ),
      ));
    }
    return li;
  }

  RockMode _dealRandom() {

    var modes = [RockMode.lean, RockMode.up_down, RockMode.left_right];
    return config.mode==RockMode.random?modes[random.nextInt(3)]:config.mode;
  }
}
