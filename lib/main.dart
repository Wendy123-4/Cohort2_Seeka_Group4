import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summative/pages/WelcomeScreen.dart';
import 'package:summative/controllers/Constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Welcome Screen',
        theme: theme.themeData(context),
        home: WelcomeScreen());
  }
}
