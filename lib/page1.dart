import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'transition_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_t/counter.dart';
import 'package:flutter_t/login.dart';

class Page1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Page1();
  }
}

final TIME_2_SECONDS = const Duration(seconds: 2);

class _Page1 extends State<Page1> with SingleTickerProviderStateMixin {
  bool canReturn = false;
  Animation<double> _animation;
  AnimationController _controller;

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
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
    ..addListener(() {
      setState(() {

      });
    });
  }

  // Future waitSeconds(seconds) {
  //   var completer = new Completer();
  //   Duration d = new Duration(seconds: seconds);
  //   Timer(d, completer.complete);
  //   return completer.future;
  // }

  void changeAnimation() {
    _animation = CurvedAnimation(curve: Curves.elasticOut, parent: _controller)
    ..addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('First Screen' + _animation.value.toString()),
        ),
        body: new Center(
          child: RotationTransition(
            turns: _animation,
            child: Login()
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


// RaisedButton(
//               child: Text('Launch counter'),
//               onPressed: () async {
//                 this.changeAnimation();
//                 if (_controller.status == AnimationStatus.completed) {
//                   _controller.reset();
//                 }
//                 _controller.forward();
//                 await waitSeconds(1);
//                 Navigator.push(
//                   context,
//                   new XTransitionRoute(widget: new CounterX()),
//                 );
//               },
//             ),