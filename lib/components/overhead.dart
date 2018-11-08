
import 'package:hk_flutter_app/pages/offers.dart';
import 'package:flutter/material.dart';

class OverHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Center(

      child: Row(

        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const RaisedButton(
            onPressed: null,
            child: Text(
                'All Categories',
                style: TextStyle(fontSize:10),

            ),
          ),
          const SizedBox(height: 30),
          const RaisedButton(
            color : Color(0xff2CBCBD),
            onPressed: null,
            child: Text(
                'Brands',
                style: TextStyle(fontSize: 10),

            ),
          ),
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {},
            child: const Text(
                'Offers',
                style: TextStyle(fontSize: 10)
            ),
          ),
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/offers");
            },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                  'Rewards',
                  style: TextStyle(fontSize: 10),

              ),

            ),
          ),
        ],

      ),
    );
  }
}