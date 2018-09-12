import 'package:flutter/material.dart';
import 'package:flutter_t/actions.dart';
import 'package:flutter_t/incr_btn.dart';
import 'package:flutter_t/count_disp.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CounterA extends StatelessWidget {

  final WillPopCallback handleWillPop;

  CounterA({ @required this.handleWillPop });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: this.handleWillPop,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('test'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text(
                'You have pushed the button this many times:',
              ),
              new CountDisp(),
              new IncrBtn(action: Actions.Increment, icon: Icons.exposure_plus_1, tag: 'incr'),
              new IncrBtn(action: Actions.Decreasement, icon: Icons.exposure_neg_1, tag: 'dec'),
              new IncrBtn(action: Actions.Clear, icon: Icons.explicit, tag: 'clear'),
            ],
          ),
        ),
      ),
    );
    
  }
}

class CounterX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<int, VoidCallback>(
      converter: (store) {
        return () => store.dispatch(Actions.Clear);
      },
      builder: (context, callback) {
        return CounterA( handleWillPop: () async { callback(); return true; },);
      },
    );
  }
}


