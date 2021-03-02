import 'package:flutter/material.dart';
import 'package:summative/constant.dart';
import 'package:google_fonts/google_fonts.dart';

// void main => runApp(HomePage());
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Drawer
    Widget drawerSection = Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Seeka',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            letterSpacing: 1.5)),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
          ),
          ListTile(
            title: Text('My Dashboard', style: GoogleFonts.poppins()),
            onTap: () {
              // Update the state of the app
              // Closing the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Help', style: GoogleFonts.poppins()),
            onTap: () {
              // Update the state of the app
              // Closing the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Logout', style: GoogleFonts.poppins()),
            onTap: () {
              // Update the state of the app
              // Closing the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );

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
                        Text("Apply", style: GoogleFonts.poppins()),
                        Text("Fill in personal information within 4 \nminutes",
                            style: GoogleFonts.poppins()),
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
          SizedBox(height: 10),
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
                        Text("Approve", style: GoogleFonts.poppins()),
                        Text("Wait about 20 minutes to verify the \nauthenticity of the application",
                            style: GoogleFonts.poppins()),
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
          SizedBox(height: 10),
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
                        Text("Receive Money", style: GoogleFonts.poppins()),
                        Text("Once the application is approved, the \nloan will be sent to the mobile account",
                            style: GoogleFonts.poppins()),
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
          SizedBox(height: 10),
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
                        Text("Payback", style: GoogleFonts.poppins()),
                        Text("Fill in personal information within 4 \nminutes",
                            style: GoogleFonts.poppins()),
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
          SizedBox(height: 10),
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
        drawer: drawerSection,
        appBar: AppBar(),
        body: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: 60,
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Text("How it works",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontSize: 18))),
                    SizedBox(height: 10),
                    categoryCard,
                    categoryCard1,
                    categoryCard2,
                    categoryCard3,
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
