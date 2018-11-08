import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:hk_flutter_app/components/horizontal_listview.dart';
import 'package:hk_flutter_app/components/products.dart';
import 'package:hk_flutter_app/components/hot_prods.dart';
//import 'package:hk_flutter_app/pages/firebase.dart';
//import 'package:hk_flutter_app/pages/login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hk_flutter_app/components/overhead.dart';

import 'package:hk_flutter_app/pages/offers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HK Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String,WidgetBuilder>{
        "/RecentSearches" : (BuildContext) => new FirebaseLogin(),
        "/home":(BuildContext) => MyApp(),
        "/offers":(BuildContext)=>Offers(),
        //   "/whereWeather" :(BuildContext) => ShowWeather(state.getWeather, cityController.text)
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}

class FirebaseLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirebaseLogin();
  }
}

class _FirebaseLogin extends State<FirebaseLogin> {
  bool _isLoggedIn = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async{
    try{
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err){
      print(err);
    }
  }

  _logout(){
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: _isLoggedIn? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(_googleSignIn.currentUser.photoUrl, height: 50.0, width: 50.0,),
                Text(_googleSignIn.currentUser.displayName),
                OutlineButton( child: Text("Logout"), onPressed: (){
                  _logout();
                },)
              ],
            )
                : Center(
              child: OutlineButton(
                child: Text("Login with Google"),
                onPressed: () {
                  _login();
                },
              ),
            )
        ),
      ),
    );
  }
}


class _HomePageState extends State<HomePage>{
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    Widget image_carousel = new Container(
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0, // has the effect of softening the shadow
            spreadRadius: 2.0, // has the effect of extending the shadow
            offset: Offset(
              8.0, // horizontal, move right 10
              8.0, // vertical, move down 10
            ),
          )
        ],
      //  borderRadius: new BorderRadius.all(3),
        //gradient: new LinearGradient(...),
      ),
      height: 400.0,
      child:

      Container(

          padding: EdgeInsets.all(30.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
             child:  new Carousel(
              boxFit: BoxFit.cover,

        images: [ NetworkImage('https://img8.hkrtcdn.com/11541/bnr_1154077_o.jpg'),
          NetworkImage('https://img10.hkrtcdn.com/11550/bnr_1154969_o.jpg'),
          NetworkImage('https://img10.hkrtcdn.com/11541/bnr_1154079_o.jpg'),
          NetworkImage('https://img8.hkrtcdn.com/11451/bnr_1145027_o.png')
        ],
        autoplay: true,
   animationCurve: Curves.fastOutSlowIn,
animationDuration: Duration(milliseconds: 600),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
      ),
          ),
      ),

    );
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xff2CBCBD),

        title: Image(image: AssetImage('lib/assets/logo3.png'),
        height: 70),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.home), onPressed: null),
          new IconButton(icon: Icon(Icons.account_circle), onPressed: null),
          new IconButton(icon: Icon(Icons.shopping_cart), onPressed: null),

        ],

      ),
      drawer: new Drawer(

        child: new ListView(

          children: <Widget>[

            new UserAccountsDrawerHeader(

              decoration: BoxDecoration(

              ),


        currentAccountPicture: GestureDetector(
          child: new CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Color(0xffffffff)),
      ),
        ),
            ),

            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed("/RecentSearches");
              },
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Sports Nutrition'),
                leading: Icon(Icons.person),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Vitamins & Supplements'),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Ayurveda & herbs'),
                leading: Icon(Icons.person),
              ),
            ),

          ],

        ),
      ),
    body: new ListView(
    children: <Widget>[
      new Container(

      ),
      OverHead(),

    //image carousel begins here
    image_carousel,

    //hot products
      new Padding(padding: const EdgeInsets.all(20),

        child: new Text('Trending Products'),
      ),

      //Horizontal list view begins here
      HotProds(),
//    //padding widget
    new Padding(padding: const EdgeInsets.all(20.0),
    child: new Text('Recent products'),),

//    //grid view
    Container(
    height: 320.0,
    child: Products(),
    )
  ],
    ),
    );
  }
}

