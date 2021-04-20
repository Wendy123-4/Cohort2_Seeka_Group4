
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summative/controllers/Constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

// void main => runApp(HomePage());
class PayLoan extends StatefulWidget {
  @override
  _PayLoanState createState() => _PayLoanState();
}

class _PayLoanState extends State<PayLoan> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: new IconButton(icon: new Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: ()
          {Navigator.pop(context);},
        ),
        centerTitle: true, // this is all you ne
        title: Text(" Payback Loan "),),

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
                      width:155,
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
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) {
                //       return SignIn();
                //     }));
              },
              padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: kPrimaryColor2,
              child: Text(
                "Pay",
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


