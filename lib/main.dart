import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:summative/pages/WelcomeScreen.dart';
import 'package:summative/controllers/Constants.dart';

void main() {
  // Ensure that plugin services are initialized so that `availableCameras()`
// can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Welcome Screen',
        theme: ThemeData(
            primaryColor: kPrimaryColor,
            textTheme: TextTheme(
                headline5: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                button: TextStyle(
                  color: kPrimaryColor,
                )),
            inputDecorationTheme: InputDecorationTheme(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryColor.withOpacity(.4),
                    )))),
        home: WelcomeScreen());
  }
}
