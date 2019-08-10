import 'package:flutter/material.dart';

import 'cons.dart';

class PopMenu extends StatelessWidget {
  PopMenu({Key key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    var popupMenuButton = PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return Cons.MENU_INFO.map((e) {
          return PopupMenuItem(child: Text(e));
        }).toList();
      },
      onSelected: (i) {
        print(i);
      },
    );
    return popupMenuButton;
  }
}