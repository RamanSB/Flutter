import 'package:flutter/material.dart';

import 'package:flutter_course/products.dart';
import 'package:flutter_course/product_control.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  ProductManager({this.startingProduct = 'Sweets Tester'}) {
    print('[ProductManager Widget] Constructor');
  }

  @override
  State createState() {
    print('[ProductManager Widget] CreateState');
    return new _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    print('[ProductManagerState Widget] InitState');
    _products.add(widget.startingProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('[ProductManagerState Widget] Build');
    return Column(
      children: <Widget>[
        Container(margin: EdgeInsets.all(10.0), child: ProductControl(_addProduct)),
        Expanded(child: Products(_products))
      ],
    );
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[ProductManager State] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(String product){
    setState(() {
      _products.add('Advanced Food Tester');
    });

  }
}
