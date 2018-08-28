import 'package:flutter/material.dart';
import 'shared/category_entry.dart';
import 'loaders/category_loader.dart';
import 'shared/user.dart';
import 'feed.dart';

class MyCategory extends StatefulWidget {
  MyCategory({Key key, this.title, this.userToken}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final User userToken;
  final String title;
  @override
  _MyCategoryPageState createState() => new _MyCategoryPageState();
}

class _MyCategoryPageState extends State<MyCategory> {

  CategoryList _categoryList;
  String _expanded;
  Set<CategoryEntry> _highlighted;
  @override
  void initState(){
    super.initState();
    _highlighted = new Set();
    if(_categoryList == null){
      CategoryList.fetch().then( (CategoryList cl) =>
        setState(() {
          _categoryList = cl;
        })
      );
    }
  }
  Widget _buildValidCategories(BuildContext context){
    if(_categoryList != null){
      return new ListView(
        children: <Widget>[
           new Center( child: new Text("What do you care about?") ),
           new Container(
            child: new ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) =>
                setState( () {
                  var _temp = _categoryList.entries[index].title;
                  _expanded = _temp == _expanded ? "" : _temp;
                }),
              children:  _categoryList.entries.map( (CategoryEntry e){
                return new ExpansionPanel(
                  headerBuilder: (BuildContext context, bool b) =>
                  new ListTile(
                    leading: new Icon(e.icon),
                    title: new Text(e.title),
                    selected: _highlighted.contains(e),
                    onTap: () =>
                      setState( (){
                        if(_highlighted.contains(e)){
                            _highlighted.remove(e);
                        } else {
                            _highlighted.add(e);
                        }
                      }),
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
      floatingActionButton: new FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, new MaterialPageRoute(
              builder: (BuildContext context) => new MyFeed( entries: _highlighted,),
            )),
        tooltip: 'Feed Page',
        child: new Icon(Icons.navigate_next),
      ),
    );
  }
}
