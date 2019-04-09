import 'package:flutter/material.dart';

/**
 * Inheriting from StatelessWidget requires our class to be Immutable.
 * Hence we have marked Products instance field as final.
 */
class Products extends StatelessWidget {

  final List<String> products;

  Products([this.products = const []]){ //wrapping constructor param in [] ensures arg is optional.
    print('[Products Widget] Constructor');
  } //Syntactic sugar, initializes products

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return Column(
      children: products
          .map((element) => Card(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/food.jpg'),
                    Text(element)
                  ],
                ),
              ))
          .toList(),
    );
  }
}
