import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'i18n.dart';

///多语言代理类
class I18nDelegate extends LocalizationsDelegate<I18N> {
  I18nDelegate();
  @override
  bool isSupported(Locale locale) {
    ///支持中文和英语
    return ['en', 'zh'].contains(locale.languageCode);
  }
  ///根据locale，创建一个对象用于提供当前locale下的文本显示
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

///自定义多语言实现
class AppLocalizations {

}
