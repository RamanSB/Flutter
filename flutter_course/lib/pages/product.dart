import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  Widget build(BuildContext context) {
    print('[ProductPage Stateless Widget] - build');
    return new WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
            appBar: new AppBar(title: new Text(title)),
            body: new Column(children: <Widget>[
              Image.asset(imageUrl),
              Container(padding: EdgeInsets.all(10.0), child: new Text(title)),
              new RaisedButton(
                  child: new Text("DELETE"),
                  color: Theme
                      .of(context)
                      .accentColor,
                  onPressed: () => _showWarningDialog(context)
              )
            ])));
  }


  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Please confirm deletion?"),
            content: Text("This action cannot be undone!"),
            actions: <Widget>[
              new FlatButton(
                child: Text("YES"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
              new FlatButton(
                  child: Text("NO"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }


}
