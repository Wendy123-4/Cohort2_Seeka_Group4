import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summative/constant.dart';
import 'package:summative/signin_screen.dart';
import 'package:summative/signup_screen.dart';

class forgotscreen extends StatefulWidget {
  @override
  _forgotscreenState createState() => _forgotscreenState();
}

class _forgotscreenState extends State<forgotscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // ignore: missing_required_param
    body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kPrimaryColor,
            kPrimaryColor,
            kPrimaryColor,
            kPrimaryColor,
          ],
        ),
      ),

      child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 250.0, 0, 0),
                child: Text("Forgot password ?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: buildemail()),
              buildsendlinkbtn(),
           Container(
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Signin_screen();
            }));
          },
          child: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                      text: " Back to  ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400
                      )
                  ),
                  TextSpan(
                      text: "Sign in",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      )
                  )
                ]
            ),
          ),

        ),
      ),
            ],

          ),
      ),

    ),

    );
  }
}

Widget buildsendlinkbtn(){
  return Container(
    padding: EdgeInsets.fromLTRB(80, 60, 80, 60),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5,

      onPressed: () {

      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
      ),
      color: kPrimaryColor2,
      child: Text(
        "SEND RESET LINK",
        style: TextStyle(
            color: Colors.black,
            fontSize: 18
        ),
      ),
    ),
  );
}
