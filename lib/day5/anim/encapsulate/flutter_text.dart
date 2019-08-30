import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_journey/day5/anim/encapsulate/flutter_container.dart';

class FlutterText extends StatelessWidget {
  var str;
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

  FlutterText(this.str, {Key key,
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
    this.config,
    this.textWidthBasis,}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return _formChild(str);
  }

  _formChild(String str) {
    var li = <Widget>[];
    for (var i = 0; i < str.length; i++) {
      li.add(FlutterContainer(
        config: config,
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
    return Wrap(children: li,);
  }
}
