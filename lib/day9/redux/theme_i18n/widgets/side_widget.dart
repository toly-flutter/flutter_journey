
import 'package:flutter/material.dart';
import 'package:flutter_journey/day9/redux/theme_i18n/widgets/color_choser.dart';
import 'package:flutter_journey/day9/redux/theme_i18n/redux.dart';

import 'package:flutter_redux/flutter_redux.dart';

import '../cons.dart';

class SideWidget extends StatefulWidget {
  @override
  _SideWidgetState createState() => _SideWidgetState();
}

class _SideWidgetState extends State<SideWidget> {
  @override
  Widget build(BuildContext context) {
    var top = Opacity(opacity: 0.8,
      child: Container(height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/wy_300x200_filter.jpg"),
                  fit: BoxFit.cover))),
    );

    var colors = StoreBuilder<AppState>(//创建颜色节点
        builder: (context, store) {
          return ColorChooser(
            colors: Cons.THEME_COLORS,
            onChecked: (c) {
              print(c.toString());
              ThemeData themeData = ThemeData(primarySwatch: c);
              store.dispatch( ActionSwitchTheme(themeData)); //分发动作
            },
          );
        });

    var show = Column(
      children: <Widget>[top, SizedBox(height: 20,), colors],
    );
    return Drawer(elevation: 5, child:show);
  }
}
