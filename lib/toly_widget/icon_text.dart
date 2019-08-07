import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  IconText(
      {Key key,
      @required this.text,
      @required this.icon,
      this.style,
      this.maxLines = 2,
      this.iconColor = Colors.black,
      this.iconSize = 40,
      this.gap = 5})
      : super(key: key);

  final String text;
  final TextStyle style;
  final double gap;
  final IconData icon;
  final Color iconColor;
  final int maxLines;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    var span = TextSpan(
      children: <InlineSpan>[
        WidgetSpan(
            //使用WidgetSpan添加一个组件
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.ideographic,
            child: Padding(
              padding: EdgeInsets.only(right: gap),
              child: Icon(icon, color: iconColor, size: this.iconSize),
            )),
        TextSpan(
          text: text,
          style: this.style,
        ),
      ],
    );
    return RichText(
      text: span,
      maxLines: this.maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
