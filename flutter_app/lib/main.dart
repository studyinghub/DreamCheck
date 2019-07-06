import 'package:flutter/material.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'package:vision_check_test/DreamTitleMakerPage.dart';
import 'package:vision_check_test/StepMakerPage.dart';
import 'step_builder.dart';
import 'package:vision_check_test/RepeatPage.dart';
import 'login/login_page.dart';
import 'login/register_page.dart';
import 'login/welcome_page.dart';

//sup mr mascolo
void main() {
  runApp(
    MaterialApp(
      routes: {
        CategoryList.id: (context) => CategoryList(),
        TitleMakerPage.id: (context) => TitleMakerPage(),
        HomePage.id: (context) => HomePage(),
        StepMaker.id: (context) => StepMaker(),
        Steps.id: (context) => Steps(),
        RepeatPage.id: (context) => RepeatPage(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        WelcomePage.id: (context) => WelcomePage(),
      },
      initialRoute: WelcomePage.id,
    ),
  );
}
