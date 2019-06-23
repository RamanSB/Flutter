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
          _buildInspirationItemWidget(context),
          _buildNextTripWidget(),
          _buildSavedFlightWidget(context),
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
                            Text(mainText,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
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

  Widget _buildInspirationItemWidget(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildInspirationCard(context, "Need help deciding where to go?",
                  "Find great destinations", Icons.language, () {}),
              _buildInspirationCard(context, "Already know where you're going?",
                  "Find best dates", Icons.date_range, () {}),
            ]));
  }

  Widget _buildNextTripWidget() {
    return Container(
        margin: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 12.0),
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Plan Your Next Trip",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold)),
              InkWell(
                child: Text("Explore All",
                    style: TextStyle(
                        color: Colors.lightBlueAccent, fontSize: 15.0)),
                onTap: () {},
              ),
            ],
          ),
          Container(
              height: 200.0,
              margin: EdgeInsets.symmetric(vertical: 18.0),
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                InkWell(
                  child: Container(
                      width: 140.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/next_trip_1.jpg'),
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.8),
                                BlendMode.dstATop),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 12.0),
                              child: Text("Next weekend",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold)))
                        ],
                      )),
                  onTap: () {},
                ),
                SizedBox(width: 16.0),
                InkWell(
                  child: Container(
                    width: 140.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/next_trip_2.jpg'),
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.8), BlendMode.dstATop),
                          fit: BoxFit.cover),
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(width: 16.0),
                InkWell(
                  child: Container(
                    width: 140.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/next_trip_3.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(width: 16.0),
                InkWell(
                  child: Container(
                    width: 140.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/next_trip_4.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(width: 16.0),
                InkWell(
                  child: Container(
                    width: 140.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/next_trip_5.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(width: 16.0),
                InkWell(
                  child: Container(
                    width: 140.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/next_trip_6.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  onTap: () {},
                )
              ]))
        ]));
  }

  Widget _buildSavedFlightWidget(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Column(children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Text("Saved flights",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal))
          ]),
          Container(
              margin: EdgeInsets.fromLTRB(0, 36.0, 0, 24.0),
              child: Column(children: <Widget>[
                Image.asset('assets/saved_flights_icon.jpg', width: 120.0, height: 120.0,)
              ])),
          Text("See a flight you fancy? Star it to save for later")
        ]));
  }
}
