import 'package:flutter/material.dart';
import 'components/BottomHomeBar.dart';
import 'components/buttons_on_homepage.dart';
import "components/dream_card.dart";
import "components/Constants.dart";

String userDreamTitle;

class HomePage extends StatelessWidget {
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
            'My Visions',
            style: TextStyle(
              color: Color(0xFF39414C),
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0xFFFFFFFF),
        ),
        body: new ButtonsOnHomePage(),
        bottomNavigationBar: new BottomHomeBar(),
      ),
    );
  }
}
