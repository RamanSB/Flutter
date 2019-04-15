import 'package:flutter/material.dart';
import './product_manager.dart';
import 'pages/home.dart';

//This main method, will start the app - Renders the UI (Widget Tree).
void main() => runApp(MyApp());
/*Can only have one statement in body when using fat Arrow notation
=> hence only one ; appears, marks one statement. */

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage(),
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          brightness: Brightness.light,
        )); //Core root widget - top level widget
  }
}
