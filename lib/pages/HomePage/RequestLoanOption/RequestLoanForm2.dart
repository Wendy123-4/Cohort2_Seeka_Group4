import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:summative/controllers/Constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summative/pages/HomePage/DrawerOptions/History.dart';

import 'RequestLoanForm3.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RequestLoanFormTwo extends StatefulWidget {
  final data;
  RequestLoanFormTwo({Key key, this.data}) : super(key:key);
  @override
  _RequestLoanFormTwoState createState() => _RequestLoanFormTwoState();
}

class _RequestLoanFormTwoState extends State<RequestLoanFormTwo> {
  // var myJson = {};
  // var earning,dependantsNumber,occupation;
  var myJson = {};
  var earning,dependantsNumber,occupation, incomeSource;
  @override
  int selectedRadio;

  void initState() {
    super.initState();
    selectedRadio = 0 ;
  }
  setSelectedRadio(int val){
    setState((){
      selectedRadio = val;
      if(selectedRadio==1){
        incomeSource = 'Employed full-time';
      }
      if(selectedRadio==2){
        incomeSource = 'Employed part-time';
      }
      if(selectedRadio==3){
        incomeSource = 'Self-employed';
      }
      if(selectedRadio==4){
        incomeSource = 'Unemployed';
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset : false,
      appBar: AppBar(title: Text("Employment Information"),),
      body: SingleChildScrollView(
        child: Stack(
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
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Padding(padding: EdgeInsets.only(bottom: 20)),

                  // Form Input Widgets
                  Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Main source of income',
                          style: TextStyle(fontSize: 16, color: textColor),
                        ),
                      )),

                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          dense: true,
                          title: const Text(
                            'Employed full-time',
                            style: TextStyle(fontSize: 16, color: textColor),
                          ),
                          leading: Radio(
                              value: 1,
                              groupValue: selectedRadio,
                              onChanged: (val) {print("Radio $val");
                              setSelectedRadio(val);
                              },
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: const Text(
                            'Employed part-time',
                            style: TextStyle(fontSize: 16, color: textColor),
                          ),
                          leading: Radio(
                              value: 2,
                              groupValue: selectedRadio,
                              onChanged: (val) {print("Radio $val");
                              setSelectedRadio(val);
                              },
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: const Text(
                            'Self-employed',
                            style: TextStyle(fontSize: 16, color: textColor),
                          ),
                          leading: Radio(
                              value: 3,
                              groupValue: selectedRadio,
                              onChanged: (val) {
                                print("Radio $val");
                                setSelectedRadio(val);
                              },
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: const Text(
                            'Unemployed',
                            style: TextStyle(fontSize: 16, color: textColor),
                          ),
                          leading: Radio(
                              value: 4,
                              groupValue: selectedRadio,
                              onChanged: (val) {
                                print("Radio $val");
                                setSelectedRadio(val);
                              },
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextFormField(
                      onChanged: (value){
                        occupation = value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Occupation',
                        labelText:
                        'What do you do for a living?*',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextFormField(
                      onChanged: (value){
                        earning = value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Monthly Salary',
                        labelText: 'How much do you earn per month? (in RWF)*',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextFormField(
                      onChanged: (value){
                        dependantsNumber = value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Number of dependants',
                        labelText:
                            'How many people are you supporting financially?*',
                      ),
                    ),
                  ),




                  SizedBox(height: 50),

                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: RaisedButton(
                      onPressed: () {
                          if(earning == null || dependantsNumber == null || occupation == null)
                          {
                          // Put your code here which you want to execute when Text Field is Empty.
                          final snackBar = SnackBar(
                          content: Text('All Textfield data are required'),
                          action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                          // Some code to undo the change.
                          },
                          ),);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);


                          }else{
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {

                                  return RequestLoanFormThree(data: myJson);
                                }));

                          }
                        myJson = {...widget.data, "earning":earning,
                          "dependantsNumber":dependantsNumber,
                        "occupation":occupation,
                        "incomeSource":incomeSource};
                        print(myJson);

                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      elevation: 0.0,
                      color: kPrimaryColor2,
                      padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
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

