import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_t/transition_route.dart';
import 'package:redux/redux.dart';
import 'package:flutter_t/actions.dart';
// import 'package:flutter_t/transition_route.dart';
import 'page1.dart';
import 'scroll_page.dart';
import 'package:flutter_t/drawer.dart' as drawer;



void main() {
  final Store store = new Store<Map>(counterReducer, initialState: { 'count': 0 });
  runApp(new FlutterReduxApp(
    title: 'Flutter Redux Demo',
    store: store,
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<Map> store;
  final String title;

  FlutterReduxApp({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<Map>(
      store: store,
      child: new MaterialApp(
        theme: new ThemeData.light(),
        title: title,
        initialRoute: '/scroll',
        routes: {
          '/': (context) => Page1(),
          '/drawer': (context) => drawer.Drawer(),
          '/login': (context) => PageLogin(),
          '/scroll': (context) => ScrollPages(),
        },
        // home: Page1(),
      ),
    );
  }
}