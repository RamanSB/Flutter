import 'package:flutter/material.dart';
import "package:flutter_course/product_manager.dart";

class ProductControl extends StatelessWidget{
  final Function addProduct;

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        addProduct({'title': 'Chocolate' , 'imageUrl':'assets/food.jpg'});
      },
      child: Text('Add Product'),
    );
  }
}