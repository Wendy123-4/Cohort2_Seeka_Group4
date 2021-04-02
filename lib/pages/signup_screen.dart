import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summative/controllers/constant.dart';
import 'package:summative/pages/forgot_pass.dart';
import 'signin_screen.dart';
import 'signin_screen.dart';

class Signup_screen extends StatefulWidget{
  @override

  __Signup_screenState createState() =>  __Signup_screenState();
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
        child: TextFormField(
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
          borderRadius: BorderRadius.circular(30)
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
class  __Signup_screenState extends State<Signup_screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  bool _success;
  String _userEmail;
  String _password;
  String _cpassword;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _register() async {
    final FirebaseUser user = (await
    _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
    ).user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
        try{
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
        }catch(e){
          print(e.message);
        }
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // ignore: missing_required_param
      body: Form(
        key: _formKey,
        // AnnotatedRegion<SystemUiOverlayStyle>(
        // value:SystemUiOverlayStyle.light ,
        child: GestureDetector(
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
                        //buildemail(),
                        Column(
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
                                        offset: Offset(0, 2)
                                    )
                                  ]
                              ),
                              height: 60,
                              child: TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                    color: Colors.black87
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                                onChanged: (input) => _userEmail = input,
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
                          ],),
                        SizedBox(height: 20),
                        // buildpassword(),
                        Column(
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
                                        offset: Offset(0, 2)
                                    )
                                  ]
                              ),
                              height: 60,
                              child: TextFormField(
                                controller: _passwordController,
                                validator: (String value) {
                                  if (value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                onChanged: (value) => _password = value,
                                obscureText: true,
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
                        ),
                        SizedBox(height: 20),
                        //buildpassword(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              " Confirm Password",
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
                                        offset: Offset(0, 2)
                                    )
                                  ]
                              ),
                              height: 60,
                              child: TextFormField(
                                controller: _cpasswordController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'This field is required';
                                  }

                                  if (value != _password) {
                                    return 'Confimation password does not match the entered password';
                                  }

                                  return null;
                                },
                                onChanged: (value) => _cpassword = value,
                                obscureText: true,
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
                                    hintText: "Please re-enter Password",
                                    hintStyle: TextStyle(
                                        color: Colors.black87
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),

                        Container(
                          padding: EdgeInsets.fromLTRB(80, 60, 80, 60),
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 5,
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                _register();
                              }
                            },
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
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
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(_success == null
                              ? ''
                              : (_success
                              ? 'Successfully registered ' + _userEmail
                              : 'Registration failed')),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return SignIn();
                                  }));
                            },
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
                                            decoration: TextDecoration
                                                .underline,
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
                        //buildsignupbtn(),
                        //buildsigninbtn()
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

  // void signUp() async {
  //   if(_formKey.currentState.validate()){
  //     _formKey.currentState.save();
  //     try{
  //       await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
  //     }catch(e){
  //       print(e.message);
  //     }
  //   }
  // }


}