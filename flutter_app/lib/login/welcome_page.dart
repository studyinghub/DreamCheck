import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'oval_button_for_log.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:vision_check_test/components/Constants.dart';

class WelcomePage extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TyperAnimatedTextKit(
                  text: ['Dream Check'],
                  textStyle: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            OvalButtonForLogIn(
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, LoginPage.id);
              },
              text: 'Log In',
              color: Colors.lightBlueAccent,
            ),
            OvalButtonForLogIn(
              onPressed: () {
                //Go to registration screen.
                Navigator.pushNamed(context, RegisterPage.id);
              },
              text: 'Register',
              color: mainAccentColor,
            ),
          ],
        ),
      ),
    );
  }
}
