import 'package:flutter/material.dart';

import 'package:flutter_course/products.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;
  ProductManager({this.startingProduct = 'Sweets Tester'}){
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
  void initState(){
    print('[ProductManager Widget] InitState');
    _products.add(widget.startingProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('[ProductManager Widget] Build');
    return Column(children: <Widget>[
      Container(margin: EdgeInsets.all(10.0),
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
                _products.add('Advanced Food Tester');
            });
          },
          child: Text('Add Product'),
        )), Products(_products)],);
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[ProductManager State] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }


}