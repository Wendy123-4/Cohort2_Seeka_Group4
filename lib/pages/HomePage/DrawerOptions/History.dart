
import 'package:flutter/material.dart';
import 'package:summative/controllers/Constants.dart';
import 'package:google_fonts/google_fonts.dart';

// void main => runApp(HomePage());
class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: new IconButton(icon: new Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: ()
          {int count = 0;
          Navigator.of(context).popUntil((_) => count++ >= 2);
          },
        ),
        centerTitle: true, // this is all you ne
        title: Text(" Transaction History"),),

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
            margin: EdgeInsets.only(top: 20.0),
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
                SizedBox(height: 10),
                Text(
                  "Logs",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 20.0),

                SizedBox(height: 10.0),
                Container(
                  height: 120.0,
                  width: 400,
                  margin:
                  EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
                  padding: EdgeInsets.fromLTRB(20.0,30.0,20.0,20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 3.0),
                        blurRadius: 10
                    ),],
                  ),
                  child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              "Amount Paid: 10000",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.1,
                              ),
                            ),
                            SizedBox(width: 60.0),
                            Text(
                              "Date:",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.0),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Amount left : 30000",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ),
                            SizedBox(width: 60.0),
                            Text(
                              "3/12/2021",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ],

                        ),
                        SizedBox(height: 6.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Rate : 20%",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.1,
                            ),
                          ),
                        ),


                    ],
                  ),

                ),

                SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                ],),
              ],

            ),

          ),
          //BottomNavigation(),
        ],
      ),
    );
  }
}



Widget header= Container(
    margin: EdgeInsets.symmetric(vertical: 70.0),
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            ],
          ),
        ),
      ],
    ),
  );


