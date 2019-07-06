import 'package:flutter/material.dart';
import 'components/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login/welcome_page.dart';

class Settings extends StatefulWidget {
  static const String id = 'settings_page';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 35.0,
            color: Colors.grey[900],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainAccentColor,
        tooltip: 'Sign Out',
        onPressed: () {
          //sign out of _auth
          _auth.signOut();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomePage(),
            ),
          );
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[],
      ),
    );
  }
}
