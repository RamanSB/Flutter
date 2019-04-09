import 'package:flutter/material.dart';
import './product_manager.dart';

//This main method, will start the app - Renders the UI (Widget Tree).
void main() => runApp(MyApp());
/*Can only have one statement in body when using fat Arrow notation
=> hence only one ; appears, marks one statement. */

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('EasyList'),
          ),
          body: ProductManager(startingProduct: 'Food Tester'),
        ),
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          brightness: Brightness.light,
        )); //Core root widget - top level widget
  }
}
