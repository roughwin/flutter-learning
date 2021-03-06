import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_t/actions.dart';
// import 'package:redux/redux.dart';


class IncrBtn extends StatelessWidget {

  final Actions action;
  final IconData icon;
  final String tag;
  IncrBtn({this.action, this.icon = Icons.add, this.tag });

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<int, VoidCallback>(
      converter: (store) {
        // Return a `VoidCallback`, which is a fancy name for a function
        // with no parameters. It only dispatches an Increment action.
        return () => store.dispatch(action);
      },
      builder: (context, callback) {
        return new FloatingActionButton(
          // Attach the `callback` to the `onPressed` attribute
          heroTag: tag,
          onPressed: callback,
          tooltip: 'Increment',
          child: new Icon(icon),
        );
      },
    );
  }
}