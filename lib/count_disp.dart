import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CountDisp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<Map, String>(
      converter: (store) => store.state['count'].toString(),
      builder: (context, count) {
        return new Text(
          count,
          style: Theme.of(context).textTheme.display1,
        );
      }
    );
  }
}