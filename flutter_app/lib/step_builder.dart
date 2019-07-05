import 'package:flutter/material.dart';
import 'dart:collection';
import 'components/BottomHomeBar.dart';
import 'components/category_icons.dart';
import 'StepMakerPage.dart';
import 'components/step_card.dart';

String backgroundText = "No Dreams";
List<Widget> steps = new List<Widget>();
ScrollController _scrollController =
    new ScrollController(initialScrollOffset: 20.0);

Expanded _buildCardList(context) {
  return Expanded(
    child: ListView.builder(
      // Must have an item count equal to the number of items!
      itemCount: steps.length,
      controller: _scrollController,

      // A callback that will return a widget.
      itemBuilder: (context, index) {
        // In our case, a stepCard for each step
        return (steps[index]);
      },
    ),
  );
}

class Steps extends StatefulWidget {
  @override
  _StepsState createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  @override
  void initState() {
    super.initState();
  }

  Card tempForAddingButtonInQueue;
  bool pressedAddForFirstTime = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(
                usersIconData,
                color: Colors.black,
                size: 30,
              ),
              Text(
                "Your steps",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color(0xFF15C96C),
                ),
              ),
            ],
          ),
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
//
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              steps.length.toString(),
            ),
            (steps.length != 0) ? _buildCardList(context) : Text("No Dreams"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 8.0,
        shape: RoundedRectangleBorder(),
        backgroundColor: Color(0xFF15C96C),
        icon: Icon(
          Icons.add,
        ),
        onPressed: () {
          //this is where the pop up should come out and stuff
          setState(() {});

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StepMaker()),
          );
        },
        label: Text(
          'Add step',
        ),
      ),
      bottomNavigationBar: new BottomHomeBar(),
    );
  }
}
