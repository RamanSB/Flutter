import 'package:flutter/material.dart';

//This main method, will start the app - Renders the UI (Widget Tree).
void main() => runApp(MyApp());
/*Can only have one statement in body when using fat Arrow notation
=> hence only one ; appears, marks one statement. */

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> _products = ['Food Tester'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('EasyList'),
        ),
        body: Column(
          children: <Widget>[

          ],
        ),
      ),
    ); //Core root widget - top level widget
  }
}
