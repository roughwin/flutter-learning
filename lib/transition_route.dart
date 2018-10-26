import 'package:flutter/widgets.dart';

class XTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  XTransitionRoute({this.widget}) : super(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> sencondaryAnimation) {
      return widget;
    },
    transitionDuration: Duration(milliseconds: 2000),
    transitionsBuilder: (BuildContext context,  Animation<double> animation, Animation<double> sencondaryAnimation, Widget child) {
      final Animation curve = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
      return SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(curve),
        child: child,
      );
    },
  );
}