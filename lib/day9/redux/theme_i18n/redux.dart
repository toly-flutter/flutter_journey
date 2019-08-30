import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class AppState {
  final ThemeData themeData;//主题
  final Locale locale;//语言

  AppState({this.themeData, this.locale});
}

var themeDataReducer=TypedReducer((_, ActionSwitchTheme action) => action.themeData);
var localeReducer=TypedReducer((_, ActionI18N action) => action.locale);

AppState appReducer(AppState prev, dynamic action) {
  return AppState(
      themeData: themeDataReducer(prev.themeData, action),//处理切换主题
      locale: localeReducer(prev.locale, action));//处理切换语言
}

///切换主题
class ActionSwitchTheme {
  final ThemeData themeData;
  ActionSwitchTheme(this.themeData);
}

///切换语言
class ActionI18N {
  final Locale locale;
  ActionI18N(this.locale);
}
