

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summative/constant.dart';
import 'package:summative/forgot_pass.dart';
import 'package:summative/signup_screen.dart';
import 'package:summative/homepage.dart';
import 'package:summative/forgot_pass.dart';

class Signin_screen extends StatefulWidget{
  @override

   __Signin_screenState createState() =>  __Signin_screenState();
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

Widget buildpassword(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Password",
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
            borderRadius: BorderRadius.circular(30),
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
          obscureText: true ,
          style: TextStyle(
              color: Colors.black87
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock_outline_sharp,
                color: kPrimaryColor,

              ),
              hintText: "Password",
              hintStyle: TextStyle(
                  color: Colors.black87
              )
          ),
        ),
      )
    ],
  );
}


Widget buildforgot_password(){
  return Container(
    alignment: Alignment.centerRight,
    child: FlatButton(
      onPressed: () => print("Forgot Password pressed"),
      padding: EdgeInsets.only(right: 0),
      child: Text(
        'Forgot Password?',
        style: TextStyle(
            decoration: TextDecoration.underline,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
  );

}
Widget buildloginbtn(){
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
        "SIGN IN",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18
        ),
      ),
    ),
  );
}
Widget buildsignupbtn(){
  return GestureDetector(
    onTap: () {},
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don't have an account?  ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400
            )
          ),
          TextSpan(
            text: "Sign Up",
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

  );
}
class  __Signin_screenState extends State<Signin_screen>{
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // ignore: missing_required_param
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value:SystemUiOverlayStyle.light ,
        child: GestureDetector(
          child: Stack(
            children:<Widget> [

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
                      ]
                    )
                  ),


                 child: SingleChildScrollView(

                   padding: EdgeInsets.symmetric(
                     horizontal: 25,
                     vertical: 120
                   ),


                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,

                       children: <Widget>[
                         Text("Sign In",
                           style: TextStyle(
                               color: Colors.white,
                               fontSize: 30,
                               fontWeight: FontWeight.bold
                           ),
                         ),
                         SizedBox(height: 200),
                         buildemail(),
                         SizedBox(height: 20),
                         buildpassword(),
                         //buildforgot_password(),
                         //buildloginbtn(),
                     Container(
                       alignment: Alignment.centerRight,
                       child: FlatButton(
                         onPressed: ()  {
                           Navigator.push(context, MaterialPageRoute(builder: (context){
                             return Forgot_screen();
                           }));

                         },
                         padding: EdgeInsets.only(right: 0),
                         child: Text(
                           'Forgot Password?',
                           style: TextStyle(
                               decoration: TextDecoration.underline,
                               color: Colors.white,
                               fontWeight: FontWeight.bold
                           ),
                         ),
                       ),
                     ),
                     Container(
                       padding: EdgeInsets.fromLTRB(80, 60, 80, 60),
                       width: double.infinity,
                       child: RaisedButton(
                         elevation: 5,

                         onPressed: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context){
                             return Homepage_screen();
                           }));

                         },
                         padding: EdgeInsets.all(15),
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(30)
                         ),
                         color: kPrimaryColor2,
                         child: Text(
                           "SIGN IN",
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
                                 return Signup_screen();
                               }));
                             },
                             child: RichText(
                               text: TextSpan(
                                   children: [
                                     TextSpan(
                                         text: "Don't have an account?  ",
                                         style: TextStyle(
                                             color: Colors.white,
                                             fontSize: 15,
                                             fontWeight: FontWeight.w400
                                         )
                                     ),
                                     TextSpan(
                                         text: "Sign Up",
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

                         //buildsignupbtn()
                       ],

                     )
                 ),

                ),


            ],
          ),
        ),
      ),

    );
  }
}