import 'package:flutter/material.dart';
import 'components/category_icons.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: new Icon(
              Icons.close,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        title: Text(
          "Choose a Category",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color(0xFF15C96C),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: new CategoryWidget(),
    ));
  }
}
