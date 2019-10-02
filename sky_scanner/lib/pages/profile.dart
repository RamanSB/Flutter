import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildProfileAppBar(context),
        SliverList(
            delegate: SliverChildListDelegate([
          _buildProfileDetails(context),
        ]))
      ],
    );
  }

  Widget _buildProfileAppBar(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 96.0,
        backgroundColor: Colors.white,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          title: Text("Profile",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(40, 78, 78, 1),
                  decorationStyle: TextDecorationStyle.wavy)),
          titlePadding: EdgeInsets.only(left: 24.0, bottom: 16.0),
        ));
  }

  Widget _buildProfileDetails(BuildContext context) {
    return Column(children: <Widget>[
      _buildAccountProfileItem(context),
      MainItemTile(title: "Currency", subTitle: "British Pound (£)"),
      MainItemTile(title: "Country / Region", subTitle: "United Kingdom"),
      MainItemTile(
          title: "Language", subTitle: "English (United Kingdom) (en-GB)"),
      MainItemTile(title: "Distance units", subTitle: "miles"),
      Divider(height: 0.5,),
      ListTile(
        title: Text("Remember my filters",
            style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Switch(
          value: true,
          activeColor: Colors.blue,
        ),
      ),
      ListTile(
        title: Text("Notifications",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      ListTile(
        title: Text("Privacy Settings",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      ListTile(
        title: Text("About",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      ListTile(
        title: Text("Clear History".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
      ),
      Divider(height: 0.5),
      ListTile(
        title: Text("Log Out".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
      ),
      ListTile(
        title: Text("Delete Account".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent)),
      ),
    ]);
  }

  Widget _buildAccountProfileItem(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.pink,
              child: Text("R",
                  style: TextStyle(fontSize: 32.0, color: Colors.white)),
              maxRadius: 36.0,
            ),
          ]),
          Padding(
              padding: EdgeInsets.only(right: 48.0, top: 12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("joebloggs@example.com"),
                    SizedBox(height: 12.0),
                    InkWell(
                        highlightColor: Colors.blueGrey,
                        child: Text("Manage account".toUpperCase(),
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)))
                  ])),
          SizedBox(width: 40),
        ]);
  }
}

class MainItemTile extends StatelessWidget {
  String title;
  String subTitle;

  MainItemTile({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:
          Text(title.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("${subTitle}"),
    );
  }
}
