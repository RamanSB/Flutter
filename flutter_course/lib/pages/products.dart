import 'package:flutter/material.dart';
import '../product_manager.dart';
import './products_admin.dart';

class ProductsPage extends StatelessWidget {
  List<Map<String, dynamic>> _products;


  ProductsPage(this._products);

  Widget build(BuildContext context) {
    print('[HomePage StatelessWidget] build');
    return new Scaffold(
      drawer: Drawer(
          child: Column(children: <Widget>[
            AppBar(title: Text('Choose'), automaticallyImplyLeading: false),
            ListTile(
              title: Text('Manage Products'),
              onTap: () {
                Navigator.pushReplacementNamed(context,
                    '/admin');
              },
            )
          ])),
      appBar: AppBar(
        title: Text('EasyList'),
      ),
      body: ProductManager(_products),
    );
  }
}
