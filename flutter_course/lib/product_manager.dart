import 'package:flutter/material.dart';

import 'package:flutter_course/products.dart';
import 'package:flutter_course/product_control.dart';

class ProductManager extends StatefulWidget {
  final Map<String, String> startingProduct;

  ProductManager({this.startingProduct}) {
    print('[ProductManager Widget] Constructor');
  }

  @override
  State createState() {
    print('[ProductManager StatefulWidget] CreateState');
    return new _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];

  @override
  void initState() {
    print('[ProductManagerState Widget] InitState');
    //_products.add(widget.startingProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('[ProductManagerState Widget] Build');
    return Column(
      children: <Widget>[
        Container(margin: EdgeInsets.all(10.0), child: ProductControl(_addProduct)),
        Flexible(child: Products(_products, deleteProduct: _deleteProduct))
      ],
    );
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[ProductManager State] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(Map<String, String> product){
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index){
    setState((){
      _products.removeAt(index);
    });
  }
}
