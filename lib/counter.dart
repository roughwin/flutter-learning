import 'package:flutter/material.dart';
import 'package:flutter_t/actions.dart';
import 'package:flutter_t/incr_btn.dart';
import 'package:flutter_t/count_disp.dart';

class CounterX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ],
        ),
      ),
    );
  }
}

