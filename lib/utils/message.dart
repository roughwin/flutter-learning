import 'package:flutter/material.dart';

void showSnackbar({ BuildContext context, String msg, SnackBarAction action }) {
  final snackBar = SnackBar(
    content: Text(msg),
    action: action,
  );
  Scaffold.of(context).showSnackBar(snackBar);
}