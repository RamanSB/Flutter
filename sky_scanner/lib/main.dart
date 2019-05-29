import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState<MyApp> extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.lightBlue,
          backgroundColor: Colors.white,
          accentColor: Colors.cyanAccent,

        ),


        routes: {
          '/': (BuildContext context) => HomePage()
        }

    );
  }
}
