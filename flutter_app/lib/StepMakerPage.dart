import 'package:flutter/material.dart';
import 'components/BottomHomeBar.dart';
import 'components/category_icons.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'RepeatPage.dart';
import 'step_builder.dart';
import 'components/step_card.dart';
import 'components/Constants.dart';

class StepMaker extends StatefulWidget {
  @override
  _StepMakerState createState() => _StepMakerState();
}

class _StepMakerState extends State<StepMaker> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  //These variables are for the calendar, so when the user re clicks the calendar there
  //last submission was saved
  DateTime selected;
  DateTime dateVar = new DateTime.now();
  DateTime remDate = new DateTime.now();
  DateTime timeVar = new DateTime.now();

  //Variables to be stored in stepCard class
  String reminderTime = "Time";
  String stepName = "";
  String dateVariable = "Target Date";
  bool wantsRemind = false;
  String reminderDate = "Day";

  //Calendar pop up and format to mm, dd year
  _showDateTimePicker() async {
    var selected = await showDatePicker(
        context: context,
        initialDate: dateVar,
        firstDate: new DateTime(1960),
        lastDate: new DateTime(2050));

    setState(() {
      if (selected != null) {
        dateVariable = new DateFormat.yMMMMd("en_US")
            .format(DateTime.parse(selected.toString()));
        dateVar = selected;
      }
    });
  }

  _showDateTimePickerForRemind() async {
    var selected = await showDatePicker(
        context: context,
        initialDate: remDate,
        firstDate: new DateTime(1960),
        lastDate: new DateTime(2050));

    setState(() {
      if (selected != null) {
        reminderDate = new DateFormat("MM-dd-yyyy").format(selected);
        remDate = selected;
      }
    });
  }

  //Show time alert popup
  _showTime() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Input time",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new TimePickerSpinner(
                  is24HourMode: false,
                  normalTextStyle: TextStyle(fontSize: 20, color: Colors.black),
                  highlightedTextStyle:
                      TextStyle(fontSize: 20, color: Colors.black),
                  spacing: 40,
                  itemHeight: 80,
                  isForce2Digits: true,
                  onTimeChange: (time) {
                    setState(() {
                      reminderTime = new DateFormat("hh:mm a").format(time);
                      timeVar = time;
                    });
                  },
                ),
                MaterialButton(
                  elevation: 8.0,
                  height: 40.0,
                  minWidth: 50.0,
                  color: mainAccentColor,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  splashColor: Colors.greenAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    DateTime date3;
    var dateStringParsing = new Column(
      children: <Widget>[
        new SizedBox(
          height: 30.0,
        ),
        selected != null
            ? new Text(
                dateVariable = new DateFormat('yyyy-MM-dd h:m:s')
                    .format(DateTime.parse("2018-09-15 20:18:04Z")),
                style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                ),
              )
            : new SizedBox(
                width: 0.0,
                height: 0.0,
              ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                usersIconData,
                color: Colors.black,
                size: 30,
              ),
              Text(
                "Step information",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: mainAccentColor,
                ),
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
          ),
        ],
      ),
      body: Center(
        child: Card(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 23.0, top: 50.0, bottom: 20.0),
                        child: Text(
                          "What will you be doing for this step?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            //fontFamily: 'Chivo',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        //TextField Row
                        child: Container(
                          margin: EdgeInsets.only(bottom: 50.0),
                          height: 40.0,
                          child: TextField(
                            maxLines: 2,
                            style: TextStyle(fontSize: 20.0),
                            controller: myController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                hintText: "Enter your step here"),
                          ),
                        ),
                      ),
                      //Save button and set stepName to textfield
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          elevation: 8.0,
                          height: 40.0,
                          minWidth: 50.0,
                          color: mainButtonColor,
                          textColor: mainButtonTextColor,
                          onPressed: () => {
                                stepName = myController.text.toString(),
                              },
                          splashColor: Colors.greenAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              "SAVE",
                              style: TextStyle(
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              //Add date row
              Divider(),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 40.0, bottom: 20.0),
                        child: Text(
                          "What is your target date for this step?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            //fontFamily: 'Chivo',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 60.0),
                          child: Text(
                            dateVariable,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 30.0),
                        child: MaterialButton(
                          elevation: 8.0,
                          height: 40.0,
                          minWidth: 50.0,
                          color: mainButtonColor,
                          textColor: mainButtonTextColor,
                          onPressed: () => _showDateTimePicker(),
                          splashColor: Colors.greenAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              "Target Date",
                              style: TextStyle(
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 30.0, bottom: 20.0),
                          child: Text(
                            "Do you want to be reminded of this?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              //fontFamily: 'Chivo',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    //This is the 3rd row
                    Container(
                      margin: EdgeInsets.only(bottom: 40.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Switch(
                              value: wantsRemind,
                              onChanged: (value) {
                                setState(() {
                                  wantsRemind = value;
                                });
                              },
                              activeTrackColor: Colors.grey[300],
                              activeColor: Colors.grey[400],
                            ),
                          ),

                          //If toggled on then display pick a date row card
                          wantsRemind
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 0.0),
                                  child: Row(
                                    children: <Widget>[
                                      MaterialButton(
                                        elevation: 8.0,
                                        height: 40.0,
                                        minWidth: 50.0,
                                        color: mainButtonColor,
                                        textColor: mainButtonTextColor,
                                        onPressed: () {
                                          _showTime();
                                        },
                                        splashColor: Colors.greenAccent,
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Text(
                                            reminderTime,
                                            style: TextStyle(
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: MaterialButton(
                                          elevation: 8.0,
                                          height: 40.0,
                                          minWidth: 50.0,
                                          color: mainButtonColor,
                                          textColor: mainButtonTextColor,
                                          onPressed: () =>
                                              _showDateTimePickerForRemind(),
                                          splashColor: Colors.greenAccent,
                                          child: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Text(
                                              reminderDate,
                                              style: TextStyle(
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      MaterialButton(
                                        elevation: 8.0,
                                        height: 40.0,
                                        minWidth: 50.0,
                                        color: mainButtonColor,
                                        textColor: mainButtonTextColor,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RepeatPage(),
                                            ),
                                          );
                                        },
                                        splashColor: Colors.greenAccent,
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Text(
                                            userSelection,
                                            style: TextStyle(
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))
                              : Card(),
                        ],
                      ),
                    ),
                    Divider(),

                    //Finished button and all the shit that happens when
                    //u finished creating and all info to card
                    Expanded(
                      child: Center(
                        child: Container(
                          child: MaterialButton(
                            elevation: 8.0,
                            height: 40.0,
                            minWidth: 50.0,
                            color: mainAccentColor,
                            textColor: Colors.white,
                            onPressed: () {
                              //When user presses finish return and create new step card
                              //add all the information and add it to steps list
                              Navigator.pop(context);
                              steps.add(
                                new StepCard(
                                  stepNumber: (steps.length + 1),
                                  stepName: stepName,
                                  cardReminderDate: reminderDate,
                                  cardReminderTime: reminderTime,
                                  cardDateVariable: dateVariable,
                                  cardWantsRemind: wantsRemind,
                                ),
                              );
                              //Clear all data and reset them back to there original values
                              reminderTime = "Time";
                              stepName = "";
                              dateVariable = "Target Date";
                              wantsRemind = false;
                              reminderDate = "Day";
                            },
                            splashColor: Colors.greenAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text(
                                "FINSHED",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: new BottomHomeBar(),
    );
  }
}
