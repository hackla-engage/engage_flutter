import 'package:flutter/material.dart';
import 'shared/category_entry.dart';
import 'loaders/category_loader.dart';

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

const List<CategoryEntry> _choices = const<CategoryEntry>[
  const CategoryEntry(0, "Infrastructure", Icons.store, "Infastructure would include agendas dealing " +
  "with basic structures and facilities (e.g., buildings, roads, and power) needed for the city"
  ),
  const CategoryEntry(1, "Bicycle", Icons.directions_bike, "bikes bikes bikes bikes"
  ),
  const CategoryEntry(2, "Housing", Icons.home, "mi cassa, tu cassa"
  ),
  const CategoryEntry(3, "Environment", Icons.bug_report, "environment"
  ),
];



class _MyCategoryPageState extends State<MyCategory> {

  CategoryList _categoryList;
  String _expanded;
  Set<int> _highlighted;
  @override
  void initState(){
    super.initState();
    _highlighted = new Set();
    if(_categoryList == null){
      CategoryList.fetch().then( (CategoryList cl){
        setState(() {
          _categoryList = cl;
        });
      });
    }
  }
  Widget _buildValidCategories(BuildContext context){
    if(_categoryList != null){
      return new ListView(
        children: <Widget>[
           new Center( child: new Text("What do you care about?") ),
           new Container(
            child: new ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded){
                setState( () {
                  _expanded = _categoryList.entries[index].title;
                });
              },
              children:  _categoryList.entries.map( (CategoryEntry e){
                return new ExpansionPanel(
                  headerBuilder: (BuildContext context, bool b) =>
                  new ListTile(
                    leading: new Icon(e.icon),
                    title: new Text(e.title),
                    selected: _highlighted.contains(e.id),
                    onTap: (){
                      setState( (){
                        if(_highlighted.contains(e.id)){
                            _highlighted.remove(e.id);
                        } else {
                            _highlighted.add(e.id);
                        }
                      });
                    },         
                  ),
                  body: new Text(e.description),
                  isExpanded: _expanded == e.title,
                );
              }).toList()
     
            ),
          ),
        ],
      );
    } else {
      return new Card(
        child:  new Container(
          child: const CircularProgressIndicator(),
          alignment: FractionalOffset.center,
        ),
      );
    }
  }
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
      body: _buildValidCategories( context),
    );
  }
}
