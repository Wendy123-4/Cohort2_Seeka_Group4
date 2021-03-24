import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summative/controllers/constant.dart';
import 'package:summative/pages/resetlink_confirmation.dart';
import 'package:summative/pages/signin_screen.dart';
import 'package:summative/pages/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class forgotscreen extends StatefulWidget {
  @override
  _forgotscreenState createState() => _forgotscreenState();
}

class _forgotscreenState extends State<forgotscreen> {

  String _email;
  final auth = FirebaseAuth.instance;

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
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),

                child: Text("Forgot password ?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 150),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[
                      Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
                            ]),
                        height: 60,
                        child: TextFormField(

                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.black87),
                          validator: (input) {
                            if(input.isEmpty){
                              return 'Email Required';
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              _email = value.trim();
                            });
                          },


                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                Icons.email_sharp,
                                color: kPrimaryColor,
                              ),

                              hintText: "Email Address",
                              hintStyle: TextStyle(color: Colors.black87)
                          ),
                        ),

                      )
                    ],
                  ),
                //buildemail()
              ),
              //buildsendlinkbtn(),
              Container(
                padding: EdgeInsets.fromLTRB(80, 60, 80, 60),
                width: double.infinity,
                child: RaisedButton(
                  elevation: 5,

                  onPressed: () {
                    auth.sendPasswordResetEmail(email: _email);
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return ResetLink();
                    }));
                  },
                  padding: EdgeInsets.all(15),
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
              ),

              Container(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return SignIn();
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
      padding: EdgeInsets.all(15),
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

Widget buildemail(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Email",
        style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.normal
        ),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0,2)
              )
            ]
        ),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.emailAddress ,
          style: TextStyle(
              color: Colors.black87
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email_sharp,
                color: kPrimaryColor,

              ),
              hintText: "Email Address",
              hintStyle: TextStyle(
                  color: Colors.black87
              )
          ),
        ),
      )
    ],
  );
}