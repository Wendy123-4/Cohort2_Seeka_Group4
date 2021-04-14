import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:summative/controllers/Constants.dart';
import 'package:summative/pages/ForgotPassword.dart';
import 'package:summative/pages/SignUp.dart';
import 'package:summative/pages/HomePage.dart';
import 'package:summative/controllers/Auth.dart';

import 'HomePage.dart';

class SignIn extends StatefulWidget {
  @override
  __SignInScreenState createState() => __SignInScreenState();
}


class __SignInScreenState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _success;
  String _userEmail;
  String _password;
  FirebaseUser user;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // ignore: missing_required_param
      body: Form(
        key: _formKey,
        // AnnotatedRegion<SystemUiOverlayStyle>(
        //   value: SystemUiOverlayStyle.light,

        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        kPrimaryColor,
                        kPrimaryColor,
                        kPrimaryColor,
                        kPrimaryColor,
                      ])),
              child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 100),
                      //buildEmail(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Email",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
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
                                      offset: Offset(0, 2))
                                ]),
                            height: 60,
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black87),
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Email Required';
                                }
                                return null;
                              },
                              onSaved: (input) => _userEmail = input,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.email_sharp,
                                    color: kPrimaryColor,
                                  ),
                                  hintText: "Email Address",
                                  hintStyle: TextStyle(color: Colors.black87)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      //buildPassword(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Password",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
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
                                      offset: Offset(0, 2))
                                ]),
                            height: 60,
                            child: TextFormField(
                              obscureText: true,
                              style: TextStyle(color: Colors.black87),
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              onSaved: (input) => _password = input,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.lock_outline_sharp,
                                    color: kPrimaryColor,
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.black87)),
                            ),
                          )
                        ],
                      ),

                      Container(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return forgotscreen();
                                }));
                          },
                          padding: EdgeInsets.only(right: 0),
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(80, 30, 80, 30),
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 5,
                          onPressed: signIn,
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: kPrimaryColor2,
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                      ),

                      SizedBox(height: 20,),

                      Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return Signup_screen();
                                }));
                          },
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Don't have an account?  ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: "Sign Up",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))
                            ]),
                          ),
                        ),
                      ),

                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _userEmail, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}