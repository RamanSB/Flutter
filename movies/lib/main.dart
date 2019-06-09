import 'package:flutter/material.dart';
import './movie_list.dart';
import 'package:flutter/rendering.dart';



void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Movie List Demo',
      home: new MovieList(),
    );
  }

}