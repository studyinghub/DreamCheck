import 'package:flutter/material.dart';
import 'dart:collection';
import 'components/BottomHomeBar.dart';
import 'components/category_icons.dart';
import 'StepMakerPage.dart';
import 'components/step_card.dart';
import 'components/Constants.dart';
import 'home_page.dart';
import 'components/dream_card.dart';
import 'components/category_icons.dart';
import 'components/buttons_on_homepage.dart';

DreamCard d;
List<Widget> steps;
List<List<Widget>> stepsList = new List<List<Widget>>();
List<Widget> dSteps;
int stepPosition;
ScrollController _scrollController =
    new ScrollController(initialScrollOffset: 20.0);

_buildCardList(context) {
  return Expanded(
    child: ListView.builder(
      // Must have an item count equal to the number of items!
      itemCount: (d.getPosition() != 0) ? dSteps.length : steps.length,
      controller: _scrollController,

      // A callback that will return a widget.
      itemBuilder: (context, index) {
        // In our case, a stepCard for each step
        return ((d.getPosition() != 0) ? dSteps[index] : steps[index]);
      },
    ),
  );
}

class Steps extends StatefulWidget {
  static const String id = 'stepbuilder_page';
  @override
  _StepsState createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  @override
  void initState() {
    steps = new List<Widget>();
    print(positionOfDreamPressed);
    d = dreamCards.elementAt(positionOfDreamPressed);
    print(d.getStepList());
    dSteps = d.getStepList();
    stepPosition = stepsList.length - 1;
    super.initState();
  }

  List<Widget> stepsClone;
  Card tempForAddingButtonInQueue;
  bool pressedAddForFirstTime = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: Text(
                  "Steps to achieve dream",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color(0xFF15C96C),
                  ),
                  overflow: TextOverflow.fade,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Icon(
                  usersIconData,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
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
//
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      elevation: 8.0,
                      height: 40.0,
                      minWidth: 50.0,
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          print(d.getPosition().toString());
                          stepsClone = List.from(steps);
                          print('Cloned list: $stepsClone');
                          if (positionOfDreamPressed == 0) {
                            print("WORKINGG");
                            print(stepsList.length.toString());
                            stepsList.add(stepsClone);
                          }
                          if (addDreamGotPressed == true) {
                            dreamCards.add(new DreamCard(
                              icon: usersIconData,
                              dreamTitle: userDreamTitle,
                              onPressed: () {
                                positionOfDreamPressed = dreamCards.length - 1;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => new Steps(),
                                  ),
                                );
                              },
                              stepList: stepsClone,
                              position: dreamCards.length,
                            ));

                            addDreamGotPressed = false;
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        });

                        print(dreamCards);
                        print(stepsClone.toString());
                      },
                      splashColor: Colors.greenAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          "FINISHED",
                          style: TextStyle(
                            fontSize: 15.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      elevation: 8.0,
                      height: 40.0,
                      minWidth: 50.0,
                      color: mainAccentColor,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => new StepMaker(),
                          ),
                        );
                      },
                      splashColor: Colors.greenAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Add Step",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (d.getPosition() != 0)
              {
                (steps.length != 0)
                    ? _buildCardList(context)
                    : Text("No Dreams")
              },
          ],
        ),
      ),
      bottomNavigationBar: new BottomHomeBar(),
    );
  }
}
