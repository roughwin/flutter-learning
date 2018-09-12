import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_t/actions.dart';
import 'page1.dart';


int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  }
  if (action == Actions.Decreasement) {
    return state - 1;
  }

  return state;
}

void main() {
  final store = new Store<int>(counterReducer, initialState: 0);

  runApp(new FlutterReduxApp(
    title: 'Flutter Redux Demo',
    store: store,
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<int> store;
  final String title;

  FlutterReduxApp({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<int>(
      store: store,
      child: new MaterialApp(
        theme: new ThemeData.light(),
        title: title,
        home: Page1(),
      ),
    );
  }
}