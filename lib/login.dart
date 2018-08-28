import 'package:flutter/material.dart';
//import 'package:validate/validate.dart';
import 'category.dart';
import 'shared/user.dart';
import 'posts/user_helper.dart';

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

enum loginState {
    NONE, CONNECTING, SUCCESS, ERROR
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

  loginState _loginState;
  String _email, _password;
  User _userToken;
  final  _userTextController = TextEditingController();
  final  _passwordTextController = TextEditingController();
  @override
  void initState() {
      // TODO: implement initState
    super.initState();
    _loginState = loginState.NONE;
    _email = "";
    _password = "";
    _userTextController.addListener(() => _email = _userTextController.text);
    _passwordTextController.addListener(() => _password = _passwordTextController.text);
  }
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    super.dispose();
    _userTextController.dispose();
    _passwordTextController.dispose();
  }

  Widget _loginWidget(BuildContext context) {
    Widget buttonStateWidget;
    switch(_loginState) {
      case loginState.CONNECTING:
        buttonStateWidget =  CircularProgressIndicator();
        break;
      case loginState.SUCCESS:
        buttonStateWidget = new Text("Success");
        break;
      default:
        buttonStateWidget = new Text("Login");
    };
    return new Builder(
      builder: (BuildContext context) {
      return new FlatButton(
      color: Colors.lightBlueAccent,
      onPressed: () {
        setState(() {
                  _loginState = loginState.CONNECTING;
                });
        //print("******" + _email + " " + _password + "*********");
        UserHelper.loginUser(_email, _password).then( (response) {
          if(response == null) {
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text('Error Login'),
              ));
              setState(() {
                _loginState = loginState.ERROR;
              });
          } else {
            _userToken = response;
            setState(() {
             _loginState = loginState.SUCCESS;
            });
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyCategory(userToken: _userToken))); 
          }
          setState(() {
             _loginState = loginState.NONE;
          });
        });
      },
      child: buttonStateWidget,
      );
      }
    );
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
              //onSaved: (e) => _email = e,
              controller: _userTextController,
              autocorrect: false, 
              obscureText: false,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              
            ),
            new TextFormField(
              //onSaved: (p) => _password = p,
              controller: _passwordTextController,
              autocorrect: false, 
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Enter Password',
              ),
            ),
            _loginWidget(context),
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
