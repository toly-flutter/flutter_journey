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
  get appBarTitle {
 return _localizedValues[locale.languageCode]['appBarTitle'];}
get content {
 return _localizedValues[locale.languageCode]['content'];}
}