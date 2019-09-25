import 'package:flutter/material.dart';

/*ToDo: Implement search functionality (AppBar) use API to populate List
  ToDo: which will be searched via http request (Holiday Destinations).
 */
class ExplorePage extends StatefulWidget {
  const ExplorePage();

  @override
  State<StatefulWidget> createState() {
    return _ExplorePageState();
  }
}

class _ExplorePageState extends State<ExplorePage> {
  final TextEditingController _filter = new TextEditingController();

  String _searchText = "";
  List allResults = new List();
  List filteredResults = new List();

  List<ExploreListItem> _recommendedDestinations = new List();


  @override
  void initState() {
    print("Inside initialize state - initState()");
    initRecommendedDestinations();
  }

  void initRecommendedDestinations() {
    _recommendedDestinations.add(new ExploreListItem(
        imgAssetResource: "", imgText: "Popular destinations"));
    _recommendedDestinations.add(
        new ExploreListItem(imgAssetResource: "", imgText: "Quick Getaways"));
    _recommendedDestinations
        .add(new ExploreListItem(imgAssetResource: "", imgText: "yyy"));
    _recommendedDestinations
        .add(new ExploreListItem(imgAssetResource: "", imgText: "aaa"));
    _recommendedDestinations
        .add(new ExploreListItem(imgAssetResource: "", imgText: "zzz"));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        expandedHeight: 44.0,
        floating: true,
        pinned: true,
        backgroundColor: Colors.white,
        title: Text("Explore",
            style: TextStyle(fontWeight: FontWeight.bold),
            textScaleFactor: 1.5),
      ),
      SliverList(
          delegate: SliverChildListDelegate(<Widget>[
        _buildSearchBarWidget(context),
        _buildExploreImageWidget(context),
        _buildRecommendedDestinationWidget(context),
            //Repeat the above 5 more times - Weekend breaks, Be Inspired, Best Deals by Month, Recently viewed
      ])),
    ]);
  }

  _buildSearchBarWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration:
          BoxDecoration(border: Border.all(width: 2.0, color: Colors.grey)),
      child: Column(children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Find your next destination',
                    prefixIcon: Icon(
                      Icons.search,
                      size: 24.0,
                    ),
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
        //SizedBox(height: 8.0),
      ]),
    );
  }

  _buildExploreImageWidget(BuildContext context) {
    return Container(
        height: 180.0,
        margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/explore_everywhere.jpg')),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                  position: DecorationPosition.background,
                  decoration: const BoxDecoration(
                      color: Colors.black38,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Column(children: <Widget>[
                    SizedBox(height: 12.0),
                    Text(
                      "   Explore Everywhere   ",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12.0)
                  ]))
            ]));
  }

  _buildRecommendedDestinationWidget(BuildContext context) {
    return Container(
        height: 300.0,
        padding:
            EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Recommended Destinations",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  )
                ],
              ),
              SizedBox(height: 8.0),
              Expanded(
                  child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int i) =>
                    _recommendedDestinations[i],
                itemCount: _recommendedDestinations.length,
              ))
            ]));
  }
}

class ExploreListItem extends StatelessWidget {
  String imgAssetResource;
  String imgText;

  ExploreListItem({this.imgAssetResource, this.imgText});

  Widget build(BuildContext context) {
    return Container(
        width: 120.0,
        height: 180.0,
        margin: EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
        child: Column(children: <Widget>[
          Image.asset(
            "assets/next_trip_1.jpg", //use imgAssetResource here
            fit: BoxFit.cover,
            height: 120.0,
          ),
          SizedBox(height: 12.0),
          Row(
              mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                Flexible(child: Text(imgText.toString(), style: TextStyle())),
          ])
        ]));
  }
}
