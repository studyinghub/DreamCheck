import 'package:flutter/material.dart';
import 'package:vision_check_test/home_page.dart';

class BottomHomeBar extends StatelessWidget {
  const BottomHomeBar();

  @override
  Widget build(BuildContext context) {
    return new BottomAppBar(
      color: Color(0xFFFFFFFF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.gps_fixed,
              size: 35.0,
            ),
            onPressed: () {
              //when pressed this should lead to the target's page
            },
          ),
          new IconButton(
            icon: new Icon(
              Icons.home,
              size: 35.0,
            ),
            onPressed: () {
              //when pressed this should lead to the home page again
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
          new IconButton(
            icon: new Icon(
              Icons.settings,
              size: 33.0,
            ),
            onPressed: () {
              //this should lead to the settings section
            },
          ),
        ],
      ),
    );
  }
}
