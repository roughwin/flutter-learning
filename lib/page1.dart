import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'transition_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_t/counter.dart';
import 'package:flutter_t/login.dart';
import 'drawer.dart' as dd;

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
        setState(() {});
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
        setState(() {});
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
          title: Text('First Screen' + _animation.value.toStringAsFixed(3)),
        ),
        body: new Center(
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            SizedBox(
              height: 200.0,
            ),
            Stack(
              alignment: Alignment(0.0, 0.0),
              overflow: Overflow.visible,
              children: <Widget> [
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 20.0,
                  child: Text('f')
                ),
                Positioned(
                  right: -5.0,
                  top: -5.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 10.0,
                    child: Text('1')
                  ),
                ),
                
              ]
            ),
            SizedBox(height: 20.0,),
            Hero(
              tag: 'HHHERO',
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 30.0,
                child: Text('Hello')
              ),
            ),
            RotationTransition(
              turns: _animation,
              child: RaisedButton(
                elevation: 1.0,
                child: Text('click'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                onPressed: () {
                  // Navigator.pushNamedAndRemoveUntil(context, '/drawer', (route) => false);
                  // Navigator.pushNamed(context, '/login');
                  Navigator.push(
                      context,
                      new XTransitionRoute(widget: new PageLogin()),
                   );
                },
              ),
            )
          ])),
        ),
      ),
    );
  }
}

class PageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Login());
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            ListTile(
              title: const Text('btn'),
              onTap: () {
                Navigator.push(
                  context,
                  new XTransitionRoute(widget: new CounterX()),
                );
              },
            ),
            Divider(),
            ListTile(
              title: const Text('btn2'),
              onTap: () {
                Navigator.push(
                  context,
                  new XTransitionRoute(widget: new dd.Drawer()),
                );
                // Navigator.pushNamed(context, '/drawer');
              },
            ),
          ]),
    );
  }
}
