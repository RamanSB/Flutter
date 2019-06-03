import 'package:flutter/material.dart';
import './product_edit.dart';

class ProductListPage extends StatelessWidget {
  List<Map<String, dynamic>> products;
  final Function updateProduct;
  final Function deleteProduct;

  ProductListPage(this.products, this.updateProduct, this.deleteProduct);

  Widget _buildEditProductButton(BuildContext context, int index) {
    return IconButton(
      icon: Icon(Icons.mode_edit),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return ProductEditPage(
              product: products[index],
              updateProduct: updateProduct,
              productIndex: index);
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
            onDismissed: (DismissDirection direction) {
              print(direction);
              if (direction == DismissDirection.endToStart ||
                  direction == DismissDirection.startToEnd) {
                deleteProduct(index);
              }
            },
            key: Key(products[index]['title']),
            background: Container(
                decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [Colors.red[100], Colors.red]))),
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(products[index]['image'])),
                  title: Text(products[index]['title'],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("\$${products[index]['price'].toString()}"),
                  trailing: _buildEditProductButton(context, index),
                ),
              ),
              Divider()
            ]));
      },
      itemCount: products.length,
    );
  }
}
