import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_journey/day8/redux/theam_i18n/i18n/i18n_delegate.dart';
import 'package:flutter_journey/day8/redux/theam_i18n/redux.dart';
import 'package:flutter_journey/day8/redux/theam_i18n/widgets/side_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'i18n/i18n.dart';

class SwitchThemeRedux extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var app = StoreBuilder<AppState>(builder: (context, store) {
      return MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            I18nDelegate.delegate,//添加
          ],
        locale: store.state.locale,
        supportedLocales: [
          store.state.locale
        ],
        theme: store.state.themeData,
        home: HomePage(),
      );
    });

    return StoreProvider(
        store: Store<AppState>(
          appReducer,
          initialState:
              AppState(
                  themeData: ThemeData(primaryColor: Colors.blue),
                  locale: Locale('zh', 'CH')
              ),
        ),
        child:app);
  }
}

bool en=true;
class HomePage extends StatelessWidget {
  HomePage({Key key}) :super(key: key);
  @override
  Widget build(BuildContext context) {
    return  StoreBuilder<AppState>(builder: (context, store) {
      ///通过 StoreBuilder 和 Localizations 实现实时多语言切换
      return  Localizations.override(
        context: context,
        locale: store.state.locale,
        child: Scaffold(
          drawer: SideWidget(),
          appBar: AppBar(
            title: Text("${I18N.of(context).appBarTitle}",),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              print(en);
              store.dispatch(ActionI18N(en?Locale('en', 'US'):Locale('zh', 'CH')));
              en=!en;
            },
            child: Icon(Icons.add),
          ),
          body: Center(child: Text(
            "${I18N.of(context).content}",
            style:
            TextStyle(color: store.state.themeData.primaryColor, fontSize: 30),
          ),),
        ),
      );
    });
  }
}