import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Makeja',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AccountPage(),
    );
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Account'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Login'),
              Tab(text: 'Create Account'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoginTab(),
            CreateAccountTab(),
          ],
        ),
      ),
    );
  }
}

class LoginTab extends StatefulWidget {
  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
   get isAuthenticated async => null;

  bool get isadmin => true;

  Future signin()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword
      (email:_emailController.text.trim(),
        password: _passwordController.text.trim());
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              signin();


              // Replace this with actual login logic using your authentication system


            if (isAuthenticated) {
              //  SharedPreferences prefs = await SharedPreferences.getInstance();
              //  bool isAdmin = prefs.getBool('isAdmin') ?? false;


                if (isadmin) {
                  Navigator.pushReplacement(
                   context,
                    MaterialPageRoute(builder: (context) => AdminPage()),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );


                }
    } else {
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
    title: Text('Login Failed'),
    content: Text('Invalid email or password.'),
    actions: [
    ElevatedButton(
    onPressed: () => Navigator.pop(context),
    child: Text('OK'),
    ),
                    ],
                  ),
                );
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }


      // Load and decode the JSON data from data.json



      // Find the user with matching email and password
      Map<String, dynamic>? foundUser;

        }



class CreateAccountTab extends StatefulWidget {
  @override
  _CreateAccountTabState createState() => _CreateAccountTabState();
}

class _CreateAccountTabState extends State<CreateAccountTab> {
  // TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool get isCreated => true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // TextField(
            // controller: _usernameController,
            // decoration: InputDecoration(
              // labelText: 'Username',
            // ),
          // ),
          SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              // String username = _usernameController.text;
              String email = _emailController.text;
              String password = _passwordController.text;



              // Replace this with actual account creation logic using your authentication system
              // bool isCreated = await _performAccountCreation(username, email, password);

              if (isCreated) {
               // SharedPreferences prefs = await SharedPreferences.getInstance();
                //prefs.setBool('isAdmin', false);
                //prefs.setString('email', email);
               // prefs.setString('password', password);

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Account Created'),
                    content: Text('Your account has been created successfully.'),
                    actions: [
                      ElevatedButton(
                       onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );

                // _usernameController.clear();
                _emailController.clear();
                _passwordController.clear();
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Account Creation Failed'),
                    content: Text('Failed to create your account.'),
                    actions: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: Text('Create Account'),
          ),
        ],
      ),
    );
  }

  Future<bool> _performAccountCreation(String email, String password) async {
    try {
      // Load and decode the JSON data from data.json
      String jsonData = await rootBundle.loadString('assets/data.json');
      List<dynamic> users = jsonDecode(jsonData);

      // Check if the email already exists in the users list
      bool emailExists = users.any((user) => user['email'] == email);
      if (emailExists) {
        return false; // Email already exists, account creation failed
      }

      // Add the new user account to the users list
      users.add({
        'email': email,
        'password': password,
        'isAdmin': false, // Set isAdmin to false for new users by default
      });

      // Convert the updated users list back to JSON and write it to data.json
      String updatedData = jsonEncode(users);
      String dataPath = 'assets/data.json'; // Path to the data.json file

      // Write the updated JSON data to data.json
      await File(dataPath).writeAsString(updatedData);

      return true; // Account created successfully
    } catch (e) {
      // Handle any errors while reading, updating, or writing to data.json
      print('Error updating data.json: $e');
      return false;
    }
  }
}

class HomePage extends StatelessWidget {
  final List<String> houseImages = [
    'images/h1.png',
    'images/h2.png',
    'images/h3.png',
    'images/h4.png',
    'images/h5.png',
    'images/h6.png',
  ];

  final List<String> houseDescriptions = [
    'House 1\nPrice: Ksh 1,500,000\nLocation: Nairobi\nRooms: 3',
    'House 2\nPrice: Ksh 2,000,000\nLocation: Nairobi\nRooms: 4',
    'House 3\nPrice: Ksh 1,800,000\nLocation: Nairobi\nRooms: 3',
    'House 4\nPrice: Ksh 2,500,000\nLocation: Nairobi\nRooms: 5',
    'House 5\nPrice: Ksh 2,200,000\nLocation: Nairobi\nRooms: 4',
    'House 6\nPrice: Ksh 1,700,000\nLocation: Nairobi\nRooms: 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: houseImages.length,
                itemBuilder: (context, index) {
                  return HouseCard(
                    image: houseImages[index],
                    description: houseDescriptions[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HouseCard extends StatelessWidget {
  final String image;
  final String description;

  HouseCard({required this.image, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(image, width: 220, height: 220), // Adjust the width and height here
          const SizedBox(height: 10),
          Text(description, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class AdminPage extends StatelessWidget {
  bool get isAdmin => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: _buildUserTable(), // Show the user table here
    );
  }

  Widget _buildUserTable() {
    return FutureBuilder(
      //future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
         // SharedPreferences prefs = snapshot.data!;
          //bool isAdmin = prefs.getBool('isAdmin') ?? false;

          if (isAdmin) {
            // Fetch user registration data from SharedPreferences
            return FutureBuilder<List<Map<String, dynamic>>>(
              future: _loadUserDataFromJson(), // Load user data from data.json
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  List<Map<String, dynamic>> users = snapshot.data ?? [];

                  return DataTable(
                    columns: const <DataColumn>[
                      DataColumn(label: Text('Username')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Password')),
                    ],
                    rows: users.map((user) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(Text(user['email'] ?? 'Unknown')),
                          DataCell(Text(user['email'] ?? 'Unknown')),
                          DataCell(Text(user['password'] ?? 'Unknown')),
                        ],
                      );
                    }).toList(),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          } else {
            return Center(
              child: Text('You do not have permission to view this page.'),
            );
          }
        } else {
          // Show a loading indicator while waiting for SharedPreferences
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // Load user data from data.json
  Future<List<Map<String, dynamic>>> _loadUserDataFromJson() async {
    try {
      String jsonData = await rootBundle.loadString('assets/data.json');
      List<dynamic> users = jsonDecode(jsonData);
      return users.cast<Map<String, dynamic>>();
    } catch (e) {
      print('Error loading user data from data.json: $e');
      return [];
    }
  }
}
