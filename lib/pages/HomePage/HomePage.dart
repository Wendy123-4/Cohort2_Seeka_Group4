import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summative/controllers/Constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summative/pages/HomePage/DrawerOptions/Help.dart';
import 'package:summative/pages/HomePage/DrawerOptions/History.dart';
import 'package:summative/pages/HomePage/RequestLoanOption/RequestLoanForm.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:summative/pages/Authentication/SignIn.dart';
import 'package:summative/pages/HomePage/PayLoanOption/PayLoan.dart';
import 'package:intl/intl.dart';
// void main => runApp(HomePage());
final FirebaseAuth _auth = FirebaseAuth.instance;
String userEmail = "";

final useRef = Firestore.instance.collection("users");

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override


  void initState() {
    getuserbyid();
    super.initState();

  }



  double AmountPayable = 0;
  double loan = 0;
  double Salary = 0;
  String Amountpayed = '0';
  DateTime  date;
  String time;
  DateTime deadline = DateTime(0);
  DateFormat inputFormat = DateFormat("dd/MM/yyyy");
  //s = DateFormat.jm().format(date)



  String documentID = useRef.document().documentID;
  Future <void> getuserbyid() async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    documentID = firebaseUser.uid;
    final DocumentSnapshot doc = await useRef.document(documentID).get();
     setState(() {
       AmountPayable = double.parse(doc.data['AmountPayable'].toString());
       loan = double.parse(doc.data['loanAmount'].toString());
       Salary = double.parse(doc.data['earning'].toString());
       time = doc.data['date'].toString();
       date = inputFormat.parse(time.split(" ")[1].toString());
       deadline = date.add( Duration(days: 20));
       Amountpayed = doc.data['Amountpayed'].toString();
     });

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      drawer: drawerSection,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
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
            child: header,
          ),

          // The rest of the white body
          Container(
            margin: EdgeInsets.only(top: 140.0),
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
                  "RWF  ${getuserbyid() == null ? '0.0' : (0.2*Salary) < loan ? '0.0' :AmountPayable } ",// ${AmountPayable}", //${getamount() == null ? '0' : Amountpayable }",
                  style: TextStyle(
                    color: kPrimaryColor3,
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.1,
                  ),
                ),
                SizedBox(height: 50.0),

                // Row containing amount payed, days left and rate
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Amount payed",
                          style: kSubTitlesStyle,
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          'RWF $Amountpayed',
                          style: kNumberTextStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('PAYMENT DEADLINE', style: kSubTitlesStyle),
                        SizedBox(height: 6.0),
                        Text(
                          "${(0.2*Salary) > loan ? '${deadline.day}/${deadline.month}/${deadline.year}' : '--' }",
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

                // Margin
                SizedBox(height: 30.0),

                // Loan status card
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
                        "${(0.2*Salary) > loan ? 'ACTIVE' : 'INACTIVE' }",
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

                // Margin
                SizedBox(height: 20.0),

                // Row containing the Request Loan and Pay Loan buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    // Navigating to the Request Loan screen
                    ButtonTheme(
                      minWidth: 150.0,
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RequestLoanForm();
                          }));
                        },
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

                    //Navigating to the PAyLoan screen
                    ButtonTheme(
                      minWidth: 150.0,
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return PayLoan();
                              }));
                        },
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

class NewWidget extends StatefulWidget {


  const NewWidget({
    Key key,
  }) : super(key: key);

  @override
  _NewWidgetState createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test();
  }

 void test(){
   FirebaseAuth.instance.onAuthStateChanged
       .listen((FirebaseUser user) {
     if (user == null) {
       print('User is currently signed out!');
     } else {
       setState(() {
         userEmail = user.email;
       });
     }
   });
 }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            //accountName: Text("Wendy"),
            accountEmail: Text(userEmail),
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                userEmail == "" ? "X" : userEmail[0].toUpperCase(),
                style: TextStyle(fontSize: 40, color: kPrimaryColor),
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
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Help();
              }));
            },
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
                return Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignIn();
                }));
              }
              await _auth.signOut();
              final String uid = user.uid;
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('email');
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SignIn();
              }));
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
