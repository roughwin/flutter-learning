import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_t/actions.dart';
import 'package:flutter_t/utils/request.dart' show request, RequestMethods;
import 'package:flutter_t/utils/message.dart' as message;
import 'package:flutter_t/components/LoadingButton.dart' show LoadingButton;

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  String token;
  @override
  void initState() {
    super.initState();
  }

  bool isLoading = false;

  var pairs = {
    'username': '',
    'passwd': '',
  };

  Function handleTextChange(key) {
    return (v) {
      pairs[key] = v;
      print(pairs);
    };
  }

  void handleSubmit(BuildContext context, Function callback) async {
    final url = 'http://v2.bcrm.smartstudy.tech/api/login';
    try {
      Map m = await request(RequestMethods.post, url,
          body: {"email": pairs['username'], "password": pairs['passwd']});
      // message.showSnackbar(context: context, msg: m['token']);
      final String token = m['token'];
      this.token = token;
      callback();
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    } catch (msg) {
      message.showSnackbar(context: context, msg: msg.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
        tag: 'hero',
        child: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 48.0,
            child: Text(
              'CRM',
              style: TextStyle(fontSize: 30.0, color: Colors.white),
            )));
    final userName = TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'username@innobuddy.com',
          // applyDefaults: 'bowenqing@innobuddy.com',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      onChanged: handleTextChange('username'),
    );
    final passwd = TextField(
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      onChanged: handleTextChange('passwd'),
      obscureText: true,
    );
    final loginBtn = StoreConnector<Map, VoidCallback>(
      converter: (store) {
        return () => store.dispatch({'type': Actions.SetToken, 'token': token});
      },
      builder: (context, callback) {
        return new Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: LoadingButton(
            child: Text('button s'),
            color: Colors.blue,
            isLoading: isLoading,
            onPressed: () {
              setState(() {
                isLoading = true;
              });
              Timer(Duration(seconds: 3), () {
                setState(() {
                  isLoading = false;
                });
              });
            },
          ),
        );
      },
    );
    return SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          // shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: 80.0,
            ),
            logo,
            SizedBox(
              height: 40.0,
            ),
            userName,
            SizedBox(height: 32.0),
            passwd,
            SizedBox(
              height: 32.0,
            ),
            loginBtn,
          ],
        ));
  }
}

// RaisedButton(
//             onPressed: () {
//               handleSubmit(context, callback);
//             },
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
//             color: Colors.lightBlueAccent.shade100,
//             child: Text('Login', style: TextStyle(color: Colors.white),),
//           )
