import 'package:flutter/material.dart';
import 'data.dart';

class I18N {
  final Locale locale;
  I18N(this.locale);
  ///根据不同 locale.languageCode 加载不同语言对应
  ///GSYStringEn和GSYStringZh都继承了GSYStringBase
  static Map<String, Map<String,String>> _localizedValues = {
    'en': Data.EN,
    'zh': Data.ZN,
  };

  ///通过 Localizations 加载当前的 GSYLocalizations
  ///获取对应的 GSYStringBase
  static I18N of(BuildContext context) {
    return Localizations.of(context, I18N);
  }

  get appBarTitle{ //返回标题
    return _localizedValues[locale.languageCode]['appBarTitle'];
  }

  get content{//返回内容
    return _localizedValues[locale.languageCode]['content'];
  }
}