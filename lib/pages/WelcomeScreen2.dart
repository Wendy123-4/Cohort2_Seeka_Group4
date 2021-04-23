import 'package:flutter/material.dart';
import 'package:summative/controllers/Constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SignIn.dart';

// void main => runApp(HomePage());
class Direction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Category Card
    Widget categoryCard = Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: 350,
            padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Image.asset(
                      'assets/images/contact-form.png',
                      width: 60,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Apply",
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w500,
                              textStyle: TextStyle(color: Color(0xFFFEB4566))),
                        ),
                        Text("Fill in personal information within 4 \nminutes",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.5,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );

    // Category Card
    Widget categoryCard1 = Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: 350,
            padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Image.asset(
                      'assets/images/approval-symbol-in-badge.png',
                      width: 60,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Approve",
                            style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFEB4566)))),
                        Text(
                            "Wait about 20 minutes to verify the \nauthenticity of the application",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.5,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );

    // Category Card
    Widget categoryCard2 = Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: 350,
            padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Image.asset(
                      'assets/images/income.png',
                      width: 60,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Receive Money",
                            style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFEB4566)))),
                        Text(
                            "Once the application is approved, \nloan will be sent to account",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.5,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );

    // Category Card
    Widget categoryCard3 = Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: 350,
            padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Image.asset(
                      'assets/images/money.png',
                      width: 60,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Payback",
                            style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFEB4566)))),
                        Text("Fill in personal information within 4 \nminutes",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.5,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );

    // Next Button

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
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                ),
                Column(
                  children: [
                    Text("How it works",
                        style: GoogleFonts.quicksand(
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                    SizedBox(height: 30),
                    categoryCard,
                    categoryCard1,
                    categoryCard2,
                    categoryCard3,
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(80, 40, 80, 60),
                  width: 300.0,
                  child: RaisedButton(
                    elevation: 5,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignIn();
                      }));
                    },
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: kPrimaryColor2,
                    child: Text(
                      "Continue",
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
