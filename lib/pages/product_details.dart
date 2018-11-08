import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
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
    child: Container(
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
  Widget build(BuildContext context) {
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
      body: SafeArea(



          child: Container(

        color: Color(0xffffffff),
        child: Column(

          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  "images/products/prod1.webp",
                  height: 350,
                  fit: BoxFit.cover,
                ),

                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        // Box decoration takes a gradient
                        gradient: LinearGradient(
                          // Where the linear gradient begins and ends
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.07),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.025),
                          ],
                        ),
                      ),

                      child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container()
                      )),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(4.0),

                    ),


                    Row(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(4),
                            child: Card(
                              elevation: 10,

                            )
                        ),



                      ],
                    ),
                  ],
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 350,
                      decoration: BoxDecoration(
                        // Box decoration takes a gradient
                        gradient: LinearGradient(
                          // Where the linear gradient begins and ends
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.07),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.025),
                          ],
                        ),
                      ),

                      child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container()
                      )),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('MuscleBlaze', style: TextStyle(fontFamily:'Oswald',color: Colors.white,fontSize: 20)),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('\₹900', textAlign: TextAlign.end,style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    )),

              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(2, 5),
                          blurRadius: 10
                      )
                    ]
                ),
                child: Column(
                  children: <Widget>[Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text('Select Color: ', style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('Select Size: ', style: TextStyle(fontFamily:'Oswald',color: Color(0xff2CBCBD))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(width: 24, height: 24, decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(7)
                            ),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text('1.1 LB', textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 17),),
                              ),),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(width: 24, height: 24, decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(7)
                            ),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text('2.1 LB', textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 17),),
                              ),),
                          ),


                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(width: 24, height: 24, decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(7)
                            ),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text('3.5 LB', textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 17),),
                              ),),
                          ),


                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container( height: 24, decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(7)
                            ),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text('5 LB', textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 17),),
                              ),),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Description:\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s  Lorem Ipsum has been the industry standard dummy text ever since the 1500s ', style: TextStyle(color: Colors.white)),
                      ),
                    ),

                    Padding(
                      padding:
                      const EdgeInsets.all(9),
                      child: Material(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Color(0xff2CBCBD),
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Buy now",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          )),
                    ),

                  ],
                ),
              ),
            )

          ],
        ),
      )),
    );
  }
}