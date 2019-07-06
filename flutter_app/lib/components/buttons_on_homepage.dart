import 'package:flutter/material.dart';
import 'reuse_card.dart';
import 'package:vision_check_test/category_page.dart';
import 'Constants.dart';
import 'dream_card.dart';
import 'package:vision_check_test/home_page.dart';
import 'GridView.dart';
import 'Constants.dart';
import 'dream_card.dart';
import 'package:vision_check_test/DreamTitleMakerPage.dart';

class ButtonsOnHomePage extends StatefulWidget {
  @override
  _ButtonsOnHomePage createState() => _ButtonsOnHomePage();
}

class _ButtonsOnHomePage extends State<ButtonsOnHomePage> {
  @override
  Widget build(BuildContext context) {
    //This is the add dream card
    setState(() {
      if (dreamCards.length == 0) {
        dreamCards.add(
          new DreamCard(
            dreamTitle: "Add Dream",
            icon: Icons.add,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TitleMakerPage(),
                ),
              );
            },
          ),
        );
      }
    });
    return new MyGridView();
  }
}
