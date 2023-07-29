import 'package:flutter/material.dart';
import 'package:makeja/account2.dart';
import 'dart:async';
import 'package:makeja/houses_page.dart';
//import 'package:makeja/movers_page.dart'; // Import the MoversPage class
import 'package:makeja/account_page.dart';
import 'package:marquee/marquee.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _imagePosition = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 8), (timer) {
      setState(() {
        if (_imagePosition <= -200) {
          _imagePosition = 0;
        } else {
          _imagePosition -= 10;
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Makeja'),
        backgroundColor: Colors.green, // Set the app bar background color
      ),
      body: Container(
        height: MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            MediaQuery.of(context).padding.top,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white], // Set the background gradient colors
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical, // Changed to vertical scrolling
                child: Column(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInOut,
                      left: _imagePosition,
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to a new page when the image is clicked
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Accounts()),
                          );
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset(
                                'images/h7.png',
                                width: 500,
                                height: 300,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 10),
                              Text('House Hunting process'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigate to a new page when the image is clicked
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AccountPage()),
                              );
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/h3.png',
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(height: 10),
                                  Text('classic Residential Houses'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          GestureDetector(
                            onTap: () {
                              // Navigate to a new page when the image is clicked
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AccountPage()),
                              );
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/t2.png',
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(height: 5),
                                  Text('Truck 2'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Marquee(
                text: 'Makeja, Making work easier',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.green),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                blankSpace: 20.0,
                velocity: 100.0,
                pauseAfterRound: Duration(seconds: 2),
                startPadding: 10.0,
                accelerationDuration: Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Button background color
                        onPrimary: Colors.white, // Button text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Houses',
                        style: TextStyle(fontSize: 16), // Button text style
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HousesPage()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Button background color
                        onPrimary: Colors.white, // Button text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Movers',
                        style: TextStyle(fontSize: 16), // Button text style
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MoversPage()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Button background color
                        onPrimary: Colors.white, // Button text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Account',
                        style: TextStyle(fontSize: 16), // Button text style
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AccountPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///movers page part
class MoversPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movers'),
        backgroundColor: Colors.blue, // Set the app bar background color
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            MoverCard(
              image: 'images/t1.png',
              name: 'John mark',
              contact: '+25471234589',
              chargePerKm: 10.0,
            ),
            MoverCard(
              image: 'images/t2.png',
              name: 'Jane Simiyu',
              contact: '+25474895788',
              chargePerKm: 12.0,
            ),
            MoverCard(
              image: 'images/t3.png',
              name: 'David Kinyajui',
              contact: '+25475895808',
              chargePerKm: 8.0,
            ),
            MoverCard(
              image: 'images/t4.png',
              name: 'Tyson Oloo',
              contact: '+2572752757505',
              chargePerKm: 11.0,
            ),
          ],
        ),
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
      margin: EdgeInsets.all(16),
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
              width: 370,
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
