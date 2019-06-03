import 'package:flutter/material.dart';
import './product_edit.dart';

class ProductListPage extends StatelessWidget {
  List<Map<String, dynamic>> products;
  final Function updateProduct;

  ProductListPage(this.products, this.updateProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: ListTile(
            leading: Image.asset(products[index]['image']),
            title: Text(products[index]['title'],
                style: TextStyle(
                    fontSize: 18.0,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.bold)),
            trailing: IconButton(
              icon: Icon(Icons.mode_edit),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ProductEditPage(product: products[index], updateProduct: updateProduct, productIndex: index);
                }));
              },
            ),
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
