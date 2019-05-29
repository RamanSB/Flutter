import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      const SliverAppBar(
        pinned: false,
        snap: false,
        expandedHeight: 96.0,
        backgroundColor: Colors.blue,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          // background: ,
          titlePadding:
              EdgeInsets.only(left: 24.0, bottom: 12.0, top: 0.0, right: 0.0),
          title: Text(
            "Search",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.white, decorationStyle: TextDecorationStyle.wavy),
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          _buildIconButtonRow(context),
          _buildBeInspiredTextWidget(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildInspirationCard(
                        context,
                        "Need help deciding where to go?",
                        "Find great destinations",
                        Icons.language,
                        () {}),
                    _buildInspirationCard(
                        context,
                        "Already know where you're going?",
                        "Find best dates",
                        Icons.date_range,
                            () {}),
                  ])),

        ]),
      ),
    ]);
  }

  Widget _buildIconButtonRow(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [Colors.blue, Colors.lightBlueAccent],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Column(children: <Widget>[
          SizedBox(height: 16.0),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FloatingActionButton(
                      child: Icon(Icons.flight_takeoff),
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      mini: true,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text("Flights",
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
                Column(
                  children: <Widget>[
                    FloatingActionButton(
                      child: Icon(Icons.hotel),
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      mini: true,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text("Hotels",
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
                Column(
                  children: <Widget>[
                    FloatingActionButton(
                      child: Icon(Icons.drive_eta),
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      mini: true,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text("Car Hire",
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ]),
          SizedBox(height: 16.0)
        ]));
  }

  Widget _buildBeInspiredTextWidget() {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 24.0, top: 32.0),
        height: 60.0,
        child: Text("Be inspired",
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 16.0,
                fontWeight: FontWeight.bold)));
  }

  /*
  Text 1: "Need help deciding where to go?"
  Text 2: Find great destinations
   */
  Widget _buildInspirationCard(BuildContext context, String subtleText,
      String mainText, IconData iconData, Function onPressed) {
    return Card(
        child: InkWell(
            onTap: onPressed,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    child: Icon(
                      iconData,
                      color: Colors.white,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    mini: true,
                    onPressed: () {},
                    elevation: 0,
                  ),
                  Flexible(
                      flex: 0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 16.0),
                            Text(subtleText),
                            Text(mainText, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,
                            fontSize: 14.0)),
                            SizedBox(height: 16.0),
                          ])),
                  SizedBox(width: 24.0),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                  ),
                ])));
  }
}
