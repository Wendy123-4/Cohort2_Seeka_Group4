import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:summative/controllers/Constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summative/pages/History.dart';

import 'RequestLoan.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RequestLoanFormThree extends StatefulWidget {
  @override
  _RequestLoanFormThreeState createState() => _RequestLoanFormThreeState();
}

class _RequestLoanFormThreeState extends State<RequestLoanFormThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification Information"),
      ),
      body: Stack(
        children: <Widget>[
          //  ===========  I think we should also leave comments in our code to indicate what different items
          // whether widgets or functions do ========== //
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-4.0, 0.0),
                end: Alignment(0.0, 1.5),
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor,
                  kGradientColor1,
                  kGradientColor2,
                  kGradientColor3,
                  kGradientColor4,
                  kGradientColor4
                ],
                stops: [0.0, 0.3, 0.2, 0.3, 0.63, 0.63, 0.0],
              ),
            ),
            // Inserting the header widget here
            // child: header,
          ),

          // The rest of the white body
          Container(
            margin: EdgeInsets.only(top: 70.0),
            padding: EdgeInsets.only(top: 1.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Form(
                child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(bottom: 30)),

                // Form Input Widgets
                Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Passport *',
                        style: TextStyle(fontSize: 18, color: textColor),
                      ),
                    )),
                SizedBox(
                  height: 8,
                ),

                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.upload_rounded),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white, // background
                          onPrimary: Colors.white70, // foreground
                        ),
                        onPressed: () {
                          print("Login pressed.");
                        },
                        child: Text(
                          'Upload Passport',
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),

                Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Take a Selfie *',
                        style: TextStyle(fontSize: 18, color: textColor),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '(Note: Picture must be in portrait)',
                        style: TextStyle(fontSize: 16, color: textColor),
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.camera,
                        size: 80.0,
                      ),
                    )),

                SizedBox(
                  height: 30,
                ),

                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Kindly verify mobile number for transaction',
                      labelText: 'Kindly verify mobile number for transaction',
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RequestLoan();
                      }));
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    elevation: 0.0,
                    color: kPrimaryColor2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                )
              ],
            )),
          ),
          //BottomNavigation(),
        ],
      ),
    );
  }
}

// Header with the Seeka name
Widget header = Container(
  margin: EdgeInsets.symmetric(vertical: 70.0),
  child: Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "     Employment Information",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  ],
                )),
          ],
        ),
      ),
    ],
  ),
);

Widget drawerSection = NewWidget();

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Wendy"),
            accountEmail: Text("w.essuman@alustudent.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "W",
                style: TextStyle(fontSize: 25, color: kPrimaryColor),
              ),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.history_outlined),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('My History', style: GoogleFonts.poppins()),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HistoryScreen();
              }));
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.help_center_outlined),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Help', style: GoogleFonts.poppins()),
                ),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.logout),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Logout', style: GoogleFonts.poppins()),
                ),
              ],
            ),
            onTap: () async {
              final FirebaseUser user = await _auth.currentUser();
              if (user == null) {
                Scaffold.of(context).showSnackBar(const SnackBar(
                  content: Text('No one has signed in.'),
                ));
                return;
              }
              await _auth.signOut();
              final String uid = user.uid;
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(uid + ' has successfully signed out.'),
              ));
            },
          ),
        ],
      ),
    );
  }
}
