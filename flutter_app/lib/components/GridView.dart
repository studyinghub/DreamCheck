import 'package:flutter/material.dart';
import 'reuse_card.dart';
import 'package:vision_check_test/category_page.dart';
import 'Constants.dart';
import 'package:vision_check_test/components/dream_card.dart';

class MyGridView extends StatefulWidget {
  @override
  _MyGridView createState() => _MyGridView();
}

class _MyGridView extends State<MyGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(0.0),
      children: _getGridItems(context),
    );
  }

  _getGridItems(BuildContext context) {
    return dreamCards;
  }
}
