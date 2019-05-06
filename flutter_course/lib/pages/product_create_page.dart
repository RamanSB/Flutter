import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  Function _addProduct, _deleteProduct;

  ProductCreatePage(this._addProduct, this._deleteProduct);

  @override
  State createState() {
    return new ProductCreatePageState();
  }
}

class ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Product Title'),
            maxLengthEnforced: true,
            maxLines: 1,
            onChanged: (String text) {
              setState(() {
                _titleValue = text;
              });
            },
          ),
          TextField(
              decoration: InputDecoration(labelText: 'Product Description'),
              keyboardType: TextInputType.multiline,
              maxLengthEnforced: false,
              maxLines: 4,
              onChanged: (String description) {
                setState(() {
                  _descriptionValue = description;
                });
              }),
          TextField(
              decoration: InputDecoration(labelText: 'Product Price'),
              maxLines: 1,
              keyboardType: TextInputType.number,
              onChanged: (String price) {
                setState(() {
                  _priceValue = double.parse(price);
                });
              }),
          SizedBox(height: 10.0), //SizedBox fills up void space specified by parameter.
          RaisedButton(
              child: Text('Save'),
              onPressed: () {
                Map<String, dynamic> productDataMap = {
                  'title': _titleValue,
                  'description': _descriptionValue,
                  'image': 'assets/food.jpg',
                  'price': _priceValue
                };
                //Ideally require some validation on productData fields
                widget._addProduct(productDataMap);
                Navigator.pushReplacementNamed(context, '/products');
              })
        ]));
  }
}
