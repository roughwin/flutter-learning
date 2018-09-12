import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CountDisp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<int, String>(
      converter: (store) => store.state.toString(),
      builder: (context, count) {
        return  new Text(
          count,
          style: Theme.of(context).textTheme.display1,
        );
      }
    );
  }
}