import 'package:flutter/material.dart';

class MoversPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movers'),
        backgroundColor: Colors.blue, // Set the app bar background color
      ),
      body: ListView(
        children: [
          MoverCard(
            image: 'images/t1.png',
            name: 'John mark',
            contact: '+25471234589',
            chargePerKm: 10.0,
          ),
          MoverCard(
            image: 'images/t2.png',
            name: 'Jane Ledama',
            contact: '+25474895788',
            chargePerKm: 12.0,
          ),
          MoverCard(
            image: 'images/t3.png',
            name: 'David Kinyajui',
            contact: '+25475895808',
            chargePerKm: 8.0,
          ),
        ],
      ),
    );
  }
}

class MoverCard extends StatelessWidget {
  final String image;
  final String name;
  final String contact;
  final double chargePerKm;

  const MoverCard({
    required this.image,
    required this.name,
    required this.contact,
    required this.chargePerKm,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: 300,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Contact: $contact',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Charge per kilometer: \$${chargePerKm.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
