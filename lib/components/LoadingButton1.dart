import 'package:flutter/material.dart';
import 'dart:async';

class LoadingButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingButton();
  }
}

class _LoadingButton extends State<LoadingButton> with TickerProviderStateMixin {

  Widget btnChild; // = Text('text', style: TextStyle(color: Colors.white),);
  Color btnColor; // = Colors.blue;
  double btnWidth;
  bool _loading = false;
  AnimationController _controller;
  Animation _animation;
  _LoadingButton({Widget child, Color color}) {
    this._loading = false;
    if(child != null) {
      this.btnChild = child;
    }
    if (color != null) {
      this.btnColor = color;
    }
  }
  void animateBtn() {
    setState(() {
      _loading = !_loading;
    });
    Timer(Duration(seconds: 3), () {
      setState(() {
        _loading = false;
      });
    });
    _controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animation = Tween(begin: 1.0, end: 0.0).animate(_controller)
    ..addListener(() {
      setState(() {
        btnWidth = _animation.value * 300.0;
      });
    });
    _controller.forward();
  }

  Widget renderBtnContent() {
    if (_loading) {
      return SizedBox(
        height: 20.0,
        width: 20.0,
        child: CircularProgressIndicator(
          value: null,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        )
      );
    }
    return Text('texttexttext', style: TextStyle(color: Colors.white, fontSize: 20.0));
  }

  @override
  Widget build(BuildContext context) {
      // TODO: implement build
      return 
        Container(
          width: 200.0,
          child: RaisedButton(
            padding: EdgeInsets.all(0.0),
            child: renderBtnContent(),
            color: Colors.blue,
            onPressed: () {
              if (_loading) return;
              print('on pressed');
              animateBtn();
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
          )
        
      );
    }
}