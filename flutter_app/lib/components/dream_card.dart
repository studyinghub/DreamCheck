import 'package:flutter/material.dart';
import 'package:vision_check_test/StepMakerPage.dart';
import 'VerticalDivider.dart';
import 'package:vision_check_test/category_page.dart';
import 'Constants.dart';

class DreamCard extends StatelessWidget {
  DreamCard(
      {@required this.icon,
      @required this.dreamTitle,
      @required this.onPressed});

  IconData icon;
  String dreamTitle;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(20.0),
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(
              Radius.circular(8.0),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 20.0,
              ),
            ]),
        height: 180.0,
        width: 180.0,
        child: Column(
          children: <Widget>[
            Flexible(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, left: 3.0, right: 3.0),
                child: Text(
                  dreamTitle,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Icon(
                icon,
                size: 70.0,
                color: mainAccentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
