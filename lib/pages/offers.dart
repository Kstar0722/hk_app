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
import 'package:hk_flutter_app/main.dart';


class Offers extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Widget image_carousel = new Container(


      height: 400.0,
    child: Container(

      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image(image: AssetImage('lib/assets/offer_banner.jpeg')),
      ),
    ),
    );
    return  Scaffold(
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
    body: new ListView(
    children: <Widget>[
    //image carousel begins here
    image_carousel,
    ],
    ),
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


      height: 400.0,

      child: Container(
        padding: EdgeInsets.all(30.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(image: AssetImage('lib/assets/offer_banner.jpeg')),
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

      body: new ListView(
        children: <Widget>[
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

class CarouselPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}