import 'package:flutter/material.dart';
import 'shared/agenda_entry.dart';
import 'shared/category_entry.dart';

class MyFeed extends StatefulWidget {
  MyFeed({Key key, this.entries}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final Set<CategoryEntry> entries;
  @override
  _MyFeedPageState createState() => new _MyFeedPageState();
}

class _MyFeedPageState extends State<MyFeed> {

  
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.home),
            onPressed: () {},
          ),
          new IconButton(
            icon: new Icon(Icons.settings),
            onPressed: () {},
          )
        ]
      ),
    );
  }
}
