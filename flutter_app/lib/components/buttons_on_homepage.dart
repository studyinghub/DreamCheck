import 'package:flutter/material.dart';
import 'reuse_card.dart';
import 'package:vision_check_test/category_page.dart';

class ButtonsOnHomePage extends StatelessWidget {
  const ButtonsOnHomePage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: new ReusableCard(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryList(),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: new ReusableCard(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryList(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          //height: bottomContainerHeight,
        ),
      ],
    );
  }
}
