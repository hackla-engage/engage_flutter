import 'package:flutter/material.dart';
import 'shared/agenda_entry.dart';
import 'loaders/agenda_loader.dart';
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
  List<AgendaEntry> agendaList = new List();
  void initState(){
    super.initState();
    agendaList.clear();
    var stream = AgendaList.fetch(widget.entries);
    stream.listen((AgendaEntry e)=>setState(()=>agendaList.add(e)));
  }
  
  //https://docs.flutter.io/flutter/material/Card-class.html
  Widget _buildTile(BuildContext context, AgendaEntry e){
    return new Card(
      child: new Column(
        
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Text("(${e.id})"),
            ],
          ),
          new ListTile(
            leading: new Icon(e.icon),
            title: new Text(e.title),
          ),
          new Row(
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.share),
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
  }

  
  Widget build(BuildContext context) {
    var agendas = agendaList;
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
      body: new ListView(
        children: agendas.map(( AgendaEntry e ) => _buildTile(context, e)).toList(),
      ),
    );
  }
}
