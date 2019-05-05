import 'package:flutter/material.dart';
import 'package:flutter_course/pages/login.dart';
import 'package:flutter_course/pages/product_create_page.dart';
import 'package:flutter_course/pages/products_admin.dart';
import 'pages/products.dart';
import 'pages/product.dart';

//This main method, will start the app - Renders the UI (Widget Tree).
void main() => runApp(MyApp());
/*Can only have one statement in body when using fat Arrow notation
=> hence only one ; appears, marks one statement. */

class MyApp extends StatefulWidget {

  @override
  State createState() {
    return new _MyAppState();
  }

}

class _MyAppState extends State<MyApp> {

  List<Map<String, String>> _products = [];

  void _addProduct(Map<String, String> product){
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index){
    setState((){
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //  home: ProductsAdminPage(),
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        routes: {
          '/admin': (BuildContext context) {
            return new ProductsAdminPage();
          },
          '/': (BuildContext context) => ProductsPage(_products, _addProduct, _deleteProduct) // '/' is preserved for home.
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == "product") {
            final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
                builder: (BuildContext context) => ProductPage(
                    _products[index]['title'], _products[index]['imageUrl']));
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductsPage(_products, _addProduct, _deleteProduct);
            }
          );
        }
    ); //Core root widget - top level widget

  }

}
