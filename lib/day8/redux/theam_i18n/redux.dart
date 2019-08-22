import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class AppState {
  final ThemeData themeData;//主题
  final Locale locale;//语言

  AppState({this.themeData, this.locale});
}

AppState appReducer(AppState prev, dynamic action) {
  return AppState(
      themeData: combineReducers<ThemeData>([//处理切换主题
        TypedReducer((_, ActionSwitchTheme action) =>
            action.themeData),
      ])(prev.themeData, action),
      locale: combineReducers<Locale>([//处理切换语言
        TypedReducer((_, ActionI18N action) => action.locale),
      ])(prev.locale, action));
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
