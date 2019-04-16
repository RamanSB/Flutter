import 'package:flutter/material.dart';
import './products.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: new Text('Login')),
        body: new Center(
            child: new RaisedButton(
                child: new Text('LOGIN'),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return ProductsPage();
                      }
                  ));
                }
            )
        )
    );
  }
}
