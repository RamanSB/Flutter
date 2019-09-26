import 'package:flutter/material.dart';

class UpcomingTripsTabPage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
        child: Image.asset(
            'assets/saved_flights_icon.jpg',
            width:300.0,
            height: 300.0
        )
    );

  }
}
