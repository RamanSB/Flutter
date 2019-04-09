import 'package:flutter/material.dart';


/**
 *
 * Inheriting from StatelessWidget requires our class to be Immutable.
 * Hence we have marked Products instance field as final.
 */
class Products extends StatelessWidget {

  final List<String> products;

  Products(this.products); //Syntactic sugar, initializes products

  @override
  Widget build(BuildContext context) {
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
