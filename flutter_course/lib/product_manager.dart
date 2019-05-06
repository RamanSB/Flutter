import 'package:flutter/material.dart';

import 'package:flutter_course/products.dart';

class ProductManager extends StatelessWidget {

  final List<Map<String, dynamic>> _products;

  ProductManager(this._products);

  @override
  Widget build(BuildContext context) {
    print('[ProductManagerState Widget] Build');
    return Column(
      children: <Widget>[
        Expanded(child: Products(_products))
      ],
    );
  }




}
