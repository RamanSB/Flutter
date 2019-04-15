import 'package:flutter/material.dart';
import '../product_manager.dart';


class HomePage extends StatelessWidget {

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('EasyList'),
      ),
      body: ProductManager(startingProduct: {'title': 'Food Tester', 'imageUrl':'assets/food.jpg'}),
    );
  }
}