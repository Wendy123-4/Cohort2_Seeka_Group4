//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:summative/pages/Authentication/SignIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summative/controllers/Constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:app_info/app_info.dart';
import 'package:summative/pages/HomePage/HomePage.dart';
import 'package:summative/pages/Authentication/SignIn.dart';

import '../../../controllers/Auth.dart';




// void main => runApp(HomePage());
class RequestLoan extends StatefulWidget {
  final data;

  RequestLoan({Key key, this.data}) : super(key: key);

  @override
  _RequestLoanState createState() => _RequestLoanState();
}

class _RequestLoanState extends State<RequestLoan> {
  String userEmail = "";
  int _counter = 10000 ;


  void _incrementCounter() {
    setState(() {
      _counter = _counter + 10000;
    });
  }

  void _incrementReducer() {
    setState(() {
      _counter = _counter - 10000;
    });
  }
  var myJson = {};
  var loanAmount ;




   String UserId;


  CollectionReference users = Firestore.instance.collection('users');




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
  DateTime _now = DateTime.now();
    Widget build(BuildContext context) {

      showAlertDialog(BuildContext context) {

        // set up the button
        Widget okButton = FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {

                  return HomeScreen();}));
          },
        );

        // set up the AlertDialog
        AlertDialog alert = AlertDialog(
          title: Text("Request Processing..."),
          content: Text("Status of request will be updated on your dashboard"),
          actions: [
            okButton,
          ],
        );

        // show the dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }
      void _onLoading() {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: new Container(
                decoration: new BoxDecoration(

                ),
                width: 100,
                height: 100,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(child: new CircularProgressIndicator(value: null,), height: 50,width: 50,),
                    new Text("\nRequesting"),
                  ],
                ),
              ),
            );
          },
        );
        new Future.delayed(new Duration(seconds: 5), () {
          showAlertDialog(context);
        });
      }


      String documentID = users.document().documentID;

      Future<void> addUser1() async {

        //add a specific Doc ID for example
        // firebase auth User ID
         var firebaseUser = await FirebaseAuth.instance.currentUser();
         documentID = firebaseUser.uid;
        users.document(documentID).setData({
          ...myJson
        })           .then((value) => print("User Added"))
                .catchError((error) => print("Failed to add user: $error"));
          }




         return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: new IconButton(icon: new Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: ()
          {Navigator.pop(context);},
        ),
        centerTitle: true, // this is all you ne
        title: Text(" Request Amount "),),

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
                SizedBox(height: 90),
                CircleAvatar(
                  backgroundColor: kGradientColor2,
                  minRadius: 50.0,
                  child: Text(userEmail == "" ? "X" : userEmail[0].toUpperCase(),
                    style: TextStyle(fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.1),
                  ),
                ),
                SizedBox(height:20),


                Row(
                  children: [
                    SizedBox(width: 100,),
                    Text("RWF",
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.black
                      ),),
                    Container(
                      width:200,
                      child: Flexible(
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style:TextStyle(
                              fontSize: 40.0,
                              color: Colors.black
                          ),
                          maxLength: 6,
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: TextEditingController.fromValue(TextEditingValue(text: "$_counter",selection: new TextSelection.collapsed(offset: "$_counter".length))),
                          onChanged: (text){
                            this.setState(() {
                              var $convert = int.parse(text);
                              _counter = $convert ;

                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],

            ),
          ),
          //BottomNavigation(),

          Row(
            children: [
              SizedBox(width: 75),
              Container(
                  alignment: Alignment(0.58, 0.3),
                  child:ElevatedButton(
                    onPressed: _incrementReducer,
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 50.0,
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), primary: Colors.green),
                  )
              ),
              SizedBox(width: 90),
              Container(
                  alignment: Alignment(0.58, 0.3),
                  child:ElevatedButton(
                    onPressed: _incrementCounter,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 50.0,
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), primary: Colors.red),
                  )
              ),
            ],
          ),
          Container(
            alignment: Alignment(0.30, 0.8),
            padding: EdgeInsets.fromLTRB(80, 60, 80, 60),
            width: double.infinity,
            child: RaisedButton(
              elevation: 5,
              onPressed: () {
                //Map<String,dynamic> myJson = json.decode(myJson);


                    setState(() {
                      myJson = {...widget.data, "loanAmount":_counter,
     "date": "timestamp: ${_now.day}/${_now.month}/${_now.year} at ${_now.hour}:${_now.minute}",
                        "AmountPayable": "${(_counter*0.15)+_counter}"
                      };
                    });
                    print(myJson);

                    addUser1();
                    _onLoading();

    },




              padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: kPrimaryColor2,
              child: Text(
                "Request",
                style:
                TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
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


