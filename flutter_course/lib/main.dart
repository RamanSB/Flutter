import 'package:flutter/material.dart';
import 'package:flutter_course/pages/login.dart';
import 'pages/products.dart';

//This main method, will start the app - Renders the UI (Widget Tree).
void main() => runApp(MyApp());
/*Can only have one statement in body when using fat Arrow notation
=> hence only one ; appears, marks one statement. */

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: LoginPage(),
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          brightness: Brightness.light,
        )); //Core root widget - top level widget
  }
}
