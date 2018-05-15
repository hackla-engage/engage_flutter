import 'package:flutter/material.dart';
//import 'package:validate/validate.dart';
import 'category.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MySignupPage(title: 'Engage'),
      routes: <String, WidgetBuilder> {
        '/category': (BuildContext context) => new MyCategory(),
      }
    );
  }
}

class MySignupPage extends StatefulWidget {
  MySignupPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MySignupPageState createState() => new _MySignupPageState();
}

class _MySignupPageState extends State<MySignupPage> {

  String _email, _password;
  bool _loginFailed;
  @override
  void initState() {
      // TODO: implement initState
    super.initState();
    _loginFailed = false;
    _email = "";
    _password = "";
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextFormField(
              onSaved: (e) => _email = e,
              autocorrect: false, 
              obscureText: false,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              
            ),
            new TextFormField(
              onSaved: (p) => _password = p,
              autocorrect: false, 
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Enter Password',
              ),
            ),
            new FlatButton(
              color: Colors.lightBlueAccent,
              onPressed: () { Navigator.of(context).pushNamed('/category'); },
              child: new Text("Login"),
            ),
            new IconButton(
              onPressed: () { Navigator.of(context).pushNamed('/category'); },
              tooltip: 'no login category',
              icon: new Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
