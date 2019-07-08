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

bool addDreamGotPressed = false;
int positionOfDreamPressed = 0;

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
              addDreamGotPressed = true;
              positionOfDreamPressed = 0;
              print(positionOfDreamPressed.toString());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TitleMakerPage(),
                ),
              );
            },
            position: 0,
          ),
        );
      }
    });
    return new MyGridView();
  }
}
