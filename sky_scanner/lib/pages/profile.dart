import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildProfileAppBar(context),
        SliverList(delegate: SliverChildListDelegate([
          _buildProfileDetails(context)
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
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(40, 78, 78, 1),
                  decorationStyle: TextDecorationStyle.wavy)),
          titlePadding: EdgeInsets.only(left:24.0, bottom: 32.0),
        ));
  }

  Widget _buildProfileDetails(BuildContext context){
    return Column(children: <Widget>[
      Row(children:<Widget>[
        //CircularAvatar
        Column(children: <Widget>[
          Text("Email address place holder"),
          Text("Manage account".toUpperCase(), style: TextStyle(color: Colors.lightBlue))
        ])
      ])
    ]);
  }
}
