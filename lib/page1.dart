import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'transition_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_t/counter.dart';

class Page1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Page1();
  }
}

final TIME_2_SECONDS = const Duration(seconds: 2);

class _Page1 extends State<Page1> {
  bool canReturn = false;

  Future<bool> _willPop() async {
    if (canReturn) return canReturn;
    canReturn = true;
    Fluttertoast.showToast(
      msg: "press back btn again to exit",
      toastLength: Toast.LENGTH_SHORT,
      bgcolor: 'black',
      textcolor: 'white',
      gravity: ToastGravity.BOTTOM,
    );
    new Timer(TIME_2_SECONDS, () {
      canReturn = false;
    });
    return false;
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('First Screen'),
        ),
        body: new Center(
          child: RaisedButton(
            child: Text('Launch counter'),
            onPressed: () {
              Navigator.push(
                context,
                new XTransitionRoute(widget: new CounterX()),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
