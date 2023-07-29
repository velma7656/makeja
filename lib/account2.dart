
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:makeja/auth.dart';


class Accounts extends StatelessWidget {
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
            onPressed: ()  {
              signin();
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Auth()));
            },
            child: Text('Login'),
          ),
        ]
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
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  Future signup() async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword
      (email: _emailController.text.trim(),
        password: _passwordController.text.trim() );
    adduser(_usernameController.text.trim(),
        _emailController.text.trim()
    );
  }
  Future adduser(String username,String email) async {
    await FirebaseFirestore.instance.collection('users').add(
        {
          'username': username,
          'email': email,
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
            ),
          ),
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
            onPressed: () {
              signup();
            },
            child: Text('Create Account'),
          ),
        ],
      ),
    );
  }}

