import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summative/controllers/Constants.dart';
import 'package:summative/pages/Authentication/SignIn.dart';
import 'package:summative/pages/Authentication/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
            home: Scaffold(
            appBar: AppBar(
            leading: new IconButton(icon: new Icon(Icons.close, color: Colors.white,),
            onPressed: ()
            {Navigator.push(context, MaterialPageRoute(builder: (context){
              return SignIn();
            }));},
            ),),
            body:
              Center(

              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

              Text("Kindly check your email to reset password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16 ),),



           ] ),),),);
  }
}
