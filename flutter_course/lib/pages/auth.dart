import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return new _AuthPageState();
  }

}

class _AuthPageState extends State<AuthPage>{

  String _emailValue, _passwordValue;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text('Login')),
      body: new Container(
          margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 24.0),
          child: Column(children: <Widget>[
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Email"),
              maxLines: 1,
              onChanged: (String text) {
                setState(() {
                  _emailValue = text;
                });
              }
            ),
            TextField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
              onChanged: (String text) {
                setState(() {
                  _passwordValue = text;
                });
              }
            ),
            SizedBox(height: 16.0),
            Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Expanded(
                  child: RaisedButton(
                      child: Text('Login'),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        print("E-mail:" + _emailValue);
                        print("Password:" +_passwordValue);
                        Navigator.pushReplacementNamed(context, '/products');
                      }))
            ]),
          ])),
    );
  }
}
