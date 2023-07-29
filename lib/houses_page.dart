import 'package:flutter/material.dart';

class HousesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Houses'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          HouseItem(
            image: 'images/h1.png',
            title: 'Spacious Family Home',
            location: '123 Main Street',
            price: '\ksh 20,000',
            bedrooms: 4,
            bathrooms: 3,
          ),
          SizedBox(height: 16),
          HouseItem(
            image: 'images/h2.png',
            title: 'Modern Downtown Apartment',
            location: '456 Elm Street',
            price: '\ksh 30,000',
            bedrooms: 2,
            bathrooms: 2,
          ),
          SizedBox(height: 16),
          HouseItem(
            image: 'images/h3.png',
            title: 'Cozy Suburban House',
            location: '789 Oak Street',
            price: '\ksh 40,000',
            bedrooms: 3,
            bathrooms: 2,
          ),
        ],
      ),
    );
  }
}

class HouseItem extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String price;
  final int bedrooms;
  final int bathrooms;

  HouseItem({
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Price: $price',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Bedrooms: $bedrooms',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 8),
                Text(
                  'Bathrooms: $bathrooms',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
