
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:summative/controllers/Auth.dart';
import 'package:summative/controllers/Constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../HomePage.dart';

// void main => runApp(HomePage());

final db = Firestore.instance ;


class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    // getuserdata();

    super.initState();
  }

// var time;
// var date;
// DateFormat inputFormat = DateFormat("dd/MM/yyyy");
//   String documentID = useRef.document().documentID;
//   Future <void> getuserdata() async{
//     var firebaseUser = await FirebaseAuth.instance.currentUser();
//     documentID = firebaseUser.uid;
//     final DocumentSnapshot doc = await useRef.document(documentID).get();
//     setState(() {
//
//       time = doc.data['date'].toString();
//       date = inputFormat.parse(time.split(" ")[1].toString());
//
//
//     });
//     //print(deadline);
//   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
          },
        ),
        centerTitle: true, // this is all you ne
        title: Text(" Transaction History"),),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
         Historylist(
            AmountPaid: "Rolex Submariner",
            Amountleft: "Rwf 2,00,000",
            date: "-5%",
            rate: '15%' ,
          ),
          // SizedBox(height: 20.0),
          // Historylist(
          //   AmountPaid: "Rolex Submariner",
          //   Amountleft: "Rwf 2,00,000",
          //   date: "-5%",
          //   rate: '15%' ,
          // ),
        ],
      ),
    );
  }
}




class Historylist extends StatelessWidget {
  Historylist({Key key, this.Amountleft, this.AmountPaid ,this.date, this.rate})
      : super(key: key);
  final String Amountleft;
  final String AmountPaid;
  final String date;
  final String rate;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
        margin: EdgeInsets.fromLTRB(10, 2, 10, 2),

        height: 120,
        child: Card(
          child: Column(
            children: <Widget>[
              SizedBox(height: 6.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "  Amount Paid: ${this.AmountPaid}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),

              SizedBox(height: 6.0, ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "  Amount left : ${this.Amountleft}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),

              SizedBox(height: 6.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  Rate : 15%",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              SizedBox(height: 6.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  Date : ${this.date}",
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

        ));


  }
}

