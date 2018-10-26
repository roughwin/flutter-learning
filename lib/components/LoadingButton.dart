import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {

  bool isLoading = false;
  Widget child = new Text('button');
  Color color = Colors.blue;
  Function onPressed = () {};

  LoadingButton({
    bool this.isLoading = false,
    Widget this.child,
    Color this.color,
    Function this.onPressed
  });

  renderChild() {
    if (isLoading) {
      return SizedBox(
        height: 20.0,
        width: 20.0,
        child: CircularProgressIndicator(
          value: null,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        )
      );
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      child: renderChild(),
      onPressed: onPressed,
    );
  }
}