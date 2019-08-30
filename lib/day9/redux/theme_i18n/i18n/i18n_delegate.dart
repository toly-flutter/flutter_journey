///Power By 张风捷特烈--- Generated file. Do not edit.
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'i18n.dart';

///多语言代理类
class I18nDelegate extends LocalizationsDelegate<I18N> {
  I18nDelegate();
  @override
  bool isSupported(Locale locale) {
    ///设置支持的语言
    return ['en', 'zh'].contains(locale.languageCode);
  }
  ///加载当前语言下的字符串
  @override
  Future<I18N> load(Locale locale) {
    return  SynchronousFuture<I18N>( I18N(locale));
  }
  @override
  bool shouldReload(LocalizationsDelegate<I18N> old) {
    return false;
  }
  ///全局静态的代理
  static I18nDelegate delegate =  I18nDelegate();
}
  