import 'package:flutter/material.dart';

import '../../iconfont.dart';

class Cons{
  static const TABS = <String>["Stateful", "Stateless", "Dialog","nav&Bar",]; //标题列表
  static const  ICONS_MAP = {
    "首页": Icons.home,
    "动态":Icons.toys,
    "搜索": Icons.search,
    "iOS":TolyIcon.ios,
    "Android":Icons.android,
  };
  static final  BOX_50X50 = Container(
    alignment: Alignment.center,
    width: 50,
    height: 50,
    color: Colors.cyanAccent,
    child: Text("捷"),
  );
  static const MENU_INFO = <String>["关于", "帮助", "问题反馈"];
}