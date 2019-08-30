import 'dart:io';

main(){
  var dir="/Volumes/coder/Project/Flutter/flutter_journey/lib/day8/redux/theme_i18n/i18n/";

  var dataFile=File (dir+"data.dart");

  String i18n="""
  /// Power By 张风捷特烈--- Generated file. Do not edit.
  import 'package:flutter/material.dart';
  import 'data.dart';

  class I18N {
  final Locale locale;
  I18N(this.locale);
  static Map<String, Map<String,String>> _localizedValues = {
    'en': Data.EN,//英文
    'zh': Data.ZN,//中文
  };
  static I18N of(BuildContext context) {
    return Localizations.of(context, I18N);
  }
  """;
  String result="";
  var data=dataFile.readAsStringSync().split("=")[1].split(";")[0];
  var pices= data.split(",");
  for(var i = 0 ; i < pices.length ; i++) {
    var temp= pices[i].split(":")[0];
    if(temp.contains("\"")){
      var attr=temp.split("\"")[1];
      result+="get ${attr} {\n return _localizedValues[locale.languageCode]['${attr}'];}\n";
    }
  }
  i18n+="$result}";

  var file=File(dir+"i18n.dart");
  if(!file.existsSync()){
    file.createSync(recursive: true);
  }
  file.writeAsStringSync(i18n);

  var del="""
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
  """;
  var fileDel=File(dir+"i18n_delegate.dart");
  if(!fileDel.existsSync()){
    fileDel.createSync(recursive: true);
  }
  fileDel.writeAsStringSync(del);
}