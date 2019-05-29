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
          titlePadding: EdgeInsets.only(left: 24.0, bottom:12.0, top:0.0, right:0.0),
          title: Text(
            "Search",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.white, decorationStyle: TextDecorationStyle.wavy),
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate([_buildIconButtonRow(context)]),
      ),
      SliverFillRemaining(child: Center(child: Text("Place Holder")))
    ]);
  }

  Widget _buildIconButtonRow(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [Color.fromARGB(1, 0, 183, 214), Color.fromARGB(1, 1, 204, 215)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Column(children: <Widget>[
          SizedBox(height: 16.0),
          Row(

              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(Icons.flight),
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  mini: true,
                ),
                FloatingActionButton(
                  child: Icon(Icons.hotel),
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  mini: true,
                ),
                FloatingActionButton(
                 child: Icon(Icons.drive_eta),
                  onPressed: (){},
                  backgroundColor: Colors.white,
                  mini: true,
                )
              ]),
          SizedBox(height: 16.0)
        ]));
  }
}
