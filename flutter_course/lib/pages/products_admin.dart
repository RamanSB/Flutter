import 'package:flutter/material.dart';
import './products.dart';
import './product_list_page.dart';
import './product_create_page.dart';

class ProductsAdminPage extends StatelessWidget {
  Function _addProduct;
  Function _deleteProduct;

  /*using this.(instance_var) for constructor paramis syntactic sugar to initi-
   alize the variables*/

  ProductsAdminPage(this._addProduct, this._deleteProduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: new Scaffold(
            drawer: Drawer(
                child: Column(children: <Widget>[
              AppBar(
                title: Text("Admin"),
                automaticallyImplyLeading: false,
              ),
              ListTile(
                  title: Text("Products"),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/products');
                  })
            ])),
            appBar: AppBar(
              title: new Text("Admin"),
              bottom: new TabBar(tabs: <Widget>[
                new Tab(
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      new Icon(Icons.create),
                      new Text("Create Product")
                    ])),
                new Tab(
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      new Icon(Icons.list),
                      new Text("My Products")
                    ])),
              ]),
            ),
            body: new TabBarView(
              children: <Widget>[
                ProductCreatePage(_addProduct, _deleteProduct),
                ProductListPage()
              ],
            )));
  }
}
