import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final int productIndex;
  final Product product;

  ProductEditPage(
      {this.addProduct, this.updateProduct, this.product, this.productIndex});

  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  Map<String, dynamic> _formData = {
    'title': '',
    'description': '',
    'price': 0.00,
    'image': ''
  };
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
      onSaved: (String value) {
        _formData['title'] = value;
      },
      initialValue: widget.product == null ? '' : widget.product.title,
      validator: (String value) {
        print('Validator');
        if (value.trim().isEmpty || value.length < 5) {
          return "Product Title must be greater than 4 characters..";
        }
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
        maxLines: 4,
        decoration: InputDecoration(labelText: 'Product Description'),
        onSaved: (String value) {
          _formData['description'] = value;
        },
        initialValue: widget.product == null ? '' : widget.product.description,
        validator: (String value) {
          if (value.trim().isEmpty || value.length < 10) {
            return "Product description must be greater than 9 characters.";
          }
        });
  }

  Widget _buildPriceTextField() {
    return TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Product Price'),
        onSaved: (String value) {
          _formData['price'] = double.parse(value);
        },
        initialValue:
            widget.product == null ? '' : widget.product.price.toString(),
        validator: (String value) {
          if (double.tryParse(value) == null) {
            return "Product price must be a value.";
          }
        });
  }

  void _submitForm() {
    bool validated = _formKey.currentState.validate();
    if (!validated) {
      return; //do Nothing
    }
    _formKey.currentState.save();
    _formData['image'] = 'assets/food.jpg';

    widget.product == null
        ? widget.addProduct(Product(
            title: _formData['title'],
            image: _formData['image'],
            price: _formData['price'],
            description: _formData['description']))
        : widget.updateProduct(
            widget.productIndex,
            Product(
                title: _formData['title'],
                description: _formData['description'],
                price: _formData['price'],
                image: _formData['image']));
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    final Widget pageContent = GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTitleTextField(),
              _buildDescriptionTextField(),
              _buildPriceTextField(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Save'),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                onPressed: _submitForm,
              )
            ],
          ),
        ),
      ),
    );

    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(title: Text("Edit Product")), body: pageContent);
  }
}
