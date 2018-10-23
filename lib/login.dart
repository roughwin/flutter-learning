import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {

  @override
  void initState() {
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        radius: 48.0,
        child: Text('CRM', style: TextStyle(fontSize: 30.0, color: Colors.white),)
      )
    );
    final userName = TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'username@innobuddy.com',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        )
      ),
      onChanged: handleTextChange('username'),
    );
    final passwd = TextField(
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        )
      ),
      onChanged: handleTextChange('passwd'),
      obscureText: true,
    );
    final loginBtn = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: CupertinoButton(
        onPressed: () {
          print('btn press');
        },
        color: Colors.lightBlueAccent.shade100,
        child: Text('Login', style: TextStyle(color: Colors.white),),
      ),
    );
    return ListView(
      // shrinkWrap: true,
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      children: <Widget> [
        SizedBox(height: 80.0,),
        logo,
        SizedBox(height: 40.0,),
        userName,
        SizedBox(height: 32.0),
        passwd,
        SizedBox(height: 32.0,),
        loginBtn,
      ],
    );
  }
}