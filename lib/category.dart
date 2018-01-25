import 'package:flutter/material.dart';


class MyCategory extends StatefulWidget {
  MyCategory({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyCategoryPageState createState() => new _MyCategoryPageState();
}

class CategoryEntry {
  const CategoryEntry(this.title, this.icon, this.description);
  final String title;
  final IconData icon;
  final String description;
}

const List<CategoryEntry> _choices = const<CategoryEntry>[
  const CategoryEntry("Infrastructure", Icons.store, "Infastructure would include agendas dealing " +
  "with basic structures and facilities (e.g., buildings, roads, and power) needed for the city"
  ),
  const CategoryEntry("Bicycle", Icons.directions_bike, "bikes bikes bikes bikes"
  ),
  const CategoryEntry("Housing", Icons.home, "mi cassa, tu cassa"
  ),
  const CategoryEntry("Environment", Icons.bug_report, "environment"
  ),
];



class _MyCategoryPageState extends State<MyCategory> {


  String expanded;

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
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              new Center( child: new Text("What do you care about?") ),
              new Container(
                  child: new ExpansionPanelList(
                    children:  _choices.map( (CategoryEntry e){
                        return new ExpansionPanel(
                            headerBuilder: (BuildContext context, bool b) => new Row(
                                children: <Widget>[
                                  new Icon(e.icon),
                                  new Text(e.title),
                                ],
                            ),
                            body: new Text(e.description),
                        );
                      }).toList()
                  
                  ),
                ),
            ],
          )
      );
  }
}
