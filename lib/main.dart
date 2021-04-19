import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summative/pages/HomePage.dart';
import 'package:summative/pages/WelcomeScreen.dart';
import 'package:summative/controllers/Constants.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Welcome Screen',
//         theme: ThemeData(
//             primaryColor: kPrimaryColor,
//             textTheme: TextTheme(
//                 headline5: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.normal,
//                 ),
//                 button: TextStyle(
//                   color: kPrimaryColor,
//                 )),
//             inputDecorationTheme: InputDecorationTheme(
//                 enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: kPrimaryColor.withOpacity(.4),
//                     )))),
//         home: WelcomeScreen());
//   }
// }

Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  print(email);
  runApp(MaterialApp(home: email == null ? WelcomeScreen() : HomeScreen() )) ;
}
