import 'package:flutter/material.dart';

import 'high_light_code.dart';
import 'md_panel.dart';


class CodeWidget extends StatelessWidget {

  CodeWidget({Key key,this.code}):super(key:key);

  final String code;

  @override
  Widget build(BuildContext context) {
    final SyntaxHighlighterStyle style =
    Theme.of(context).brightness == Brightness.dark
        ? SyntaxHighlighterStyle.darkThemeStyle()
        : SyntaxHighlighterStyle.lightThemeStyle();

    Widget body;
    if (code == null) {
      body = const Center(child: CircularProgressIndicator());
    } else {
      Widget _codeWidget;
      try{
        DartSyntaxHighlighter(style).format(code);
        _codeWidget = RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 10.0),
            children: <TextSpan>[
              DartSyntaxHighlighter(style).format(code)
            ],),
        );
      }catch (err){
        _codeWidget = Text(code);
      }
      body = SingleChildScrollView(
          child: MdPanel(child:_codeWidget),
      );
    }

    return body;
  }
}
