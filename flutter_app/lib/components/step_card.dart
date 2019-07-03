import 'package:flutter/material.dart';
import 'package:vision_check_test/StepMakerPage.dart';
import 'VerticalDivider.dart';

class StepCard extends StatelessWidget {
  StepCard(
      {@required this.stepNumber,
      @required this.stepName,
      @required this.cardReminderDate,
      @required this.cardReminderTime,
      @required this.cardWantsRemind,
      @required this.cardDateVariable});
  //6 variables
  int stepNumber;
  String stepName;
  String cardReminderTime;
  String cardDateVariable;
  bool cardWantsRemind = false;
  String cardReminderDate;

  @override
  Widget build(BuildContext context) {
    //Constant for wrapping text
    double c_width = MediaQuery.of(context).size.width * 0.70;
    return Container(
      margin: EdgeInsets.all(5.0),
      height: 124.0,
      child: Card(
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Text(stepNumber.toString(),
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),

              RotatedBox(
                quarterTurns: 1,
                child: Divider(),
              ),

              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Finish By: " + cardDateVariable,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xFF15C96C),
                      ),
                    ),
                  ),
                  Container(
                    width: c_width,
                    child: Text(
                      stepName,
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    elevation: 8.0,
                    height: 30.0,
                    minWidth: 10.0,
                    color: Color(0xFF15C96C),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    splashColor: Colors.greenAccent,
                    child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Icon(Icons.check)),
                  ),
                  MaterialButton(
                    elevation: 8.0,
                    height: 30.0,
                    minWidth: 10.0,
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    splashColor: Colors.redAccent,
                    child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Icon(Icons.close)),
                  ),
                ],
              ),

              Column(
                children: <Widget>[],
              ),
//              Container(
//                  width: c_width,
//                  child: ),
            ],
          ),
        ),
      ),
    );
  }
}
