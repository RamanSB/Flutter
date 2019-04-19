import 'package:flutter/material.dart';

import 'package:flutter_course/products.dart';
import 'package:flutter_course/product_control.dart';

class ProductManager extends StatelessWidget {

  final Function _addProduct;
  final Function _deleteProduct;
  final List<Map<String, String>> _products;

  ProductManager(this._products, this._addProduct, this._deleteProduct);


  @override
  Widget build(BuildContext context) {
    print('[ProductManagerState Widget] Build');
    return Column(
      children: <Widget>[
        Container(margin: EdgeInsets.all(10.0), child: ProductControl(_addProduct)),
        Flexible(child: Products(_products, _addProduct ,deleteProduct: _deleteProduct))
      ],
    );
  }




}
