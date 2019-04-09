import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  String mainText = "Let's begin";

  @override
  Widget build(BuildContext context) {
    print('[MyApp StatelessWidget] build()');
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Assignment 1')),
            body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextControlWidget(mainText),
                ])));
  }
}

class TextControlWidget extends StatefulWidget {
  String text = "ok";

  TextControlWidget(this.text) {
    print('[TextControlWidget] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[TextControlWidget] createState()');
    return new TextControlState();
  }
}

class TextControlState extends State<TextControlWidget> {
  var chars = "abcdefghijklmnopqrstuvwxyz0123456789";
// String newText;

  @override
  void initState() {
    //newText = widget.text;
    super.initState();
  }

  TextControlState(){
    print('[TextControlState] Constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('[TextControlState] build()');
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
          margin: EdgeInsets.all(32.0),
          child: RaisedButton(
            child: Text('Change Text'),
            onPressed: () {
              setState(() {
                widget.text = "";
                for (var i = 0; i < 10; i++) {
                  widget.text += chars[new Random().nextInt(chars.length)];
                }
              });
            },
          )),
      Text(widget.text),
    ]);
  }
}
