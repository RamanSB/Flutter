import 'package:flutter/material.dart';

class TripPage extends StatefulWidget {
  const TripPage();

  State<StatefulWidget> createState() {
    return _TripPageState();
  }
}

class _TripPageState extends State<TripPage> {
  //ToDo: Keep as dynamic until an object is created for the listItems.
  List<dynamic> upcomingTrips;
  List<dynamic> pastTrips;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Padding(
            child: Text(
              "Trips",
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.only(top: 40.0, left: 28.0),
          )
        ]),
        DefaultTabController(
          length: 2,
          child: Container(
            child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 24.0),
                  child: Row(children: <Widget>[
                    TabBar(
                      tabs: <Widget>[
                        Tab(text: "Upcoming".toUpperCase()),
                        Tab(text: "Past".toUpperCase())
                      ],
                      isScrollable: true,
                      indicatorColor: Colors.deepPurple,
                      labelColor: Colors.black,
                      unselectedLabelColor: Color.fromRGBO(78, 78, 81, 30),
                    )
                  ])),
              TabBarView(children: <Widget>[
                //UpcomingTripsPage(),
                //PastTripsPage()
              ],)
            ]),
          ),
        )
      ],
    );
  }
}
