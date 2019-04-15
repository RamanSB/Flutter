import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(FriendlychatApp());
}

const String _name = "Ramandeep";

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
    primarySwatch: Colors.purple, accentColor: Colors.orange[400]);

class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Root Stateless Widget [Build]');
    return new MaterialApp(
        title: "Friendlychat",
        home: new ChatScreen(),
        theme: defaultTargetPlatform == TargetPlatform.iOS
            ? kIOSTheme
            : kDefaultTheme);
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() {
    print('ChatScreen Stateful Widget [createState]');
    return new ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    print('ChatScreenState (Stateful Widget\'s State) [Build]');
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Friendlychat"),
            elevation:
                Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0),
        body: new Column(children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(height: 1.0),
          new Container(
              decoration: new BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer()),
        ]));
  }

  Widget _buildTextComposer() {
    print('_buildTextComposer');
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
                child: new TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration:
                  new InputDecoration.collapsed(hintText: "Send a message"),
              onChanged: (String text) {
                setState(() {
                  print('onChanged: setState');
                  _isComposing = text.length > 0;
                });
              },
            )),
            new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? //modified
                    new CupertinoButton(
                        //new
                        child: new Text("Send"), //new
                        onPressed: _isComposing //new
                            ? () => _handleSubmitted(_textController.text) //new
                            : null,
                      )
                    : //new
                    new IconButton(
                        //modified
                        icon: new Icon(Icons.send),
                        onPressed: _isComposing
                            ? () => _handleSubmitted(_textController.text)
                            : null,
                      )),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print("Dispose");
    for (ChatMessage messages in _messages) {
      messages.animationController.dispose();
    }
    super.dispose();
  }

  void _handleSubmitted(String text) {
    print("_handleSubmitted, submit Callback");
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
          duration: new Duration(milliseconds: 700), vsync: this),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final AnimationController animationController;

  ChatMessage({this.text, this.animationController});

  @override
  Widget build(BuildContext context) {
    print("ChatMessage StatelessWidget [build]");
    return new SizeTransition(
        sizeFactor: new CurvedAnimation(
            parent: animationController, curve: Curves.easeOut),
        axisAlignment: 0.0,
        child: new Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: new Row(children: <Widget>[
              new Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: new CircleAvatar(child: new Text(_name[0]))),
              new Expanded(
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(_name,
                          style: Theme.of(context).textTheme.subhead),
                      new Container(
                          margin: const EdgeInsets.only(top: 5.0),
                          child: new Text(text))
                    ]),
              )
            ])));
  }
}
