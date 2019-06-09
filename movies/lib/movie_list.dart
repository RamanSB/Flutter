import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './movie_detail.dart';

const API_KEY = "c7dc2531b336f2ce8003b7ba482f68be";

class MovieList extends StatefulWidget {

  MovieList();

  @override
  State createState() {
    return new MovieListState();
  }
}

class MovieListState extends State<MovieList> {
  var movies;
  Color mainColor = const Color(0xff3C3261);

  void getData() async {
    var data = await getJson();
    setState(() {
      movies = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: new Text('Movies',
                style: TextStyle(
                    color: mainColor,
                    fontFamily: 'Arvo',
                    fontWeight: FontWeight.bold)),
            leading: new Icon(Icons.arrow_back, color: mainColor),
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0.3,
            actions: <Widget>[new Icon(Icons.menu, color: mainColor)]),
        body: new Padding(
            padding: EdgeInsets.all(16.0),
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new MovieTitle(mainColor),
                  new Expanded(
                      child: new ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return new FlatButton(
                              child: new MovieCell(movies, index),
                              padding: const EdgeInsets.all(0.0),
                              color: Colors.white,
                              onPressed: (){
                                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                                  return new MovieDetail(movies[index]);
                                }));
                              }
                            );
                          },
                          itemCount: movies == null ? 0 : movies.length))
                ])));
  }
}

class MovieTitle extends StatelessWidget {
  final Color mainColor;

  MovieTitle(this.mainColor);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: new Text(
        'Top Rated',
        style: TextStyle(
            fontSize: 40.0,
            color: mainColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arvo'),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class MovieCell extends StatelessWidget {
  final movies;
  final i;
  Color mainColor = const Color(0xff3C3261);
  var image_url = 'https://image.tmdb.org/t/p/w500/';

  MovieCell(this.movies, this.i);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Container(
                margin: EdgeInsets.all(16.0),
                child: new Container(width: 70.0, height: 70.0),
                decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    color: Colors.grey,
                    image: new DecorationImage(
                        image: new NetworkImage(
                            image_url + movies[i]['poster_path']),
                        fit: BoxFit.cover),
                    boxShadow: [
                      new BoxShadow(
                          color: mainColor,
                          blurRadius: 5.0,
                          offset: new Offset(2.0, 5.0))
                    ]),
              ),
            ),
            new Expanded(
                child: new Container(
              margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: new Column(
                children: [
                  new Text(
                    movies[i]['title'],
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Arvo',
                        fontWeight: FontWeight.bold,
                        color: mainColor),
                  ),
                  new Padding(padding: const EdgeInsets.all(2.0)),
                  new Text(
                    movies[i]['overview'],
                    maxLines: 3,
                    style: new TextStyle(
                        color: const Color(0xff8785A4), fontFamily: 'Arvo'),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            )),
          ],
        ),
        new Container(
          width: 300.0,
          height: 0.5,
          color: Colors.red,
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}

Future<Map> getJson() async {
  var url = 'http://api.themoviedb.org/3/discover/movie?api_key=' + API_KEY;
  http.Response response = await http.get(url);

  return json.decode(response.body);
}
