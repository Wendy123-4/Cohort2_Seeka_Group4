import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summative/constant.dart';
import 'package:summative/signin_screen.dart';

class Signup_screen extends StatefulWidget{
  @override

  __Signup_screenState createState() =>  __Signup_screenState();
}

Widget buildusername(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Username",
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
          keyboardType: TextInputType.name ,
          style: TextStyle(
              color: Colors.black87
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.perm_identity_sharp,
                color: kPrimaryColor,

              ),
              hintText: "Username",
              hintStyle: TextStyle(
                  color: Colors.black87
              )
          ),
        ),
      )
    ],
  );
}

Widget buildmobile_num(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Mobile Number",
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
          keyboardType: TextInputType.number ,
          style: TextStyle(
              color: Colors.black87
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.phone,
                color: kPrimaryColor,

              ),
              hintText: "Number",
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


Widget buildsignupbtn(){
  return Container(
    padding: EdgeInsets.fromLTRB(80, 60, 80, 60),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5,
      onPressed: () => print("Sign up Pressed"),
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      color: kPrimaryColor2,
      child: Text(
        "SIGN UP",
        style: TextStyle(
            color: Colors.black,
            fontSize: 18
        ),
      ),
    ),
  );
}
Widget buildsigninbtn(){
  return GestureDetector(
    onTap: () => print(" Sign in Pressed"),
    child: RichText(
      text: TextSpan(
          children: [
            TextSpan(
                text: "Already have an account?  ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400
                )
            ),
            TextSpan(
                text: "Sign In",

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
class  __Signup_screenState extends State<Signup_screen>{
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
                        Text("Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 50),
                        buildusername(),
                        SizedBox(height: 20),
                        buildmobile_num(),
                        SizedBox(height: 20),
                        buildpassword(),
                        SizedBox(height: 20),
                        buildemail(),
                        buildsignupbtn(),
                        buildsigninbtn()
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