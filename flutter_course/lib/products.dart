import 'package:flutter/material.dart';
import 'pages/product.dart';

/**
 * Inheriting from StatelessWidget requires our class to be Immutable.
 * Hence we have marked Products instance field as final.
 */

class Products extends StatelessWidget {
  final List<Map> products;

  Products([this.products = const []]) {
    //wrapping constructor param in [] ensures arg is optional.
    print('[Products Widget] Constructor');
  } //Syntactic sugar, initializes products

  Widget _buildProductList() {
    Widget productCard =
        Center(child: new Text("No products found, please add some."));
    if (products.length > 0) {
      productCard = ListView.builder(
          itemBuilder: _itemBuilder, itemCount: products.length);
    }
    return productCard;
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['imageUrl']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlatButton(
                  child: Text("Details"),
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ProductPage(
                                products[index]['title'],
                                products[index]['imageUrl'])),
                      ))
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return _buildProductList();
  }
}
