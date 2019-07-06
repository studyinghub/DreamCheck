import 'package:flutter/material.dart';
import 'package:vision_check_test/step_builder.dart';
import 'components/Constants.dart';
import 'category_page.dart';
import 'home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TitleMakerPage extends StatefulWidget {
  static const String id = 'titlemaker_page';
  @override
  _TitleMakerPage createState() => _TitleMakerPage();
}

class _TitleMakerPage extends State<TitleMakerPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  String titleOfDream;

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
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Chivo').copyWith(
        secondaryHeaderColor: Color(0xFF15C96C),
        primaryColor: Color(0xFFFFFFFF),
        scaffoldBackgroundColor: Color(0xFFD9DFE3),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "What is your Dream?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color(0xFF15C96C),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Enter the Title of Your Dream!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.black),
                ),
                TextField(
                  onChanged: (value) {
                    titleOfDream = value;
                  },
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(fontSize: 30.0),
                  controller: myController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: "Type here"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: MaterialButton(
                    elevation: 8.0,
                    height: 40.0,
                    minWidth: 50.0,
                    color: mainButtonColor,
                    textColor: mainButtonTextColor,
                    onPressed: () {
                      _firestore.collection('dreams').add({
                        //add the title of the dream with 'email' and
                        //'title'
                        'title': titleOfDream,
                        'email': loggedInUser.email,
                      });
                      userDreamTitle = myController.text.toString();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryList(),
                        ),
                      );
                    },
                    splashColor: Colors.greenAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
