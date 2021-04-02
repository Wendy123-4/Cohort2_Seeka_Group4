
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summative/pages/Dashboard.dart';
import 'package:summative/controllers/constant.dart';
import 'package:google_fonts/google_fonts.dart';

// void main => runApp(HomePage());
class RequestLoan extends StatefulWidget {
  @override
  _RequestLoanState createState() => _RequestLoanState();
}

class _RequestLoanState extends State<RequestLoan> {
  int _counter = 10000;

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 10000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(icon: new Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: ()
          {Navigator.pop(context);},
        ),
        centerTitle: true, // this is all you ne
        title: Text(" Request a loan "),),

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
                  child: Text('WE', style: TextStyle(fontSize: 25,
                    fontWeight: FontWeight.w500,
                      letterSpacing: 1.1),
                  ),
                ),
                SizedBox(height:10),

            Row(
              children: [
                Text("RWF"),
                Container(
                  child: Flexible(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      style:TextStyle(
                          fontSize: 40.0,
                          color: Colors.black
                      ),
                      decoration: InputDecoration(
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
                      controller: TextEditingController(text: "$_counter"),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
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


