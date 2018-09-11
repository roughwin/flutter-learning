import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_t/count_disp.dart';
import 'package:flutter_t/incr_btn.dart';
import 'package:flutter_t/actions.dart';
import 'page1.dart';

// One simple action: Increment
// enum Actions { Increment }

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
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
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
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
        initialRoute: '/',
        routes: {
          '/': (context) => Page1(),
          '/2': (context) => Page2(),
        },
        title: title,
        // home: new Scaffold(
        //   appBar: new AppBar(
        //     title: new Text(title),
        //   ),
        //   body: new Center(
        //     child: new Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         new Text(
        //           'You have pushed the button this many times:',
        //         ),
        //         new CountDisp(),
        //         new IncrBtn(action: Actions.Increment, icon: Icons.exposure_plus_1),
        //         new IncrBtn(action: Actions.Decreasement, icon: Icons.exposure_neg_1),
        //       ],
        //     ),
        //   ),
        //   // floatingActionButton: new IncrBtn(),
        // ),
      ),
    );
  }
}