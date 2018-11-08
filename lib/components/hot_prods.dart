import 'package:flutter/material.dart';

class HotProds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/products/1.webp',
            image_caption: 'MB',
          ),

          Category(
            image_location: 'images/products/2.webp',
            image_caption: 'Protein',
          ),

          Category(
            image_location: 'images/products/3.webp',
            image_caption: 'Dymatize',
          ),

          Category(
            image_location: 'images/products/4.webp',
            image_caption: 'ON',
          ),

          Category(
            image_location: 'images/products/5.webp',
            image_caption: 'MB',
          ),
          Category(
            image_location: 'images/products/6.webp',
            image_caption: 'MB',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.2),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
              title: Image.asset(
                image_location,
                width: 100.0,
                height: 100.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(image_caption,
                  style: new TextStyle(fontSize: 12.0,color: Colors.black.withOpacity(0.8)),

                textAlign: TextAlign.center,
                ),
              )
          ),
        ),
      ),
    );
  }
}
