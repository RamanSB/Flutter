import 'package:flutter/material.dart';
import 'package:sky_scanner/pages/profile.dart';
import 'package:sky_scanner/pages/trips.dart';
import 'search.dart';
import 'explore.dart';
import 'trips.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Center(child: SearchPage()),
    Center(child: ExplorePage()/*Text("Explore", style: TextStyle(fontSize: 28.0),)*/),
    Center(child: TripPage()/*Text("Trips", style: TextStyle(fontSize: 28.0),)*/),
    Center(child: ProfilePage()/*Text("Profile", style: TextStyle(fontSize: 28.0),)*/),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: _buildBottomNavigationBar());
  }

  Widget _buildBottomNavigationBar() {
    return new BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.grey[400],
      selectedItemColor: Colors.lightBlueAccent,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            title: Text("Search"), icon: Icon(Icons.cloud)),
        BottomNavigationBarItem(
            title: Text("Explore"), icon: Icon(Icons.explore)),
        BottomNavigationBarItem(
            title: Text("Trips"), icon: Icon(Icons.receipt)),
        BottomNavigationBarItem(
            title: Text("Profile"), icon: Icon(Icons.account_circle)),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


}
