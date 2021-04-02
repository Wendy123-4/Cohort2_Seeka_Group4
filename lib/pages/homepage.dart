import 'package:flutter/material.dart';
import 'package:summative/pages/Dashboard.dart';
import 'package:summative/controllers/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summative/pages/History.dart';

// void main => runApp(HomePage());
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerSection,
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
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
            child: header,
          ),
          Container(
            margin: EdgeInsets.only(top: 180.0),
            padding: EdgeInsets.only(top: 40.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                Text(
                  "AMOUNT TO PAY",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 6.0),
                Text(
                  "\$4,25,000",
                  style: TextStyle(
                    color: kPrimaryColor3,
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.1,
                  ),
                ),
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'AMOUNT PAYED',
                          style: kSubTitlesStyle,
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          '\$75,000',
                          style: kNumberTextStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('DAYS LEFT', style: kSubTitlesStyle),
                        SizedBox(height: 6.0),
                        Text(
                          '10',
                          style: kNumberTextStyle,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('RATE', style: kSubTitlesStyle),
                        SizedBox(height: 6.0),
                        Text(
                          '15%',
                          style: kNumberTextStyle,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 60.0),
                Container(
                  height: 120.0,
                  width: 300,
                  margin:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 3.0),
                          blurRadius: 10),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "LOAN STATUS:",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Text(
                        "ACTIVE",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 150.0,
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          'Request Loan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        elevation: 0.0,
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 150.0,
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          'Pay Loan',
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
                    ),
                  ],
                ),
              ],
            ),
          ),
          //BottomNavigation(),
        ],
      ),
    );
  }
}

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
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "     Seeka",
                          style: TextStyle(
                            fontSize: 50,
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
                // Column(
                //   children: [
                //     Text("How it works",
                //         style: GoogleFonts.poppins(
                //             textStyle: TextStyle(fontSize: 18))),
                //     SizedBox(height: 10),
                //     // categoryCard,
                //     // categoryCard1,
                //     // categoryCard2,
                //     // categoryCard3,
                //     // nextButton,
                //     SizedBox(height: 10),
                //     // dashboard,
                //   ],
                // ),
              ],
            ),
            onTap: () {
              // Update the state of the app

              // Closing the drawer

              //Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
